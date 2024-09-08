import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/special_requirement_cubit/special_requirement_state.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialRequirmentCubit extends Cubit<SpecialRequirementState> {
  SpecialRequirmentCubit() : super(SpecialRequirementInitial());
  TextEditingController comment = TextEditingController();
  createSpecialRequirement(
      String food,
      String decor,
      String photographer,
      String chairs,
      String maxValue,
      String lighting,
      String dj,
      String car,
      String theBand,
      String additions,
      String requirementId,
      num id) async {
    emit(SpecialRequirementLoading());

    try {
      final data = {
        'food': food,
        'decor': decor,
        'photographer': photographer,
        'chairs': chairs,
        'max_value': maxValue,
        'lighting': lighting,
        'dj': dj,
        'car': car,
        'the_band': theBand,
        'Additions': additions,
        'comments': comment.text,
        'requirement_id': requirementId,
      };

      final response = await Dio().post(
        '$url/api/auth/create/SpecialRequirement$id',
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      emit(SpecialRequirementLoaded(masseg: 'تم انشاء الحفلة بنجاح'));

      return response;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(SpecialRequirementError(errorMessage));
    } catch (e) {
      emit(SpecialRequirementError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
