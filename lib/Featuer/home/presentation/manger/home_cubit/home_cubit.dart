import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/home/presentation/manger/home_cubit/home_repo.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_testing/Featuer/home/presentation/manger/home_cubit/home_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository _eventRepository;

  EventCubit(this._eventRepository) : super(EventInitial());

  Future<void> fetchEventscubit() async {
    try {
      emit(EventLoading());
      final events = await _eventRepository.fetchEvents();
      emit(EventLoaded(events));
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(EventError(errorMessage));
    } catch (e) {
      emit(EventError("حدث خطأ home  غير متوقع: ${e.toString()}"));
    }
  }
}
