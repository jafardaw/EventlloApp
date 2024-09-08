import 'package:dio/dio.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:event_testing/home_events/manger/create_event/create_events_state.dart';
import 'package:event_testing/home_events/manger/update_event/update_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Updateeventcubit extends Cubit<UpdateEventState> {
  Updateeventcubit() : super(UpdateEventInitial());
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController budget = TextEditingController();

  updateSpecialRequirement(num eventUpdataId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs
        .getString('access_token'); // Retrieve token from shared preferences

    if (token == null) {
      emit(UpdateEventError('Authentication token not found'));
      return;
    }

    Dio().options.headers['Authorization'] = 'Bearer $token';

    emit(UpdateEventLoading());

    try {
      final data = {
        'title': title.text,
        'description': description.text,
        'date': date.text,
        'time': time.text,
        'location': location.text,
        'budget': budget.text,
      };

      final response = await Dio().post(
        '$url/api/events/$eventUpdataId',
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      emit(UpdateEventLoaded(masseg: 'تم تعديل الحدث بنجاح'));

      return response;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(UpdateEventError(errorMessage));
    } catch (e) {
      emit(UpdateEventError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
