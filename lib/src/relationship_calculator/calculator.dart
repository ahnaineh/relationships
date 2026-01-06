import '../core/person.dart';
import 'analyzers/analyzers.dart';
import 'core/core.dart';
import 'helpers/detailed_description_builder.dart';
import 'helpers/helpers.dart';
import 'types.dart';

class RelationshipCalculator {
  static RelationshipPath? findRelationshipPath(
    Person subject,
    Person relativeTo, {
    Map<String, Gender>? genderOverrides,
  }) {
    if (subject == relativeTo) return null;

    final visited = <Person>{};
    final queue = <(List<Person>, List<RelationshipStep>)>[
      ([subject], []),
    ];

    while (queue.isNotEmpty) {
      final (path, steps) = queue.removeAt(0);
      final current = path.last;

      if (visited.contains(current)) continue;
      visited.add(current);

      final connections = <(Person, RelationshipStep)>[];

      if (current.father != null) {
        connections.add((current.father!, RelationshipStep.father));
      }
      if (current.mother != null) {
        connections.add((current.mother!, RelationshipStep.mother));
      }

      for (final child in current.children) {
        final childGender = GenderResolver.resolveGender(
          target: child,
          genderOverrides: genderOverrides,
        );
        final step = switch (childGender) {
          Gender.male => RelationshipStep.son,
          Gender.female => RelationshipStep.daughter,
          Gender.khuntha => RelationshipStep.child,
        };
        connections.add((child, step));
      }

      for (final spouse in current.spouses) {
        final spouseGender = GenderResolver.resolveGender(
          target: spouse,
          genderOverrides: genderOverrides,
        );
        final step = switch (spouseGender) {
          Gender.male => RelationshipStep.husband,
          Gender.female => RelationshipStep.wife,
          Gender.khuntha => RelationshipStep.spouse,
        };
        connections.add((spouse, step));
      }

      // Don't include manumitter connections in regular path finding
      // as they don't create family relationships

      for (final (neighbor, step) in connections) {
        if (neighbor == relativeTo) {
          return RelationshipPath(
            path: [...path, neighbor],
            steps: [...steps, step],
          );
        }

        if (!visited.contains(neighbor)) {
          queue.add(([...path, neighbor], [...steps, step]));
        }
      }
    }

    return null;
  }

