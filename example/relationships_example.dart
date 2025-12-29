import 'package:relationships/i18n/strings.g.dart';
import 'package:relationships/relationships.dart';

void main() {
  LocaleSettings.setLocale(AppLocale.en);

  final father = Person(name: 'H', gender: Gender.male);
  final daughter = Person(name: 'D', gender: Gender.female);

  father.addChild(daughter);

  final relationship = RelationshipCalculator.calculateRelationship(father, daughter);
  if (relationship == null) {
    print('No relationship found.');
    return;
  }

  print('Relationship: ${relationship.detailedDescription}');
}
