import 'package:event_testing/home_events/data/event_planner_model.dart';

abstract class EventPlannerState {}

class EventPlannerInitial extends EventPlannerState {}

class EventPlannerLoading extends EventPlannerState {}

class EventPlannerLoaded extends EventPlannerState {
  final List<EventPlannerModel> events;

  EventPlannerLoaded(this.events);
}

class EventPlannerError extends EventPlannerState {
  final String message;

  EventPlannerError(this.message);
}
