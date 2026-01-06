import 'package:relationships/i18n/strings.g.dart';
import 'package:relationships/relationships.dart';
import 'package:test/test.dart';

void main() {
  group('Relationship descriptions', () {
    setUp(() async {
      await LocaleSettings.setLocale(AppLocale.en);
    });

    test('Descendant relationships include path descriptions', () {
      final grandfather = Person(name: 'Grandfather', gender: Gender.male);
      final father = Person(name: 'Father', gender: Gender.male);
      final son = Person(name: 'Son', gender: Gender.male);
      final daughter = Person(name: 'Daughter', gender: Gender.female);
      final granddaughter = Person(
        name: 'Granddaughter',
        gender: Gender.female,
      );

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
      final greatGrandfather = Person(
        name: 'Great-Grandfather',
        gender: Gender.male,
      );
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

      final rel = RelationshipCalculator.calculateRelationship(
        brother,
        cousinSon,
      );
      expect(rel, isNotNull);
      expect(
        rel!.detailedDescription,
        isNot(equals(t.relationships.special.extendedFamily)),
      );
    });

    test('Translations are available for multiple locales', () async {
      await LocaleSettings.setLocale(AppLocale.ar);
      expect(t.relationships.base.father.isNotEmpty, isTrue);

      await LocaleSettings.setLocale(AppLocale.en);
      expect(t.relationships.base.father, equals('father'));
    });

    test('Khuntha cannot be a spouse or parent', () {
      final khuntha = Person(name: 'Khuntha', gender: Gender.khuntha);
      final partner = Person(name: 'Partner', gender: Gender.male);
      final child = Person(name: 'Child', gender: Gender.male);

      expect(() => khuntha.addSpouse(partner), throwsArgumentError);
      expect(() => partner.addSpouse(khuntha), throwsArgumentError);
      expect(() => khuntha.addChild(child), throwsArgumentError);
    });

    test('Khuntha uses neutral relationship labels', () {
      final father = Person(name: 'Father', gender: Gender.male);
      final mother = Person(name: 'Mother', gender: Gender.female);
      final sibling = Person(name: 'Sibling', gender: Gender.male);
      final khuntha = Person(name: 'Khuntha', gender: Gender.khuntha);

      father.addChild(sibling);
      mother.addChild(sibling);
      father.addChild(khuntha);
      mother.addChild(khuntha);

      final childRel = RelationshipCalculator.calculateRelationship(
        father,
        khuntha,
      );
      expect(childRel, isNotNull);
      expect(childRel!.detailedDescription, equals('child'));

      final siblingRel = RelationshipCalculator.calculateRelationship(
        sibling,
        khuntha,
      );
      expect(siblingRel, isNotNull);
      expect(siblingRel!.detailedDescription, equals('sibling'));
    });
  });
}
