import '../relationship_calculator/relationship_calculator.dart';

import 'person.dart';

class FamilyTree {
  final Map<String, Person> _persons = {};
  Person? _treasury; // Special treasury entity for inheritance

  Map<String, Person> get persons => Map.unmodifiable(_persons);
  Person? get treasury => _treasury;

  Person addPerson({
    String? id,
    required String name,
    required Gender gender,
    DateTime? birthDate,
    DateTime? deathDate,
  }) {
    final person = Person(
      id: id,
      name: name,
      gender: gender,
      birthDate: birthDate,
      deathDate: deathDate,
    );

    if (_persons.containsKey(person.id)) {
      throw ArgumentError('Person with id ${person.id} already exists');
    }

    _persons[person.id] = person;
    return person;
  }

  Person? updatePerson(String personId, {
    String? name,
    DateTime? birthDate,
    DateTime? deathDate,
  }) {
    final person = _persons[personId];
    if (person == null) return null;

    person.name = name ?? person.name;
    person.birthDate = birthDate ?? person.birthDate;
    person.deathDate = deathDate ?? person.deathDate;

    return person;
  }

  void removePerson(String personId) {
    final person = _persons[personId];
    if (person == null) return;

    for (final child in person.children.toList()) {
      if (person.gender == Gender.male) {
        child.setFather(null);
      } else if (person.gender == Gender.female) {
        child.setMother(null);
      }
    }

    if (person.father != null) {
      person.father!.removeChild(person);
    }
    if (person.mother != null) {
      person.mother!.removeChild(person);
    }

    for (final spouse in person.spouses.toList()) {
      person.removeSpouse(spouse);
    }

    _persons.remove(personId);
  }

  void removeAll() {
    _persons.clear();
  }

  Person? getPerson(String id) => _persons[id];

  Person? getPersonByName(String name) {
    try {
      return _persons.values.firstWhere((person) => person.name == name);
    } catch (_) {
      return null;
    }
  }

  List<Person> getPersonsByName(String name) {
    return _persons.values.where((person) => person.name == name).toList();
  }

  List<Person> findPath(Person from, Person to) {
    if (from == to) return [from];

    final visited = <Person>{};
    final queue = <List<Person>>[
      [from],
    ];

    while (queue.isNotEmpty) {
      final path = queue.removeAt(0);
      final current = path.last;

      if (visited.contains(current)) continue;
      visited.add(current);

      final neighbors = <Person>{};

      if (current.father != null) neighbors.add(current.father!);
      if (current.mother != null) neighbors.add(current.mother!);
      neighbors.addAll(current.children);
      neighbors.addAll(current.spouses);

      for (final neighbor in neighbors) {
        if (neighbor == to) {
          return [...path, neighbor];
        }

        if (!visited.contains(neighbor)) {
          queue.add([...path, neighbor]);
        }
      }
    }

    return [];
  }

  List<Person> getAllAncestors(Person person) {
    final ancestors = <Person>{};
    final queue = <Person>[person];

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);

      if (current.father != null && !ancestors.contains(current.father!)) {
        ancestors.add(current.father!);
        queue.add(current.father!);
      }

