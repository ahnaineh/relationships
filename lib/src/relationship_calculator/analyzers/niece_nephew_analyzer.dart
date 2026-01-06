import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/gender_resolver.dart';
import '../helpers/notation_generator.dart';
import '../helpers/sibling_helper.dart';
import '../types.dart';

class NieceNephewAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    // Path is: subject -> parent -> sibling -> niece/nephew (relativeTo)
    if (path.path.length < 3) return null;

    final sibling = path.path[2];
    final siblingType = SiblingHelper.getSiblingType(subject, sibling);

    if (siblingType == SiblingType.none) return null;

    final siblingGender = GenderResolver.resolveGender(
      target: sibling,
      genderOverrides: genderOverrides,
    );
    final relativeGender = GenderResolver.resolveGender(
      target: relativeTo,
      genderOverrides: genderOverrides,
    );

    // Map sibling types and genders to relationship types
    final typeMap =
        <(SiblingType type, Gender siblingGender, Gender targetGender), Types>{
          // Nephews through brother
          (SiblingType.full, Gender.male, Gender.male): Types.fraternalNephew,
          (SiblingType.paternalHalf, Gender.male, Gender.male):
              Types.paternalFraternalHalfNephew,
          (SiblingType.maternalHalf, Gender.male, Gender.male):
              Types.maternalFraternalHalfNephew,
          // Nephews through sister
          (SiblingType.full, Gender.female, Gender.male): Types.sororalNephew,
          (SiblingType.paternalHalf, Gender.female, Gender.male):
              Types.paternalSororalHalfNephew,
          (SiblingType.maternalHalf, Gender.female, Gender.male):
              Types.maternalSororalHalfNephew,
          // Nieces through brother
          (SiblingType.full, Gender.male, Gender.female): Types.fraternalNiece,
          (SiblingType.paternalHalf, Gender.male, Gender.female):
              Types.paternalFraternalHalfNiece,
          (SiblingType.maternalHalf, Gender.male, Gender.female):
              Types.maternalFraternalHalfNiece,
          // Nieces through sister
          (SiblingType.full, Gender.female, Gender.female): Types.sororalNiece,
          (SiblingType.paternalHalf, Gender.female, Gender.female):
              Types.paternalSororalHalfNiece,
          (SiblingType.maternalHalf, Gender.female, Gender.female):
              Types.maternalSororalHalfNiece,
        };

    final type = typeMap[(siblingType, siblingGender, relativeGender)];
    if (type == null) return null;

    final genderPath = GenderResolver.resolveGenderPath(
      path: path.path,
      genderOverrides: genderOverrides,
    );
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    // Build detailed description using DetailedDescriptionBuilder
    final detailedDescription = DetailedDescriptionBuilder.buildNieceNephewDescription(
      gender: relativeGender,
      siblingType: siblingType,
      isBrothersSide: siblingGender == Gender.male,
    );

    // Determine lineage based on sibling type
    Lineage lineage;
    if (siblingType == SiblingType.paternalHalf) {
      lineage = Lineage.paternal;
    } else if (siblingType == SiblingType.maternalHalf) {
      lineage = Lineage.maternal;
    } else {
      lineage = Lineage.mixed;
    }

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: type,
      path: path,
      generationGap: 1,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: detailedDescription,
      lineage: lineage,
      metadata: {
        'isNieceNephew': true,
        'siblingType': siblingType.name,
        'throughSibling': sibling.name,
        'throughSiblingGender': siblingGender.name,
        'isFraternal': siblingGender == Gender.male,
        'isSororal': siblingGender == Gender.female,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 3,
    );
  }

  static Relationship? analyzeGrandNephewNiece(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    if (path.path.length < 3) return null;

    final sibling = path.path[2];
    final siblingType = SiblingHelper.getSiblingType(subject, sibling);
    if (siblingType == SiblingType.none) return null;

    final siblingGender = GenderResolver.resolveGender(
      target: sibling,
      genderOverrides: genderOverrides,
    );
    final relativeGender = GenderResolver.resolveGender(
      target: relativeTo,
      genderOverrides: genderOverrides,
    );
    final genderPath = GenderResolver.resolveGenderPath(
      path: path.path,
      genderOverrides: genderOverrides,
    );
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    final isMale = relativeGender == Gender.male;
    final baseRole = isMale ? 'grand-nephew' : 'grand-niece';
    final throughBrother = siblingGender == Gender.male;
    final throughType = throughBrother ? 'brother' : 'sister';

    String siblingDesc = '';
    switch (siblingType) {
      case SiblingType.full:
        siblingDesc = throughType;
        break;
      case SiblingType.paternalHalf:
        siblingDesc = 'paternal half-$throughType';
        break;
      case SiblingType.maternalHalf:
        siblingDesc = 'maternal half-$throughType';
        break;
      case SiblingType.none:
        break;
    }

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person, // No specific enum for grand-nephew/niece
      path: path,
      generationGap: 2,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: '$baseRole (through $siblingDesc)',
      lineage: siblingType == SiblingType.paternalHalf
          ? Lineage.paternal
          : siblingType == SiblingType.maternalHalf
          ? Lineage.maternal
          : Lineage.mixed,
      metadata: {
        'isGrandNephewNiece': true,
        'siblingType': siblingType.name,
        'throughSibling': sibling.name,
        'generationLevel': 2,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 4,
    );
  }
}
