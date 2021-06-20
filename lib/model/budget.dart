import 'dart:convert';

class Budget {
  int id;
  String name;
  int budget;
  int plan;
  Budget({
    required this.id,
    required this.name,
    required this.budget,
    required this.plan,
  });

  Budget copyWith({
    int? id,
    String? name,
    int? budget,
    int? plan,
  }) {
    return Budget(
      id: id ?? this.id,
      name: name ?? this.name,
      budget: budget ?? this.budget,
      plan: plan ?? this.plan,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'budget': budget,
      'plan': plan,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      id: map['id'],
      name: map['name'],
      budget: map['budget'],
      plan: map['plan'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Budget(id: $id, name: $name, budget: $budget, plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Budget && other.id == id && other.name == name && other.budget == budget && other.plan == plan;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ budget.hashCode ^ plan.hashCode;
  }
}
