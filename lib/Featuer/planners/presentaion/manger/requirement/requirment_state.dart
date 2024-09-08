abstract class RequirmentState {}

class RequirmentInitial extends RequirmentState {}

class RequirmentLoading extends RequirmentState {}

class RequirmentLoaded extends RequirmentState {
  final num id;
  RequirmentLoaded(this.id);
}

class RequirmentError extends RequirmentState {
  final String message;

  RequirmentError(this.message);
}
