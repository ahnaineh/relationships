import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/gender_resolver.dart';
import '../helpers/notation_generator.dart';
import '../types.dart';

class DirectRelationshipAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
    RelationshipStep step,
  ) {
    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    switch (step) {
      case RelationshipStep.father:
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: Types.maleAscendant,
          path: path,
          generationGap: -1,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: true,
          isBloodRelation: true,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: Gender.male,
            relationType: 'father',
          ),
          lineage: Lineage.paternal,
          metadata: {'isParent': true, 'isFather': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 1,
        );

      case RelationshipStep.mother:
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: Types.femaleAscendant,
          path: path,
          generationGap: -1,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: true,
          isBloodRelation: true,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: Gender.female,
            relationType: 'mother',
          ),
          lineage: Lineage.maternal,
          metadata: {'isParent': true, 'isMother': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 1,
        );

      case RelationshipStep.parent:
        final type = GenderResolver.resolveGenderBasedType(
          target: relativeTo,
          maleType: Types.maleAscendant,
          femaleType: Types.femaleAscendant,
        );
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: type!,
          path: path,
          generationGap: -1,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: true,
          isBloodRelation: true,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: relativeTo.gender,
            relationType: 'parent',
          ),
          lineage: relativeTo.gender == Gender.male
              ? Lineage.paternal
              : relativeTo.gender == Gender.female
              ? Lineage.maternal
              : Lineage.mixed,
          metadata: {'isParent': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 1,
        );

      case RelationshipStep.son:
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: Types.maleDescendant,
          path: path,
          generationGap: 1,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: true,
          isBloodRelation: true,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: Gender.male,
            relationType: 'son',
          ),
          lineage: Lineage.mixed,
          metadata: {'isChild': true, 'isSon': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 1,
        );

      case RelationshipStep.daughter:
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: Types.femaleDescendant,
          path: path,
          generationGap: 1,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: true,
          isBloodRelation: true,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: Gender.female,
            relationType: 'daughter',
          ),
          lineage: Lineage.mixed,
          metadata: {'isChild': true, 'isDaughter': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 1,
        );

      case RelationshipStep.child:
        final type = GenderResolver.resolveGenderBasedType(
          target: relativeTo,
          maleType: Types.maleDescendant,
          femaleType: Types.femaleDescendant,
        );
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: type!,
          path: path,
          generationGap: 1,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: true,
          isBloodRelation: true,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: relativeTo.gender,
            relationType: 'child',
          ),
          lineage: Lineage.mixed,
          metadata: {'isChild': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 1,
        );

      case RelationshipStep.husband:
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: Types.husband,
          path: path,
          generationGap: 0,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: false,
          isBloodRelation: false,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: Gender.male,
            relationType: 'husband',
          ),
          lineage: Lineage.none,
          metadata: {'isSpouse': true, 'isHusband': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 0,
        );

      case RelationshipStep.wife:
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: Types.wife,
          path: path,
          generationGap: 0,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: false,
          isBloodRelation: false,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: Gender.female,
            relationType: 'wife',
          ),
          lineage: Lineage.none,
          metadata: {'isSpouse': true, 'isWife': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 0,
        );

      case RelationshipStep.spouse:
        final type = GenderResolver.resolveGenderBasedType(
          target: relativeTo,
          maleType: Types.husband,
          femaleType: Types.wife,
        );
        return Relationship(
          subject: subject,
          relativeTo: relativeTo,
          type: type!,
          path: path,
          generationGap: 0,
          genderPath: genderPath,
          stepPath: path.steps,
          isDirect: false,
          isBloodRelation: false,
          detailedDescription: DetailedDescriptionBuilder.buildDirectRelationship(
            gender: relativeTo.gender,
            relationType: 'spouse',
          ),
          lineage: Lineage.none,
          metadata: {'isSpouse': true},
          genealogyNotation: genealogyNotation,
          relationshipDegree: 0,
        );
    }
  }
}
