abstract class CreateEventState {}

class CreateEventInitial extends CreateEventState {}

class CreateEventLoading extends CreateEventState {}

class CreateEventLoaded extends CreateEventState {
  final String masseg;
  CreateEventLoaded({required this.masseg});
}

class CreateEventError extends CreateEventState {
  final String errorMessage;

  CreateEventError(this.errorMessage);
}
