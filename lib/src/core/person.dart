import 'package:uuid/uuid.dart';

enum Gender { male, female, khuntha }

class Person {
  final String id;
  String name;
  final Gender gender;
  DateTime? birthDate;
  DateTime? deathDate;

  Person? _father;
  Person? _mother;
  final List<Person> _spouses = [];
  final List<Person> _children = [];
  Person? _manumitter; // The person who freed this person from slavery
  final List<Person> _manumitted = []; // People this person has freed

  Person? get father => _father;
  Person? get mother => _mother;
  List<Person> get spouses => List.unmodifiable(_spouses);
  List<Person> get children => List.unmodifiable(_children);
  Person? get manumitter => _manumitter;
  List<Person> get manumitted => List.unmodifiable(_manumitted);

  Person({
    String? id,
    required this.name,
    required this.gender,
    this.birthDate,
    this.deathDate,
  }) : id = id ?? Uuid().v4();

  bool get isAlive => deathDate == null;

  void setFather(Person? newFather) {
    if (newFather == this) {
      throw ArgumentError('A person cannot be their own father');
    }
    if (newFather != null && newFather.gender != Gender.male) {
      throw ArgumentError('Father must be male');
    }
    if (newFather != null && newFather.isDescendantOf(this)) {
      throw StateError(
        'Cannot create circular relationship: ${newFather.name} is a descendant of $name',
      );
    }
    if (_father != null) {
      _father!._children.remove(this);
    }
    _father = newFather;
    if (newFather != null && !newFather._children.contains(this)) {
      newFather._children.add(this);
    }
  }

  void setMother(Person? newMother) {
    if (newMother == this) {
      throw ArgumentError('A person cannot be their own mother');
    }
    if (newMother != null && newMother.gender != Gender.female) {
      throw ArgumentError('Mother must be female');
    }
    if (newMother != null && newMother.isDescendantOf(this)) {
      throw StateError(
        'Cannot create circular relationship: ${newMother.name} is a descendant of $name',
      );
    }
    if (_mother != null) {
      _mother!._children.remove(this);
    }
    _mother = newMother;
    if (newMother != null && !newMother._children.contains(this)) {
      newMother._children.add(this);
    }
  }

  void setParents(Person? father, Person? mother) {
    setFather(father);
    setMother(mother);
  }

  void addSpouse(Person spouse) {
    if (spouse == this) {
      throw ArgumentError('A person cannot marry themselves');
    }
    if (gender == Gender.khuntha || spouse.gender == Gender.khuntha) {
      throw ArgumentError('Khuntha cannot be a spouse');
    }
    if (_spouses.contains(spouse)) {
      return;
    }
    _spouses.add(spouse);
    if (!spouse._spouses.contains(this)) {
      spouse._spouses.add(this);
    }
  }

  void removeSpouse(Person spouse) {
    _spouses.remove(spouse);
    spouse._spouses.remove(this);
  }

  void addChild(Person child) {
    if (child == this) {
      throw ArgumentError('A person cannot be their own child');
    }
    if (gender == Gender.khuntha) {
      throw ArgumentError('Khuntha cannot be a parent');
    }
    if (_children.contains(child)) {
      return;
    }
    _children.add(child);

    if (gender == Gender.male) {
      child.setFather(this);
    } else if (gender == Gender.female) {
      child.setMother(this);
    }
  }

  void removeChild(Person child) {
    _children.remove(child);
    if (gender == Gender.male && child._father == this) {
      child._father = null;
    } else if (gender == Gender.female && child._mother == this) {
      child._mother = null;
    }
  }

  bool isAncestorOf(Person person) {
    if (_children.contains(person)) return true;
    for (final child in _children) {
      if (child.isAncestorOf(person)) return true;
    }
    return false;
  }

  bool isDescendantOf(Person person) {
    return person.isAncestorOf(this);
  }

  bool isSiblingOf(Person person) {
    if (person == this) return false;
    final hasCommonFather = _father != null && _father == person._father;
    final hasCommonMother = _mother != null && _mother == person._mother;
    return hasCommonFather || hasCommonMother;
  }

  bool isFullSiblingOf(Person person) {
    if (person == this) return false;
    return _father != null &&
        _father == person._father &&
        _mother != null &&
        _mother == person._mother;
  }

  bool isHalfSiblingOf(Person person) {
    if (person == this) return false;
    final hasCommonFather = _father != null && _father == person._father;
    final hasCommonMother = _mother != null && _mother == person._mother;
    final hasDifferentFather = _father != person._father;
    final hasDifferentMother = _mother != person._mother;

    return (hasCommonFather && hasDifferentMother) ||
        (hasCommonMother && hasDifferentFather);
  }

  List<Person> getSiblings({bool includeHalf = true}) {
    final siblings = <Person>{};

    if (_father != null) {
      siblings.addAll(
        _father!._children.where(
          (child) => child != this && (includeHalf || child._mother == _mother),
        ),
      );
    }

    if (_mother != null) {
      siblings.addAll(
        _mother!._children.where(
          (child) => child != this && (includeHalf || child._father == _father),
        ),
      );
    }

    return siblings.toList();
  }

  void setManumitter(Person? newManumitter) {
    if (newManumitter == this) {
      throw ArgumentError('A person cannot be their own manumitter');
    }
    if (_manumitter != null) {
      _manumitter!._manumitted.remove(this);
    }
    _manumitter = newManumitter;
    if (newManumitter != null && !newManumitter._manumitted.contains(this)) {
      newManumitter._manumitted.add(this);
    }
  }

  void addManumitted(Person person) {
    if (person == this) {
      throw ArgumentError('A person cannot manumit themselves');
    }
    if (_manumitted.contains(person)) {
      return;
    }
    _manumitted.add(person);
    person.setManumitter(this);
  }

  void removeManumitted(Person person) {
    _manumitted.remove(person);
    if (person._manumitter == this) {
      person._manumitter = null;
    }
  }

  @override
  String toString() => '$name (${gender.name})';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
