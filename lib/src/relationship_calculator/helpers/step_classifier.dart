import '../core/relationship_step.dart';

class StepClassifier {
  static bool isParentStep(RelationshipStep s) =>
      s == RelationshipStep.parent ||
      s == RelationshipStep.father ||
      s == RelationshipStep.mother;

  static bool isChildStep(RelationshipStep s) =>
      s == RelationshipStep.child ||
      s == RelationshipStep.son ||
      s == RelationshipStep.daughter;

  static bool isSpouseStep(RelationshipStep s) =>
      s == RelationshipStep.spouse ||
      s == RelationshipStep.husband ||
      s == RelationshipStep.wife;
}
