import '../../core/person.dart';
import '../core/sibling_type.dart';

class SiblingHelper {
  static SiblingType getSiblingType(Person person1, Person person2) {
    if (person1 == person2) return SiblingType.none;

    final sameFather =
        person1.father != null && person1.father == person2.father;
    final sameMother =
        person1.mother != null && person1.mother == person2.mother;

    if (sameFather && sameMother) return SiblingType.full;
    if (sameFather) return SiblingType.paternalHalf;
    if (sameMother) return SiblingType.maternalHalf;
    return SiblingType.none;
  }
}
