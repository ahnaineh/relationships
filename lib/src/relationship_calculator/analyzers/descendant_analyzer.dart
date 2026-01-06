import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/gender_resolver.dart';
import '../helpers/notation_generator.dart';
import '../helpers/path_description_builder.dart';
import '../types.dart';

class DescendantAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    final type = GenderResolver.resolveGenderBasedType(
      target: relativeTo,
      maleType: Types.maleDescendant,
      femaleType: Types.femaleDescendant,
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
    final generationGap = path.steps.length;

    // Build the detailed description with path information
    final basicDescription = DetailedDescriptionBuilder.buildDescendantDescription(
      generationGap: generationGap,
      gender: relativeGender,
    );

    // Add path description for generation 2+ descendants (e.g., "son's daughter")
    final pathDescription = generationGap >= 2
        ? PathDescriptionBuilder.buildDescendantPathDescription(path.steps)
        : '';

    final detailedDescription = pathDescription.isNotEmpty
        ? '$basicDescription ($pathDescription)'
        : basicDescription;

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
      lineage: Lineage.mixed, // Descendants can be from any line
      metadata: {'isDescendant': true, 'generationLevel': generationGap},
      genealogyNotation: genealogyNotation,
      relationshipDegree: generationGap,
    );
  }
}
