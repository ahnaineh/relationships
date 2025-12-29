import 'package:relationships/i18n/strings.g.dart';
import 'package:relationships/relationships.dart';
import 'package:test/test.dart';

void main() {
  group('Relationship descriptions', () {
    setUp(() {
      LocaleSettings.setLocale(AppLocale.en);
    });

    test('Descendant relationships include path descriptions', () {
      final grandfather = Person(name: 'Grandfather', gender: Gender.male);
      final father = Person(name: 'Father', gender: Gender.male);
      final son = Person(name: 'Son', gender: Gender.male);
      final daughter = Person(name: 'Daughter', gender: Gender.female);
      final granddaughter = Person(name: 'Granddaughter', gender: Gender.female);

      grandfather.addChild(father);
      father.addChild(son);
      father.addChild(daughter);
      son.addChild(granddaughter);

      final grandsonRel = RelationshipCalculator.calculateRelationship(
        grandfather,
        son,
      );
      expect(grandsonRel, isNotNull);
      expect(grandsonRel!.detailedDescription, contains("son's son"));

      final granddaughterRel = RelationshipCalculator.calculateRelationship(
        grandfather,
        granddaughter,
      );
      expect(granddaughterRel, isNotNull);
      expect(granddaughterRel!.detailedDescription, contains("son's daughter"));
    });

    test('Extended relationships avoid generic labels when possible', () {
      final greatGrandfather = Person(name: 'Great-Grandfather', gender: Gender.male);
      final grandfather = Person(name: 'Grandfather', gender: Gender.male);
      final father = Person(name: 'Father', gender: Gender.male);
      final uncle = Person(name: 'Uncle', gender: Gender.male);
      final brother = Person(name: 'Brother', gender: Gender.male);
      final cousinSon = Person(name: 'Cousin Son', gender: Gender.male);

      greatGrandfather.addChild(grandfather);
      grandfather.addChild(father);
      grandfather.addChild(uncle);
      father.addChild(brother);
      uncle.addChild(cousinSon);

      final rel = RelationshipCalculator.calculateRelationship(brother, cousinSon);
      expect(rel, isNotNull);
      expect(rel!.detailedDescription, isNot(equals(t.relationships.special.extendedFamily)));
    });

    test('Translations are available for multiple locales', () {
      LocaleSettings.setLocale(AppLocale.ar);
      expect(t.relationships.base.father.isNotEmpty, isTrue);

      LocaleSettings.setLocale(AppLocale.en);
      expect(t.relationships.base.father, equals('father'));
    });
  });
}
