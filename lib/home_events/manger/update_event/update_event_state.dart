abstract class UpdateEventState {}

class UpdateEventInitial extends UpdateEventState {}

class UpdateEventLoading extends UpdateEventState {}

class UpdateEventLoaded extends UpdateEventState {
  final String masseg;
  UpdateEventLoaded({required this.masseg});
}

class UpdateEventError extends UpdateEventState {
  final String errorMessage;

  UpdateEventError(this.errorMessage);
}
