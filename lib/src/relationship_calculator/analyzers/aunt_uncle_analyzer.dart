import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/notation_generator.dart';
import '../helpers/sibling_helper.dart';
import '../types.dart';

class AuntUncleAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    // Path is: subject -> parent -> grandparent -> aunt/uncle (relativeTo)
    if (path.path.length < 2) return null;

    final parent = path.path[1];
    final isPaternal = parent.gender == Gender.male;
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

    final type = typeMap[(isPaternal, siblingType, relativeTo.gender)];
    if (type == null) return null;

    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    // Build detailed description using DetailedDescriptionBuilder
    final detailedDescription = DetailedDescriptionBuilder.buildAuntUncleDescription(
      gender: relativeTo.gender,
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
        'parentGender': parent.gender.name,
        'throughParent': parent.name,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 3,
    );
  }

  static Relationship? analyzeGreatAuntUncle(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    if (path.path.length < 3) return null;

    final parent = path.path[1];
    final isPaternal = parent.gender == Gender.male;
    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    final isMale = relativeTo.gender == Gender.male;
    final baseRole = isMale ? 'great-uncle' : 'great-aunt';
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
