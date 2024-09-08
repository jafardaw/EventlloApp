import 'package:event_testing/Featuer/home/data/details_event_model.dart';

abstract class EventDState {}

class EventDInitial extends EventDState {}

class EventDLoading extends EventDState {}

class EventDLoaded extends EventDState {
  final DetaileEvent event;

  EventDLoaded(this.event);
}

class EventDError extends EventDState {
  final String message;

  EventDError(this.message);
}
