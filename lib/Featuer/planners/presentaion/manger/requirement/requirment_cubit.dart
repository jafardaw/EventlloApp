import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/requirement/requirment_state.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequirmentCubit extends Cubit<RequirmentState> {
  RequirmentCubit() : super(RequirmentInitial());

//Sign up phone number
  TextEditingController description = TextEditingController();
  TextEditingController costRange = TextEditingController();
  TextEditingController status = TextEditingController();

//signInController
  TextEditingController time = TextEditingController();
//foget
  TextEditingController maxValue = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  requrment() async {
    emit(RequirmentLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final data = {
        'description': description.text,
        'cost_range': costRange.text,
        'status': status.text,
        'date': dateController.text,
        'time': time.text,
        'max_value': maxValue.text,
      };

      final response = await Dio().post(
        '$url/api/auth/create/requirements',
        data: data,
      );
      num id = response.data['id'];

      emit(RequirmentLoaded(id));

      return response;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(RequirmentError(errorMessage));
    } catch (e) {
      emit(RequirmentError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
