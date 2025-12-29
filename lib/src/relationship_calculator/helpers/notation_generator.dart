import '../../core/person.dart';
import '../core/relationship_step.dart';

class NotationGenerator {
  static String generateGenealogyNotation(
    List<RelationshipStep> steps,
    List<Gender> genderPath,
  ) {
    if (steps.isEmpty) return '';

    final notation = StringBuffer();
    for (var i = 0; i < steps.length; i++) {
      final step = steps[i];
      final gender = i < genderPath.length ? genderPath[i] : null;

      switch (step) {
        case RelationshipStep.father:
        case RelationshipStep.parent when gender == Gender.male:
          notation.write('F');
          break;
        case RelationshipStep.mother:
        case RelationshipStep.parent when gender == Gender.female:
          notation.write('M');
          break;
        case RelationshipStep.son:
        case RelationshipStep.child when gender == Gender.male:
          notation.write('S');
          break;
        case RelationshipStep.daughter:
        case RelationshipStep.child when gender == Gender.female:
          notation.write('D');
          break;
        case RelationshipStep.husband:
        case RelationshipStep.spouse when gender == Gender.male:
          notation.write('H');
          break;
        case RelationshipStep.wife:
        case RelationshipStep.spouse when gender == Gender.female:
          notation.write('W');
          break;
        case RelationshipStep.parent:
          notation.write('P');
          break;
        case RelationshipStep.child:
          notation.write('C');
          break;
        case RelationshipStep.spouse:
          notation.write('SP');
          break;
      }
    }
    return notation.toString();
  }
}
