import 'package:event_testing/Featuer/planners/data/search_places_model.dart';

abstract class SearchPlacesState {
  const SearchPlacesState();
}

class SearchPlacesInitial extends SearchPlacesState {}

class SearchPlacesLoading extends SearchPlacesState {}

class SearchPlacesLoaded extends SearchPlacesState {
  final List<SearchPlacesModel> places;

  const SearchPlacesLoaded(this.places);

  @override
  String toString() => 'SearchPlacesLoaded { places: $places }';
}

class SearchPlacesError extends SearchPlacesState {
  final String message;

  const SearchPlacesError(this.message);

  @override
  String toString() => 'SearchPlacesError { message: $message }';
}