      if (current.mother != null && !ancestors.contains(current.mother!)) {
        ancestors.add(current.mother!);
        queue.add(current.mother!);
      }
    }

    return ancestors.toList();
  }

  List<Person> getAllDescendants(Person person) {
    final descendants = <Person>{};
    final queue = <Person>[person];

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);

      for (final child in current.children) {
        if (!descendants.contains(child)) {
          descendants.add(child);
          queue.add(child);
        }
      }
    }

    return descendants.toList();
  }

  int getGenerationGap(Person ancestor, Person descendant) {
    final path = findPath(ancestor, descendant);
    if (path.isEmpty) return -1;

    int gap = 0;
    for (int i = 0; i < path.length - 1; i++) {
      final current = path[i];
      final next = path[i + 1];

      if (current.children.contains(next)) {
        gap++;
      } else if (next.children.contains(current)) {
        gap--;
      }
    }

    return gap;
  }

  bool areRelated(Person person1, Person person2) {
    return findPath(person1, person2).isNotEmpty;
  }

  Relationship? findRelationship(
    Person subject,
    Person relativeTo, {
    Map<String, Gender>? genderOverrides,
  }) {
    if (!_persons.containsKey(subject.id) ||
        !_persons.containsKey(relativeTo.id)) {
      throw ArgumentError('Both persons must be in the family tree');
    }

    // We want to find what 'subject' is to 'relativeTo'
    // So we need to find the path from relativeTo to subject
    final result = RelationshipCalculator.calculateRelationship(
      relativeTo,
      subject,
      genderOverrides: genderOverrides,
    );

    if (result == null) return null;

    return Relationship(
      subject: subject,
      relativeTo: relativeTo,
      type: result.type,
      path: result.path,
      generationGap: result.generationGap,
      genderPath: result.genderPath,
      stepPath: result.stepPath,
      isDirect: result.isDirect,
      isBloodRelation: result.isBloodRelation,
      detailedDescription: result.detailedDescription,
      lineage: result.lineage,
      metadata: result.metadata,
      genealogyNotation: result.genealogyNotation,
      relationshipDegree: result.relationshipDegree,
    );
  }

  bool isManumitter(Person person, Person ofPerson) {
    return person == ofPerson.manumitter;
  }

  Map<String, dynamic> getRelationshipDetails(
    Person subject,
    Person relativeTo,
  ) {
    final result = findRelationship(subject, relativeTo);
    return {
      'relationship': result?.type,
      'relationshipResult': result,
      'isManumitter': isManumitter(relativeTo, subject),
      'isManumitted': isManumitter(subject, relativeTo),
      'detailedDescription': result?.detailedDescription,
      'generationGap': result?.generationGap,
      'lineage': result?.lineage.name,
      'genealogyNotation': result?.genealogyNotation,
      'metadata': result?.metadata,
    };
  }

  String? describeRelationship(Person subject, Person relativeTo) {
    final result = findRelationship(subject, relativeTo);
    if (result == null) return null;

    // Use the detailed description if available
    if (result.detailedDescription.isNotEmpty &&
        result.detailedDescription != 'self' &&
        result.detailedDescription != 'related person' &&
        result.detailedDescription != 'extended family member' &&
        result.detailedDescription != 'distant relative') {
      return '${subject.name} is ${relativeTo.name}\'s ${result.detailedDescription}';
    }

    // Fall back to type-based description
    return '${subject.name} is ${relativeTo.name}\'s ${_getRelationshipDescription(result.type)}';
  }

  String _getRelationshipDescription(Types type) {
    switch (type) {
      case Types.maleAscendant:
        return 'male ancestor';
      case Types.femaleAscendant:
        return 'female ancestor';
      case Types.maleDescendant:
        return 'male descendant';
      case Types.femaleDescendant:
        return 'female descendant';
      case Types.husband:
        return 'husband';
      case Types.wife:
        return 'wife';
      case Types.fullBrother:
        return 'brother';
      case Types.fullSister:
        return 'sister';
      case Types.paternalHalfBrother:
        return 'paternal half-brother';
      case Types.maternalHalfBrother:
        return 'maternal half-brother';
      case Types.paternalHalfSister:
        return 'paternal half-sister';
      case Types.maternalHalfSister:
        return 'maternal half-sister';
      case Types.paternalUncle:
        return 'paternal uncle';
      case Types.maternalUncle:
        return 'maternal uncle';
      case Types.paternalAunt:
        return 'paternal aunt';
      case Types.maternalAunt:
        return 'maternal aunt';
      case Types.paternalPaternalHalfUncle:
        return 'paternal uncle (father\'s paternal half-brother)';
      case Types.paternalMaternalHalfUncle:
        return 'paternal uncle (father\'s maternal half-brother)';
      case Types.maternalPaternalHalfUncle:
        return 'maternal uncle (mother\'s paternal half-brother)';
      case Types.maternalMaternalHalfUncle:
        return 'maternal uncle (mother\'s maternal half-brother)';
      case Types.paternalPaternalHalfAunt:
        return 'paternal aunt (father\'s paternal half-sister)';
      case Types.paternalMaternalHalfAunt:
        return 'paternal aunt (father\'s maternal half-sister)';
      case Types.maternalPaternalHalfAunt:
        return 'maternal aunt (mother\'s paternal half-sister)';
      case Types.maternalMaternalHalfAunt:
        return 'maternal aunt (mother\'s maternal half-sister)';
      case Types.fraternalNephew:
        return 'nephew (brother\'s son)';
      case Types.fraternalNiece:
        return 'niece (brother\'s daughter)';
      case Types.sororalNephew:
        return 'nephew (sister\'s son)';
      case Types.sororalNiece:
        return 'niece (sister\'s daughter)';
      case Types.paternalFraternalHalfNephew:
        return 'nephew (paternal half-brother\'s son)';
      case Types.maternalFraternalHalfNephew:
        return 'nephew (maternal half-brother\'s son)';
      case Types.paternalFraternalHalfNiece:
        return 'niece (paternal half-brother\'s daughter)';
      case Types.maternalFraternalHalfNiece:
        return 'niece (maternal half-brother\'s daughter)';
      case Types.paternalSororalHalfNephew:
        return 'nephew (paternal half-sister\'s son)';
      case Types.maternalSororalHalfNephew:
        return 'nephew (maternal half-sister\'s son)';
      case Types.paternalSororalHalfNiece:
        return 'niece (paternal half-sister\'s daughter)';
      case Types.maternalSororalHalfNiece:
        return 'niece (maternal half-sister\'s daughter)';
      case Types.paternalMaleCousin:
        return 'paternal male cousin';
      case Types.paternalFemaleCousin:
        return 'paternal female cousin';
      case Types.maternalMaleCousin:
        return 'maternal male cousin';
      case Types.maternalFemaleCousin:
        return 'maternal female cousin';
      case Types.paternalPaternalHalfMaleCousin:
        return 'paternal male cousin (father\'s paternal half-sibling\'s son)';
      case Types.paternalMaternalHalfMaleCousin:
        return 'paternal male cousin (father\'s maternal half-sibling\'s son)';
      case Types.maternalPaternalHalfMaleCousin:
        return 'maternal male cousin (mother\'s paternal half-sibling\'s son)';
      case Types.maternalMaternalHalfMaleCousin:
        return 'maternal male cousin (mother\'s maternal half-sibling\'s son)';
      case Types.paternalPaternalHalfFemaleCousin:
        return 'paternal female cousin (father\'s paternal half-sibling\'s daughter)';
      case Types.paternalMaternalHalfFemaleCousin:
        return 'paternal female cousin (father\'s maternal half-sibling\'s daughter)';
      case Types.maternalPaternalHalfFemaleCousin:
        return 'maternal female cousin (mother\'s paternal half-sibling\'s daughter)';
      case Types.maternalMaternalHalfFemaleCousin:
        return 'maternal female cousin (mother\'s maternal half-sibling\'s daughter)';
      case Types.manumitter:
        return 'manumitter';
      case Types.treasury:
        return 'treasury';
      case Types.person:
        return 'relative';
    }
  }

  void validateTree() {
    for (final person in _persons.values) {
      if (person.father != null && !_persons.containsKey(person.father!.id)) {
        throw StateError('${person.name} has father not in tree');
      }

      if (person.mother != null && !_persons.containsKey(person.mother!.id)) {
        throw StateError('${person.name} has mother not in tree');
      }

      for (final child in person.children) {
        if (!_persons.containsKey(child.id)) {
          throw StateError('${person.name} has child not in tree');
        }
      }

      for (final spouse in person.spouses) {
        if (!_persons.containsKey(spouse.id)) {
          throw StateError('${person.name} has spouse not in tree');
        }
      }

      if (person.isAncestorOf(person)) {
        throw StateError(
          '${person.name} is their own ancestor (circular reference)',
        );
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'persons': _persons.values
          .map(
            (person) => {
              'id': person.id,
              'name': person.name,
              'gender': person.gender.name,
              'birthDate': person.birthDate?.toIso8601String(),
              'deathDate': person.deathDate?.toIso8601String(),
              'fatherId': person.father?.id,
              'motherId': person.mother?.id,
              'spouseIds': person.spouses.map((s) => s.id).toList(),
              'childIds': person.children.map((c) => c.id).toList(),
            },
          )
          .toList(),
      'treasuryId': _treasury?.id,
    };
  }

  void setTreasury(Person? treasuryPerson) {
    if (treasuryPerson != null && !_persons.containsKey(treasuryPerson.id)) {
      throw ArgumentError('Treasury person must be in the family tree');
    }
    _treasury = treasuryPerson;
  }

  Person createTreasuryEntity() {
    final treasury = Person(
      name: 'Treasury (Bayt al-Mal)',
      gender: Gender.male, // Convention for entity
    );
    _persons[treasury.id] = treasury;
    _treasury = treasury;
    return treasury;
  }

  List<Relationship> getRelationships(
    Person relativeTo, {
    bool Function(Person person)? where,
    Map<String, Gender>? genderOverrides,
  }) {
    if (!_persons.containsKey(relativeTo.id)) {
      throw ArgumentError('Person must be in the family tree');
    }

    final relationships = <Relationship>[];

    for (final person in _persons.values) {
      if (person.id == relativeTo.id || (where != null && !where(person))) {
        continue;
      }

      final result = findRelationship(
        person,
        relativeTo,
        genderOverrides: genderOverrides,
      );
      if (result != null) {
        relationships.add(result);
      }
    }

    return relationships;
  }

  static FamilyTree fromJson(Map<String, dynamic> json) {
    final tree = FamilyTree();

    final personsList = json['persons'] as List;
    for (final personData in personsList) {
      tree.addPerson(
        id: personData['id'],
        name: personData['name'],
        gender: Gender.values.firstWhere((g) => g.name == personData['gender']),
        birthDate: personData['birthDate'] != null
            ? DateTime.parse(personData['birthDate'])
            : null,
        deathDate: personData['deathDate'] != null
            ? DateTime.parse(personData['deathDate'])
            : null,
      );
    }

    for (final personData in personsList) {
      final person = tree.getPerson(personData['id'])!;

      if (personData['fatherId'] != null) {
        person.setFather(tree.getPerson(personData['fatherId']));
      }

      if (personData['motherId'] != null) {
        person.setMother(tree.getPerson(personData['motherId']));
      }

      for (final spouseId in personData['spouseIds']) {
        final spouse = tree.getPerson(spouseId);
        if (spouse != null && !person.spouses.contains(spouse)) {
          person.addSpouse(spouse);
        }
      }
    }

    // Restore treasury if present
    if (json['treasuryId'] != null) {
      tree._treasury = tree.getPerson(json['treasuryId']);
    }

    return tree;
  }
}
