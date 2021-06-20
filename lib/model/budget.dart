import 'dart:convert';

class Budget {
  int id;
  String name;
  int budget;
  Budget({
    required this.id,
    required this.name,
    required this.budget,
  });

  Budget copyWith({
    int? id,
    String? name,
    int? budget,
  }) {
    return Budget(
      id: id ?? this.id,
      name: name ?? this.name,
      budget: budget ?? this.budget,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'budget': budget,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      id: map['id'],
      name: map['name'],
      budget: map['budget'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));

  @override
  String toString() => 'Budget(id: $id, name: $name, budget: $budget)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Budget && other.id == id && other.name == name && other.budget == budget;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ budget.hashCode;
}
