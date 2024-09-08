abstract class DeleatEventState {}

class DeletEventInitial extends DeleatEventState {}

class DeletEventInloading extends DeleatEventState {}

class DeletEventSuccess extends DeleatEventState {
  final String deletedGuest;

  DeletEventSuccess({required this.deletedGuest});
}

class DeletEventFailure extends DeleatEventState {
  final String error;

  DeletEventFailure({required this.error});
}
