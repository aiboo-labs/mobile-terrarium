import 'dart:async';
import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetProvider extends ChangeNotifier {
  late Pet _pet;
  Timer? _hungerTimer;
  int _secondsUntilNextHungerIncrease = 10;

  PetProvider() {
    // Initialize with a new pet
    _pet = Pet(
      id: 'pet_001',
      name: 'Terrarium',
      hunger: 50,
    );
    _startHungerTimer();
  }

  Pet get pet => _pet;
  int get secondsUntilNextHungerIncrease => _secondsUntilNextHungerIncrease;

  // Start timer to increase hunger every 10 seconds
  void _startHungerTimer() {
    _hungerTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_secondsUntilNextHungerIncrease < 0) {
        _pet.increaseHunger(amount: 5);
        _secondsUntilNextHungerIncrease = 10;
      }
      
      _secondsUntilNextHungerIncrease--;
      notifyListeners();
    });
  }

  // User feeds the pet
  void feedPet({int amountFed = 30}) {
    _pet.hunger = (_pet.hunger - amountFed).clamp(0, 100);
    notifyListeners();
  }

  @override
  void dispose() {
    _hungerTimer?.cancel();
    super.dispose();
  }
}
