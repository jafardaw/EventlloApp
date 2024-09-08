import 'package:dio/dio.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:event_testing/home_events/manger/create_event/create_events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Createeventcubit extends Cubit<CreateEventState> {
  Createeventcubit() : super(CreateEventInitial());
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController status = TextEditingController();

  createSpecialRequirement() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs
        .getString('access_token'); // Retrieve token from shared preferences

    if (token == null) {
      emit(CreateEventError('Authentication token not found'));
      return;
    }

    Dio().options.headers['Authorization'] = 'Bearer $token';

    emit(CreateEventLoading());

    try {
      final data = {
        'title': title.text,
        'description': description.text,
        'date': date.text,
        'time': time.text,
        'location': location.text,
        'budget': budget.text,
        'status': status.text
      };

      final response = await Dio().post(
        '$url/api/create/events',
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      emit(CreateEventLoaded(masseg: 'تم انشاء الحدث بنجاح'));

      return response;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(CreateEventError(errorMessage));
    } catch (e) {
      emit(CreateEventError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
