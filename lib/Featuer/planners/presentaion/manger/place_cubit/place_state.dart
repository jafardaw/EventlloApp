import 'package:event_testing/Featuer/planners/data/places_model.dart';

abstract class PlaceState {}

class PlaceInitial extends PlaceState {}

class PlaceLoading extends PlaceState {}

class PlaceLoaded extends PlaceState {
  final List<Place> places;

  PlaceLoaded(this.places);
}

class PlaceError extends PlaceState {
  final String message;

  PlaceError(this.message);
}
