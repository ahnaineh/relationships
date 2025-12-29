# relationships

Relationship modeling and kinship calculations for Dart, with localized descriptions.

## Features

- Model family trees with parents, children, and spouses.
- Calculate relationship paths and labels (e.g., "grandson (son's son)").
- Built-in translations powered by Slang (Arabic and English included).

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  relationships: ^0.0.1
```

## Usage

```dart
import 'package:relationships/i18n/strings.g.dart';
import 'package:relationships/relationships.dart';

void main() {
  LocaleSettings.setLocale(AppLocale.en);

  final father = Person(name: 'Father', gender: Gender.male);
  final daughter = Person(name: 'Daughter', gender: Gender.female);

  father.addChild(daughter);

  final rel = RelationshipCalculator.calculateRelationship(father, daughter);
  print(rel?.detailedDescription); // daughter
}
```

## Localization

- Import `package:relationships/i18n/strings.g.dart`.
- Set the locale using `LocaleSettings.setLocale(AppLocale.en)` or `AppLocale.ar`.
- All descriptions use the current locale.

## Additional information

Issues and contributions are welcome once the repository is published.
