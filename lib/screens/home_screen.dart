import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var petProvider = context.watch<PetProvider>();
    var pet = petProvider.pet;

    return Scaffold(
      appBar: AppBar(
        title: Text('${pet.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hunger Level: ${pet.hunger}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            Text(
              pet.state.toString() == 'PetState.hungry' 
                ? '😫 Hungry' 
                : '😊 Full',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 32),
            Text(
              'Next hunger increase in: ${petProvider.secondsUntilNextHungerIncrease}s',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                petProvider.feedPet();
              },
              child: Text('Feed Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
