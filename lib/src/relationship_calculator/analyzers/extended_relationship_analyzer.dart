import '../../core/person.dart';
import '../core/core.dart';
import '../helpers/detailed_description_builder.dart';
import '../helpers/generation_gap_calculator.dart';
import '../helpers/lineage_analyzer.dart';
import '../helpers/notation_generator.dart';
import '../helpers/path_description_builder.dart';
import '../helpers/step_classifier.dart';
import '../types.dart';
import 'ascendant_analyzer.dart';
import 'aunt_uncle_analyzer.dart';
import 'cousin_analyzer.dart';
import 'descendant_analyzer.dart';
import 'niece_nephew_analyzer.dart';

class ExtendedRelationshipAnalyzer {
  static Relationship? analyze(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
    List<RelationshipStep> steps,
  ) {
    // All ascendants (any number of parent steps)
    if (steps.every(StepClassifier.isParentStep)) {
      return AscendantAnalyzer.analyze(subject, relativeTo, path);
    }

    // All descendants (any number of child steps)
    if (steps.every(StepClassifier.isChildStep)) {
      return DescendantAnalyzer.analyze(subject, relativeTo, path);
    }

    // Great-aunt/uncle (parent -> parent -> parent -> child)
    if (steps.length == 4 &&
        StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1]) &&
        StepClassifier.isParentStep(steps[2]) &&
        StepClassifier.isChildStep(steps[3])) {
      return AuntUncleAnalyzer.analyzeGreatAuntUncle(subject, relativeTo, path);
    }

    // Grand-nephew/niece (parent -> child -> child -> child)
    if (steps.length == 4 &&
        StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isChildStep(steps[1]) &&
        StepClassifier.isChildStep(steps[2]) &&
        StepClassifier.isChildStep(steps[3])) {
      return NieceNephewAnalyzer.analyzeGrandNephewNiece(
        subject,
        relativeTo,
        path,
      );
    }

    // First cousin once removed (up) - parent -> parent -> parent -> child -> child
    if (steps.length == 5 &&
        StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1]) &&
        StepClassifier.isParentStep(steps[2]) &&
        StepClassifier.isChildStep(steps[3]) &&
        StepClassifier.isChildStep(steps[4])) {
      return CousinAnalyzer.analyzeCousinOnceRemoved(
        subject,
        relativeTo,
        path,
        true,
      );
    }

    // First cousin once removed (down) - parent -> parent -> child -> child -> child
    if (steps.length == 5 &&
        StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1]) &&
        StepClassifier.isChildStep(steps[2]) &&
        StepClassifier.isChildStep(steps[3]) &&
        StepClassifier.isChildStep(steps[4])) {
      return CousinAnalyzer.analyzeCousinOnceRemoved(
        subject,
        relativeTo,
        path,
        false,
      );
    }

    // Second cousin - parent -> parent -> parent -> child -> child -> child
    if (steps.length == 6 &&
        StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1]) &&
        StepClassifier.isParentStep(steps[2]) &&
        StepClassifier.isChildStep(steps[3]) &&
        StepClassifier.isChildStep(steps[4]) &&
        StepClassifier.isChildStep(steps[5])) {
      return CousinAnalyzer.analyzeSecondCousin(subject, relativeTo, path);
    }

    // For any other complex relationships that don't match specific patterns,
    // build a detailed path description
    final genderPath = path.path.map((p) => p.gender).toList();

    // Generate a detailed path-based description for the relationship
    final pathDescription = PathDescriptionBuilder.buildExtendedPathDescription(steps);

    // Use the path description if available, otherwise fall back to generic
    final detailedDescription = pathDescription.isNotEmpty
        ? pathDescription
        : DetailedDescriptionBuilder.buildSpecialRelationship('distantRelative');

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person,
      path: path,
      generationGap: GenerationGapCalculator.calculateGenerationGap(steps),
      genderPath: genderPath,
      stepPath: steps,
      isDirect: false,
      isBloodRelation: !steps.any(StepClassifier.isSpouseStep),
      detailedDescription: detailedDescription,
      lineage: LineageAnalyzer.analyzeLineage(subject, relativeTo, path),
      metadata: {'relationshipLength': steps.length},
      genealogyNotation: NotationGenerator.generateGenealogyNotation(
        steps,
        genderPath,
      ),
      relationshipDegree: steps.length,
    );
  }
}
