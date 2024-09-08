import 'package:event_testing/Featuer/planners/data/places_model.dart';
import 'package:event_testing/test_hala_veiw/presentation/data/sala_model.dart';

abstract class SalaState {}

class SalaInitial extends SalaState {}

class SalaLoading extends SalaState {}

class SalaLoaded extends SalaState {
  final List<SalaModel> salalModel;

  SalaLoaded(this.salalModel);
}

class SalaError extends SalaState {
  final String message;

  SalaError(this.message);
}
