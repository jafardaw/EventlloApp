
abstract class DeletSalaState {}

class DeletSalaInitial extends DeletSalaState {}

class DeletSalaLoading extends DeletSalaState {}

class DeletSalaLoaded extends DeletSalaState {
  final String message;

  DeletSalaLoaded(this.message);
}

class DeletSalaError extends DeletSalaState {
  final String message;

 DeletSalaError(this.message);
}
