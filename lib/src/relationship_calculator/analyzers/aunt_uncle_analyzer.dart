import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/gender_resolver.dart';
import '../helpers/notation_generator.dart';
import '../helpers/sibling_helper.dart';
import '../types.dart';

class AuntUncleAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    // Path is: subject -> parent -> grandparent -> aunt/uncle (relativeTo)
    if (path.path.length < 2) return null;

    final parent = path.path[1];
    final parentGender = GenderResolver.resolveGender(
      target: parent,
      genderOverrides: genderOverrides,
    );
    final relativeGender = GenderResolver.resolveGender(
      target: relativeTo,
      genderOverrides: genderOverrides,
    );
    final isPaternal = parentGender == Gender.male;
    final siblingType = SiblingHelper.getSiblingType(parent, relativeTo);

    if (siblingType == SiblingType.none) return null;

    // Map sibling types to relationship types based on paternal/maternal and gender
    final typeMap = <(bool isPaternal, SiblingType type, Gender gender), Types>{
      // Paternal uncles
      (true, SiblingType.full, Gender.male): Types.paternalUncle,
      (true, SiblingType.paternalHalf, Gender.male):
          Types.paternalPaternalHalfUncle,
      (true, SiblingType.maternalHalf, Gender.male):
          Types.paternalMaternalHalfUncle,
      // Paternal aunts
      (true, SiblingType.full, Gender.female): Types.paternalAunt,
      (true, SiblingType.paternalHalf, Gender.female):
          Types.paternalPaternalHalfAunt,
      (true, SiblingType.maternalHalf, Gender.female):
          Types.paternalMaternalHalfAunt,
      // Maternal uncles
      (false, SiblingType.full, Gender.male): Types.maternalUncle,
      (false, SiblingType.paternalHalf, Gender.male):
          Types.maternalPaternalHalfUncle,
      (false, SiblingType.maternalHalf, Gender.male):
          Types.maternalMaternalHalfUncle,
      // Maternal aunts
      (false, SiblingType.full, Gender.female): Types.maternalAunt,
      (false, SiblingType.paternalHalf, Gender.female):
          Types.maternalPaternalHalfAunt,
      (false, SiblingType.maternalHalf, Gender.female):
          Types.maternalMaternalHalfAunt,
    };

    var type = typeMap[(isPaternal, siblingType, relativeGender)];
    if (type == null && relativeGender == Gender.khuntha) {
      type = Types.person;
    }
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
    final detailedDescription =
        DetailedDescriptionBuilder.buildAuntUncleDescription(
          gender: relativeGender,
          isPaternal: isPaternal,
          siblingType: siblingType,
        );

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: type,
      path: path,
      generationGap: -1,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: detailedDescription,
      lineage: isPaternal ? Lineage.paternal : Lineage.maternal,
      metadata: {
        'isAuntUncle': true,
        'siblingType': siblingType.name,
        'parentGender': parentGender.name,
        'throughParent': parent.name,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 3,
    );
  }

  static Relationship? analyzeGreatAuntUncle(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    if (path.path.length < 3) return null;

    final parent = path.path[1];
    final parentGender = GenderResolver.resolveGender(
      target: parent,
      genderOverrides: genderOverrides,
    );
    final relativeGender = GenderResolver.resolveGender(
      target: relativeTo,
      genderOverrides: genderOverrides,
    );
    final isPaternal = parentGender == Gender.male;
    final genderPath = GenderResolver.resolveGenderPath(
      path: path.path,
      genderOverrides: genderOverrides,
    );
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    final isMale = relativeGender == Gender.male;
    final baseRole = relativeGender == Gender.khuntha
        ? 'great-aunt/uncle'
        : isMale
        ? 'great-uncle'
        : 'great-aunt';
    final lineage = isPaternal ? 'paternal' : 'maternal';
    final detailedDescription = '$lineage $baseRole';

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person, // No specific enum for great-aunt/uncle
      path: path,
      generationGap: -2,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: detailedDescription,
      lineage: isPaternal ? Lineage.paternal : Lineage.maternal,
      metadata: {'isGreatAuntUncle': true, 'generationLevel': 2},
      genealogyNotation: genealogyNotation,
      relationshipDegree: 4,
    );
  }
}
