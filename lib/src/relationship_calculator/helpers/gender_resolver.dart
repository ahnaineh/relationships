import '../../core/person.dart';
import '../types.dart';

class GenderResolver {
  static Types? resolveGenderBasedType({
    required Person target,
    required Types maleType,
    required Types femaleType,
    Types? khunthaType,
  }) {
    switch (target.gender) {
      case Gender.male:
        return maleType;
      case Gender.female:
        return femaleType;
      case Gender.khuntha:
        return khunthaType;
    }
  }
}
