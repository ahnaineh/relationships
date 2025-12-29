import '../../core/person.dart';
import '../core/lineage.dart';
import '../core/relationship_path.dart';
import '../core/relationship_step.dart';

class LineageAnalyzer {
  static Lineage analyzeLineage(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
  ) {
    if (path.steps.isEmpty ||
        path.steps.any(
          (s) =>
              s == RelationshipStep.spouse ||
              s == RelationshipStep.husband ||
              s == RelationshipStep.wife,
        )) {
      return Lineage.none;
    }

    // Check if path is purely through fathers (paternal)
    bool hasOnlyFathers = true;
    bool hasOnlyMothers = true;

    for (final step in path.steps) {
      if (step == RelationshipStep.mother ||
          (step != RelationshipStep.father &&
              step != RelationshipStep.son &&
              step != RelationshipStep.daughter &&
              step != RelationshipStep.child)) {
        hasOnlyFathers = false;
      }
      if (step == RelationshipStep.father ||
          (step != RelationshipStep.mother &&
              step != RelationshipStep.son &&
              step != RelationshipStep.daughter &&
              step != RelationshipStep.child)) {
        hasOnlyMothers = false;
      }
    }

    if (hasOnlyFathers && path.steps.contains(RelationshipStep.father)) {
      return Lineage.paternal;
    }
    if (hasOnlyMothers && path.steps.contains(RelationshipStep.mother)) {
      return Lineage.maternal;
    }

    // For siblings, aunts/uncles, cousins - check through which parent
    if (path.steps.isNotEmpty) {
      final firstParentStep = path.steps.firstWhere(
        (s) =>
            s == RelationshipStep.father ||
            s == RelationshipStep.mother ||
            s == RelationshipStep.parent,
        orElse: () => RelationshipStep.parent,
      );

      if (firstParentStep == RelationshipStep.father) {
        return Lineage.paternal;
      } else if (firstParentStep == RelationshipStep.mother) {
        return Lineage.maternal;
      }
    }

    return Lineage.mixed;
  }
}
