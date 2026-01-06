import '../../core/person.dart';
import '../types.dart';

class GenderResolver {
  static Gender resolveGender({
    required Person target,
    Map<String, Gender>? genderOverrides,
  }) {
    return genderOverrides?[target.id] ?? target.gender;
  }

  static List<Gender> resolveGenderPath({
    required List<Person> path,
    Map<String, Gender>? genderOverrides,
  }) {
    return path
        .map(
          (person) => resolveGender(
            target: person,
            genderOverrides: genderOverrides,
          ),
        )
        .toList();
  }

  static Types? resolveGenderBasedType({
    required Person target,
    required Types maleType,
    required Types femaleType,
    Types? khunthaType,
    Map<String, Gender>? genderOverrides,
  }) {
    switch (resolveGender(target: target, genderOverrides: genderOverrides)) {
      case Gender.male:
        return maleType;
      case Gender.female:
        return femaleType;
      case Gender.khuntha:
        return khunthaType;
    }
  }
}
