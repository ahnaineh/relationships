import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/gender_resolver.dart';
import '../helpers/lineage_analyzer.dart';
import '../helpers/notation_generator.dart';
import '../helpers/path_description_builder.dart';
import '../types.dart';

class AscendantAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    final type = GenderResolver.resolveGenderBasedType(
      target: relativeTo,
      maleType: Types.maleAscendant,
      femaleType: Types.femaleAscendant,
      khunthaType: Types.person,
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
    final generationGap = -path.steps.length;

    // Analyze lineage
    final lineage = LineageAnalyzer.analyzeLineage(subject, relativeTo, path);

    // Build path description for grandparents and beyond
    String? pathDesc;
    if (-generationGap >= 2 && path.steps.isNotEmpty) {
      pathDesc = PathDescriptionBuilder.buildAscendantPathDescription(
        path.steps,
      );
    }

    // Build the detailed description
    final detailedDescription =
        DetailedDescriptionBuilder.buildAscendantDescription(
          generationGap: generationGap,
          gender: relativeGender,
          lineage: lineage,
          pathDescription: pathDesc,
        );

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: type!,
      path: path,
      generationGap: generationGap,
      genderPath: genderPath,
      stepPath: path.steps,
      isDirect: true,
      isBloodRelation: true,
      detailedDescription: detailedDescription,
      lineage: lineage,
      metadata: {'isAscendant': true, 'generationLevel': -generationGap},
      genealogyNotation: genealogyNotation,
      relationshipDegree: -generationGap,
    );
  }
}
