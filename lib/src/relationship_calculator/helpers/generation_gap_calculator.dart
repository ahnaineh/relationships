import '../core/relationship_step.dart';

class GenerationGapCalculator {
  static int calculateGenerationGap(List<RelationshipStep> steps) {
    int gap = 0;
    for (final step in steps) {
      if (step == RelationshipStep.parent ||
          step == RelationshipStep.father ||
          step == RelationshipStep.mother) {
        gap--;
      }
      if (step == RelationshipStep.child ||
          step == RelationshipStep.son ||
          step == RelationshipStep.daughter) {
        gap++;
      }
    }
    return gap;
  }
}
