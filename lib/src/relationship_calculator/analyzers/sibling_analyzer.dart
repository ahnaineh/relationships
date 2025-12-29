import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/gender_resolver.dart';
import '../helpers/notation_generator.dart';
import '../helpers/sibling_helper.dart';
import '../types.dart';

class SiblingAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    final siblingType = SiblingHelper.getSiblingType(subject, relativeTo);
    if (siblingType == SiblingType.none) return null;

    final baseTypes = <SiblingType, (Types male, Types female)>{
      SiblingType.full: (Types.fullBrother, Types.fullSister),
      SiblingType.paternalHalf: (
        Types.paternalHalfBrother,
        Types.paternalHalfSister,
      ),
      SiblingType.maternalHalf: (
        Types.maternalHalfBrother,
        Types.maternalHalfSister,
      ),
    };

    final types = baseTypes[siblingType];
    if (types == null) return null;

    final type = GenderResolver.resolveGenderBasedType(
      target: relativeTo,
      maleType: types.$1,
      femaleType: types.$2,
    );

    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    // Build the detailed description
    final detailedDescription = DetailedDescriptionBuilder.buildSiblingDescription(
      gender: relativeTo.gender,
      siblingType: siblingType,
    );

    // Determine lineage for half-siblings
    Lineage lineage;
    if (siblingType == SiblingType.full) {
      lineage = Lineage.mixed;
    } else if (siblingType == SiblingType.paternalHalf) {
      lineage = Lineage.paternal;
    } else {
      lineage = Lineage.maternal;
    }

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: type!,
      path: path,
      generationGap: 0,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: true,
      detailedDescription: detailedDescription,
      lineage: lineage,
      metadata: {
        'isSibling': true,
        'siblingType': siblingType.name,
        'sharedParent': siblingType == SiblingType.paternalHalf
            ? 'father'
            : siblingType == SiblingType.maternalHalf
            ? 'mother'
            : 'both',
      },
      genealogyNotation: genealogyNotation,
      relationshipDegree: 2,
    );
  }

  static Relationship? analyzeStepChild(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    final type = GenderResolver.resolveGenderBasedType(
      target: relativeTo,
      maleType: Types.maleDescendant,
      femaleType: Types.femaleDescendant,
    );

    final genderPath = path.path.map((p) => p.gender).toList();
    final genealogyNotation = NotationGenerator.generateGenealogyNotation(
      path.steps,
      genderPath,
    );

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: type!,
      path: path,
      generationGap: 1,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: false,
      isBloodRelation: false,
      detailedDescription: DetailedDescriptionBuilder.buildStepChildDescription(relativeTo.gender),
      lineage: Lineage.none,
      metadata: {'isStepChild': true, 'throughSpouse': path.path[1].name},
      genealogyNotation: genealogyNotation,
      relationshipDegree: 1,
    );
  }
}
