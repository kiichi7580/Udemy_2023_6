import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceProviderNotifier extends StateNotifierProvider {
  PlaceProviderNotifier() : super();

}

final placeProvider = StateNotifierProvider(
  (ref) =>  List _placeList;
  );