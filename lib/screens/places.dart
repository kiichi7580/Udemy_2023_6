import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List placeList = ref.watch(placeProvider);
    // final placeList = [];

    void _addPlace() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
      ));
    }

    Widget content = const Center(
      child: Text('No places added yet.',
          style: TextStyle(
            color: Colors.white,
          )),
    );

    if (placeList.isNotEmpty) {
      return content = const Center(
        child: Text('Place added!'),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
