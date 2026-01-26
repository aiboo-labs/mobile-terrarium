enum PetState { hungry, full }

class Pet {
  final String id;
  final String name;
  int hunger; // 0-100 (0 = full, 100 = hungry)
  DateTime createdAt;

  Pet({
    required this.id,
    required this.name,
    this.hunger = 50,
    DateTime? createdAt,
  })  : createdAt = createdAt ?? DateTime.now();

  // Determine pet's current state
  PetState get state {
    if (hunger > 70) return PetState.hungry;
    return PetState.full;
  }

  // Increase hunger over time
  void increaseHunger({int amount = 5}) {
    hunger = (hunger + amount).clamp(0, 100);
  }

  // Convert to JSON for persistence
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hunger': hunger,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create from JSON
  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] as String,
      name: json['name'] as String,
      hunger: json['hunger'] as int? ?? 50,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}