import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/lineage_analyzer.dart';
import '../helpers/notation_generator.dart';
import '../helpers/sibling_helper.dart';
import '../types.dart';

class CousinAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    // Path is: subject -> parent -> grandparent -> aunt/uncle -> cousin (relativeTo)
    if (path.path.length < 4) return null;

    final parent = path.path[1];
    final auntUncle = path.path[3];
    final isPaternal = parent.gender == Gender.male;
    final siblingType = SiblingHelper.getSiblingType(parent, auntUncle);

    if (siblingType == SiblingType.none) return null;

    // Map cousin types based on paternal/maternal line, sibling type, and gender
    final typeMap = <(bool isPaternal, SiblingType type, Gender gender), Types>{
      // Paternal male cousins
      (true, SiblingType.full, Gender.male): Types.paternalMaleCousin,
      (true, SiblingType.paternalHalf, Gender.male):
          Types.paternalPaternalHalfMaleCousin,
      (true, SiblingType.maternalHalf, Gender.male):
          Types.paternalMaternalHalfMaleCousin,
      // Paternal female cousins
      (true, SiblingType.full, Gender.female): Types.paternalFemaleCousin,
      (true, SiblingType.paternalHalf, Gender.female):
          Types.paternalPaternalHalfFemaleCousin,
      (true, SiblingType.maternalHalf, Gender.female):
          Types.paternalMaternalHalfFemaleCousin,
      // Maternal male cousins
      (false, SiblingType.full, Gender.male): Types.maternalMaleCousin,
      (false, SiblingType.paternalHalf, Gender.male):
          Types.maternalPaternalHalfMaleCousin,
      (false, SiblingType.maternalHalf, Gender.male):
          Types.maternalMaternalHalfMaleCousin,
      // Maternal female cousins
      (false, SiblingType.full, Gender.female): Types.maternalFemaleCousin,
      (false, SiblingType.paternalHalf, Gender.female):
          Types.maternalPaternalHalfFemaleCousin,
      (false, SiblingType.maternalHalf, Gender.female):
          Types.maternalMaternalHalfFemaleCousin,
    };

    final type = typeMap[(isPaternal, siblingType, relativeTo.gender)];
    if (type == null) return null;

    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    // Build detailed description using DetailedDescriptionBuilder
    final detailedDescription = DetailedDescriptionBuilder.buildCousinDescription(
      gender: relativeTo.gender,
      isPaternal: isPaternal,
      siblingType: siblingType,
    );

    // Find common ancestor (grandparent)
    final commonAncestor = path.path.length > 2 ? path.path[2] : null;

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: type,
      path: path,
      generationGap: 0, // Cousins are same generation
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: detailedDescription,
      lineage: isPaternal ? Lineage.paternal : Lineage.maternal,
      metadata: {
        'isCousin': true,
        'cousinDegree': 1, // First cousin
        'siblingType': siblingType.name,
        'throughParent': parent.name,
        'throughAuntUncle': auntUncle.name,
        'commonAncestor': commonAncestor?.name,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 4,
    );
  }

  static Relationship? analyzeCousinOnceRemoved(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
    bool isOlderGeneration,
  ) {
    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    final isMale = relativeTo.gender == Gender.male;
    final gender = isMale ? 'male' : 'female';
    final generation = isOlderGeneration
        ? 'older generation'
        : 'younger generation';

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person, // No specific enum for cousin once removed
      path: path,
      generationGap: isOlderGeneration ? -1 : 1,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: 'first cousin once removed ($gender, $generation)',
      lineage: LineageAnalyzer.analyzeLineage(subject, relativeTo, path),
      metadata: {
        'isCousinOnceRemoved': true,
        'cousinDegree': 1,
        'removedDegree': 1,
        'isOlderGeneration': isOlderGeneration,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 5,
    );
  }

  static Relationship? analyzeSecondCousin(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    final isMale = relativeTo.gender == Gender.male;
    final gender = isMale ? 'male' : 'female';

    // Find common ancestor (great-grandparent)
    final commonAncestor = path.path.length > 3 ? path.path[3] : null;

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person, // No specific enum for second cousin
      path: path,
      generationGap: 0, // Same generation
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: 'second cousin ($gender)',
      lineage: LineageAnalyzer.analyzeLineage(subject, relativeTo, path),
      metadata: {
        'isSecondCousin': true,
        'cousinDegree': 2,
        'commonAncestor': commonAncestor?.name,
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 6,
    );
  }
}