  static Relationship? calculateRelationship(
    Person subject,
    Person relativeTo, {
    Map<String, Gender>? genderOverrides,
  }) {
    final subjectGender = GenderResolver.resolveGender(
      target: subject,
      genderOverrides: genderOverrides,
    );
    final relativeGender = GenderResolver.resolveGender(
      target: relativeTo,
      genderOverrides: genderOverrides,
    );

    // Self-relationship
    if (subject == relativeTo) {
      return Relationship(
        subject: subject,
        relativeTo: relativeTo,
        type: Types.person,
        path: RelationshipPath(path: [subject], steps: []),
        generationGap: 0,
        genderPath: [subjectGender],
        stepPath: [],
        isDirect: false,
        isBloodRelation: false,
        detailedDescription: DetailedDescriptionBuilder.buildSpecialRelationship('self'),
        lineage: Lineage.none,
        metadata: {'isSelf': true},
        genealogyNotation: 'SELF',
        relationshipDegree: 0,
      );
    }

    // First check if there's a family relationship
    final path = findRelationshipPath(
      subject,
      relativeTo,
      genderOverrides: genderOverrides,
    );
    if (path != null) {
      return _analyzeRelationshipPath(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // If no family relationship, check if this is a manumitter
    if (relativeTo == subject.manumitter) {
      return Relationship(
        subject: subject,
        relativeTo: relativeTo,
        type: Types.manumitter,
        path: RelationshipPath(path: [subject, relativeTo], steps: []),
        generationGap: 0,
        genderPath: [subjectGender, relativeGender],
        stepPath: [],
        isDirect: false,
        isBloodRelation: false,
        detailedDescription: DetailedDescriptionBuilder.buildSpecialRelationship('manumitter'),
        lineage: Lineage.none,
        metadata: {'isManumitter': true},
        genealogyNotation: 'MANUMITTER',
        relationshipDegree: -1, // Not a family relationship
      );
    }

    // Check if the target is treasury (special entity)
    final lowerName = relativeTo.name.toLowerCase();
    if (lowerName.contains('treasury') ||
        lowerName.contains('bayt al-mal') ||
        lowerName.contains('bayt-al-mal') ||
        lowerName.contains('بيت المال')) {
      // Arabic for Bayt al-Mal
      return Relationship(
        subject: subject,
        relativeTo: relativeTo,
        type: Types.treasury,
        path: RelationshipPath(path: [subject, relativeTo], steps: []),
        generationGap: 0,
        genderPath: [subjectGender, relativeGender],
        stepPath: [],
        isDirect: false,
        isBloodRelation: false,
        detailedDescription: DetailedDescriptionBuilder.buildSpecialRelationship('treasury'),
        lineage: Lineage.none,
        metadata: {'isTreasury': true},
        genealogyNotation: 'TREASURY',
        relationshipDegree: -1, // Not a family relationship
      );
    }

    return null;
  }

  static Relationship? _analyzeRelationshipPath(
    Person subject,
    Person relativeTo,
    RelationshipPath path, {
    Map<String, Gender>? genderOverrides,
  }) {
    final steps = path.steps;

    if (steps.isEmpty) {
      return Relationship(
        subject: subject,
        relativeTo: relativeTo,
        type: Types.person,
        path: path,
        generationGap: 0,
        genderPath: GenderResolver.resolveGenderPath(
          path: path.path,
          genderOverrides: genderOverrides,
        ),
        stepPath: steps,
        isDirect: false,
        isBloodRelation: true,
        detailedDescription: DetailedDescriptionBuilder.buildSpecialRelationship('relatedPerson'),
        lineage: Lineage.none,
        metadata: {},
        genealogyNotation: '',
        relationshipDegree: -1,
      );
    }

    // Direct relationships (1 step)
    if (steps.length == 1) {
      return DirectRelationshipAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        steps[0],
        genderOverrides: genderOverrides,
      );
    }

    // All parent steps - direct ascendant line
    if (steps.every(StepClassifier.isParentStep)) {
      return AscendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // All child steps - direct descendant line
    if (steps.every(StepClassifier.isChildStep)) {
      return DescendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // 2 steps
    if (steps.length == 2) {
      return _analyzeTwoStepRelationship(
        subject,
        relativeTo,
        path,
        steps,
        genderOverrides: genderOverrides,
      );
    }

    // 3 steps
    if (steps.length == 3) {
      return _analyzeThreeStepRelationship(
        subject,
        relativeTo,
        path,
        steps,
        genderOverrides: genderOverrides,
      );
    }

    // 4 steps
    if (steps.length == 4) {
      return _analyzeFourStepRelationship(
        subject,
        relativeTo,
        path,
        steps,
        genderOverrides: genderOverrides,
      );
    }

    // 5+ steps - Extended relationships
    return ExtendedRelationshipAnalyzer.analyze(
      subject,
      relativeTo,
      path,
      steps,
      genderOverrides: genderOverrides,
    );
  }

  static Relationship? _analyzeTwoStepRelationship(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
    List<RelationshipStep> steps, {
    Map<String, Gender>? genderOverrides,
  }) {
    // Sibling
    if (StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isChildStep(steps[1])) {
      return SiblingAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Grandparent
    if (StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1])) {
      return AscendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Grandchild
    if (StepClassifier.isChildStep(steps[0]) &&
        StepClassifier.isChildStep(steps[1])) {
      return DescendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Step-child
    if (StepClassifier.isSpouseStep(steps[0]) &&
        StepClassifier.isChildStep(steps[1])) {
      return SiblingAnalyzer.analyzeStepChild(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // No specific pattern matched for 2 steps - use path description
    final genderPath = GenderResolver.resolveGenderPath(
      path: path.path,
      genderOverrides: genderOverrides,
    );
    final pathDescription = PathDescriptionBuilder.buildExtendedPathDescription(steps);

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person,
      path: path,
      generationGap: GenerationGapCalculator.calculateGenerationGap(steps),
      genderPath: genderPath,
      stepPath: steps,
      isDirect: false,
      isBloodRelation: !steps.any(StepClassifier.isSpouseStep),
      detailedDescription: pathDescription.isNotEmpty
          ? pathDescription
          : DetailedDescriptionBuilder.buildSpecialRelationship('extendedFamily'),
      lineage: LineageAnalyzer.analyzeLineage(subject, relativeTo, path),
      metadata: {},
      genealogyNotation: NotationGenerator.generateGenealogyNotation(
        steps,
        genderPath,
      ),
      relationshipDegree: 2,
    );
  }

  static Relationship? _analyzeThreeStepRelationship(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
    List<RelationshipStep> steps, {
    Map<String, Gender>? genderOverrides,
  }) {
    // Aunt/Uncle (parent -> parent -> child)
    if (StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1]) &&
        StepClassifier.isChildStep(steps[2])) {
      return AuntUncleAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Niece/Nephew (parent -> child -> child)
    if (StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isChildStep(steps[1]) &&
        StepClassifier.isChildStep(steps[2])) {
      return NieceNephewAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Great-grandparent (3 parent steps)
    if (steps.every(StepClassifier.isParentStep)) {
      return AscendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Great-grandchild (3 child steps)
    if (steps.every(StepClassifier.isChildStep)) {
      return DescendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // No specific pattern matched for 3 steps - use path description
    final genderPath = GenderResolver.resolveGenderPath(
      path: path.path,
      genderOverrides: genderOverrides,
    );
    final pathDescription = PathDescriptionBuilder.buildExtendedPathDescription(steps);

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person,
      path: path,
      generationGap: GenerationGapCalculator.calculateGenerationGap(steps),
      genderPath: genderPath,
      stepPath: steps,
      isDirect: false,
      isBloodRelation: !steps.any(StepClassifier.isSpouseStep),
      detailedDescription: pathDescription.isNotEmpty
          ? pathDescription
          : DetailedDescriptionBuilder.buildSpecialRelationship('extendedFamily'),
      lineage: LineageAnalyzer.analyzeLineage(subject, relativeTo, path),
      metadata: {},
      genealogyNotation: NotationGenerator.generateGenealogyNotation(
        steps,
        genderPath,
      ),
      relationshipDegree: 3,
    );
  }

  static Relationship? _analyzeFourStepRelationship(
    Person subject,
    Person relativeTo,
    RelationshipPath path,
    List<RelationshipStep> steps, {
    Map<String, Gender>? genderOverrides,
  }) {
    // First cousin (parent -> parent -> child -> child)
    if (StepClassifier.isParentStep(steps[0]) &&
        StepClassifier.isParentStep(steps[1]) &&
        StepClassifier.isChildStep(steps[2]) &&
        StepClassifier.isChildStep(steps[3])) {
      return CousinAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Great-great-grandparent (4 parent steps)
    if (steps.every(StepClassifier.isParentStep)) {
      return AscendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // Great-great-grandchild (4 child steps)
    if (steps.every(StepClassifier.isChildStep)) {
      return DescendantAnalyzer.analyze(
        subject,
        relativeTo,
        path,
        genderOverrides: genderOverrides,
      );
    }

    // No specific pattern matched for 4 steps - use path description
    final genderPath = GenderResolver.resolveGenderPath(
      path: path.path,
      genderOverrides: genderOverrides,
    );
    final pathDescription = PathDescriptionBuilder.buildExtendedPathDescription(steps);

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: Types.person,
      path: path,
      generationGap: GenerationGapCalculator.calculateGenerationGap(steps),
      genderPath: genderPath,
      stepPath: steps,
      isDirect: false,
      isBloodRelation: !steps.any(StepClassifier.isSpouseStep),
      detailedDescription: pathDescription.isNotEmpty
          ? pathDescription
          : DetailedDescriptionBuilder.buildSpecialRelationship('extendedFamily'),
      lineage: LineageAnalyzer.analyzeLineage(subject, relativeTo, path),
      metadata: {},
      genealogyNotation: NotationGenerator.generateGenealogyNotation(
        steps,
        genderPath,
      ),
      relationshipDegree: 4,
    );
  }
}
