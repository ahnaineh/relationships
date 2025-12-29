import '../../../i18n/strings.g.dart';
import '../core/relationship_step.dart';

class PathDescriptionBuilder {
  static String buildDescendantPathDescription(List<RelationshipStep> steps) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;
    final parts = <String>[];

    if (isArabic) {
      // For Arabic, build possessive chain for descendants
      // Example: "son's daughter" = "بنت الابن"
      // Build from the end backwards
      for (int i = steps.length - 1; i >= 0; i--) {
        final step = steps[i];
        final isFirst = (i == steps.length - 1); // The actual relationship
        final isLast = (i == 0); // Gets the definite article

        switch (step) {
          case RelationshipStep.son:
            if (isFirst) {
              parts.add(translations.base.son);
            } else if (isLast) {
              parts.add('الابن'); // with definite article
            } else {
              parts.add('ابن'); // without article
            }
            break;
          case RelationshipStep.daughter:
            if (isFirst) {
              parts.add(translations.base.daughter);
            } else if (isLast) {
              parts.add('البنت'); // with definite article
            } else {
              parts.add('بنت'); // without article
            }
            break;
          case RelationshipStep.child:
            if (isFirst) {
              parts.add(translations.base.child);
            } else if (isLast) {
              parts.add('الطفل'); // with definite article
            } else {
              parts.add('طفل'); // without article
            }
            break;
          default:
            break;
        }
      }

      if (parts.length >= 2) {
        // Join in Arabic order
        return parts.join(' ');
      }
      return parts.join(' ');
    } else {
      // English path description for descendants
      final pathParts = <String>[];

      for (int i = 0; i < steps.length - 1; i++) {
        final step = steps[i];
        switch (step) {
          case RelationshipStep.son:
            pathParts.add("son's");
            break;
          case RelationshipStep.daughter:
            pathParts.add("daughter's");
            break;
          case RelationshipStep.child:
            pathParts.add("child's");
            break;
          default:
            break;
        }
      }

      // Add the final relationship (son/daughter)
      if (steps.isNotEmpty) {
        final lastStep = steps.last;
        switch (lastStep) {
          case RelationshipStep.son:
            pathParts.add("son");
            break;
          case RelationshipStep.daughter:
            pathParts.add("daughter");
            break;
          case RelationshipStep.child:
            pathParts.add("child");
            break;
          default:
            break;
        }
      }

      return pathParts.join(' ');
    }
  }

  static String buildAscendantPathDescription(List<RelationshipStep> steps) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;
    final parts = <String>[];

    if (isArabic) {
      // For Arabic, we need to build the possessive chain correctly
      // The path comes as [parent1, parent2, ...] from subject to target
      // For great-grandfather (father's father's father): path is [father, father, father]
      // We need to say "أب أب الأب" where only the last gets "ال"

      // Process steps from the end - the last step is the actual relationship
      // The earlier steps show the path to get there
      for (int i = steps.length - 1; i >= 0; i--) {
        final step = steps[i];
        final isLast = (i == 0); // The first in path (last when reversed) gets "ال"

        switch (step) {
          case RelationshipStep.father:
            if (i == steps.length - 1) {
              // This is the final person (the actual relationship)
              parts.add(translations.base.father);
            } else if (isLast) {
              // This is the last element in the chain - needs "ال"
              parts.add(translations.possessive.ofFather); // This has "الأب"
            } else {
              // Middle elements - just the base word without "ال"
              parts.add(translations.base.father);
            }
            break;
          case RelationshipStep.mother:
            if (i == steps.length - 1) {
              // This is the final person (the actual relationship)
              parts.add(translations.base.mother);
            } else if (isLast) {
              // This is the last element in the chain - needs "ال"
              parts.add(translations.possessive.ofMother); // This has "الأم"
            } else {
              // Middle elements - just the base word without "ال"
              parts.add(translations.base.mother);
            }
            break;
          case RelationshipStep.parent:
            parts.add(translations.base.parent);
            break;
          default:
            break;
        }
      }

      if (parts.length >= 2) {
        // Now parts is in correct Arabic order
        // For great-grandfather: parts = ["أب", "أب", "الأب"]
        // Join them: "أب أب الأب"
        return parts.join(' ');
      }
      return parts.join(' ');
    } else {
      // English path description logic
      for (final step in steps) {
        switch (step) {
          case RelationshipStep.father:
            parts.add("father's");
            break;
          case RelationshipStep.mother:
            parts.add("mother's");
            break;
          case RelationshipStep.parent:
            parts.add("parent's");
            break;
          default:
            break;
        }
      }

      if (parts.length >= 2) {
        // Remove the last element and join the rest
        parts.removeLast();
        final lastPart = parts.last;
        parts[parts.length - 1] = lastPart.replaceAll("'s", "");
        return parts.join(' ');
      }
      return '';
    }
  }

  static String buildExtendedPathDescription(List<RelationshipStep> steps) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;
    final parts = <String>[];

    if (isArabic) {
      // Build complex Arabic path descriptions
      // Process from end to beginning for proper Arabic possessive chain
      for (int i = steps.length - 1; i >= 0; i--) {
        final step = steps[i];
        final isFirst = (i == steps.length - 1);
        final isLast = (i == 0);

        String part = '';
        switch (step) {
          case RelationshipStep.father:
            if (isFirst) {
              part = translations.base.father;
            } else if (isLast) {
              part = 'الأب';
            } else {
              part = 'أب';
            }
            break;
          case RelationshipStep.mother:
            if (isFirst) {
              part = translations.base.mother;
            } else if (isLast) {
              part = 'الأم';
            } else {
              part = 'أم';
            }
            break;
          case RelationshipStep.son:
            if (isFirst) {
              part = translations.base.son;
            } else if (isLast) {
              part = 'الابن';
            } else {
              part = 'ابن';
            }
            break;
          case RelationshipStep.daughter:
            if (isFirst) {
              part = translations.base.daughter;
            } else if (isLast) {
              part = 'البنت';
            } else {
              part = 'بنت';
            }
            break;
          case RelationshipStep.husband:
            if (isFirst) {
              part = translations.base.husband;
            } else if (isLast) {
              part = 'الزوج';
            } else {
              part = 'زوج';
            }
            break;
          case RelationshipStep.wife:
            if (isFirst) {
              part = translations.base.wife;
            } else if (isLast) {
              part = 'الزوجة';
            } else {
              part = 'زوجة';
            }
            break;
          default:
            break;
        }

        if (part.isNotEmpty) {
          parts.add(part);
        }
      }

      return parts.join(' ');
    } else {
      // English path description for extended relationships
      for (int i = 0; i < steps.length; i++) {
        final step = steps[i];
        final isLast = (i == steps.length - 1);

        switch (step) {
          case RelationshipStep.father:
            parts.add(isLast ? "father" : "father's");
            break;
          case RelationshipStep.mother:
            parts.add(isLast ? "mother" : "mother's");
            break;
          case RelationshipStep.son:
            parts.add(isLast ? "son" : "son's");
            break;
          case RelationshipStep.daughter:
            parts.add(isLast ? "daughter" : "daughter's");
            break;
          case RelationshipStep.husband:
            parts.add(isLast ? "husband" : "husband's");
            break;
          case RelationshipStep.wife:
            parts.add(isLast ? "wife" : "wife's");
            break;
          case RelationshipStep.parent:
            parts.add(isLast ? "parent" : "parent's");
            break;
          case RelationshipStep.child:
            parts.add(isLast ? "child" : "child's");
            break;
          case RelationshipStep.spouse:
            parts.add(isLast ? "spouse" : "spouse's");
            break;
        }
      }

      return parts.join(' ');
    }
  }
}
