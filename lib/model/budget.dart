import 'dart:convert';

class Budget {
  String name;
  int budget;
  Budget({
    required this.name,
    required this.budget,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'budget': budget,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      name: map['name'],
      budget: map['budget'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source));
}
