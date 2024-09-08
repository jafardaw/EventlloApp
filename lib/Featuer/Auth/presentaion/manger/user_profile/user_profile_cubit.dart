import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/Auth/data/user_model.dart';
import 'package:event_testing/Featuer/Auth/presentaion/manger/user_profile/user_profile_state.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  final Dio dio;

  UserCubit(this.dio) : super(UserInitial());

  Future<void> fetchUser() async {
    // Set content type
    final prefs = await SharedPreferences.getInstance();
    final token = prefs
        .getString('access_token'); // Retrieve token from shared preferences

    if (token == null) {
      emit(UserError('Authentication token not found'));
      return;
    }

    dio.options.headers['Authorization'] = 'Bearer $token';
    emit(UserLoading());
    try {
      final response = await dio.get('$url/api/auth/user-profile');
      final user = User.fromJson(response.data);
      emit(UserLoaded(user));
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(UserError(errorMessage));
    } catch (e) {
      emit(UserError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
