import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pet_provider.dart';
import '../widgets/feed_pet_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var petProvider = context.watch<PetProvider>();
    var pet = petProvider.pet;

    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Aiboo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Aiboo',
                  applicationVersion: '1.0.0',
                  applicationIcon: Icon(Icons.pets, size: 48),
                  children: [
                    Text('A simple companion app built just for you.'),
                    Text('Feed your pet as if you are talking to your best friend and watch both of you grow!'),
                  ],
                );
              },
            ),
          ],
        ),
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
                _showFeedDialog(context, petProvider);
              },
              child: Text('Feed Pet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showFeedDialog(BuildContext context, PetProvider petProvider) {
    showDialog(
      context: context,
      builder: (context) => FeedPetDialog(petProvider: petProvider),
    );
  }
}
