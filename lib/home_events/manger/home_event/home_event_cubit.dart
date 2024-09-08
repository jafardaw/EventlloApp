import 'package:dio/dio.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:event_testing/home_events/data/event_planner_model.dart';
import 'package:event_testing/home_events/manger/home_event/home_event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventPlannerCubit extends Cubit<EventPlannerState> {
  final EventPlannerRepository _eventRepository;

  EventPlannerCubit(this._eventRepository) : super(EventPlannerInitial());

  Future<void> fetchEventsPlannercubit() async {
    try {
      emit(EventPlannerLoading());
      final events = await _eventRepository.fetchEvents();
      emit(EventPlannerLoaded(events));
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(EventPlannerError(errorMessage));
    } catch (e) {
      emit(EventPlannerError("حدث خطأ home  غير متوقع: ${e.toString()}"));
    }
  }
}

class EventPlannerRepository {
  final Dio _dio = Dio();

  Future<List<EventPlannerModel>> fetchEvents() async {
    try {
      final response = await _dio.get('$url/api/Show/events');
      List<EventPlannerModel> events = (response.data as List)
          .map((event) => EventPlannerModel.fromJson(event))
          .toList();
      return events;
    } catch (e) {
      throw Exception('Failed to load events');
    }
  }
}
