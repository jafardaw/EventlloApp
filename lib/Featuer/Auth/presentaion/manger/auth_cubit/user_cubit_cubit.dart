import 'package:dio/dio.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserCubitState> {
  UserCubitCubit() : super(UserInitial());

//Sign up phone number
  TextEditingController signUpFullName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPAssowrd = TextEditingController();

//signInController
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInpassword = TextEditingController();
//foget
  TextEditingController forgetPhon = TextEditingController(text: '+20');
  TextEditingController forgetfirstname = TextEditingController();
//vertic
  TextEditingController restVertic = TextEditingController();
//reset
  TextEditingController resetpass = TextEditingController();
  TextEditingController resetConfpass = TextEditingController(text: '+20');

  signUp() async {
    emit(SignUpLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final data = {
        'name': signUpFullName.text,
        'email': signUpEmail.text,
        'password': signUpPAssowrd.text,
      };

      final response = await Dio().post(
        '$url/api/register',
        data: data,
      );
      // final token = response.data['access_token'];
      // await prefs.setString('access_token', token);
      String successMessage = 'تم تسجيل الحساب بنجاح';
      emit(SignUpSuccess(successMessage));

      return response;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(SignUpFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(SignUpFailure(errorMessage: "حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await Dio().post(
        '$url/api/login',
        data: {
          'email': signInEmail.text,
          'password': signInpassword.text,
        },
      );
      final data = response.data;
      final token = data['access_token'];
      final userId = data['user']['id'];

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('access_token', token);
        await prefs.setInt('id', userId);

        emit(SignInSuccess('تـم انشاء الحساب بنجاح'));
      } else {
        emit(SignInFailure(errorMessage: "Invalid status code"));
      }
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(SignInFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(SignInFailure(
          errorMessage: "An unexpected error occurred: ${e.toString()}"));
    }
  }

  //////////////////////////////////
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs
        .getString('access_token'); // Retrieve token from shared preferences

    if (token == null) {
      emit(LogoutFailure(errorMessage: 'Authentication token not found'));
      return;
    }

    // Dio().options.headers['Authorization'] = 'Bearer $token';

    emit(LogoutLoading());
    try {
      final response = await Dio().get(
        '$url/api/auth/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      await prefs.remove('access_token');

      emit(LogoutSuccess(message: 'تم تسجيل الخروج بنجاح'));
      return response.data;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(LogoutFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(LogoutFailure(
          errorMessage: "An unexpected error occurred: ${e.toString()}"));
    }
  }

  // forget() async {
  //   emit(ForgetLoading());
  //   try {
  //     final response = await Dio().post(
  //       'https://backend.almowafraty.com/api/v1/markets/auth/forget-password',
  //       data: {
  //         'phone': forgetPhon.text,
  //         'name': forgetfirstname.text,
  //       },
  //     );

  //     emit(ForgetSuccess(message: response.data['message']));
  //     return response.data;
  //   } on DioException catch (e) {
  //     String errorMessage = ErrorHandler.handleDioError(e);
  //     emit(ForgetFailure(errorMessage: errorMessage));
  //   } catch (e) {
  //     emit(ForgetFailure(
  //         errorMessage: "An unexpected error occurred: ${e.toString()}"));
  //   }
  // }

  // reset() async {
  //   emit(ResetLoading());
  //   try {
  //     final response = await Dio().post(
  //       'https://backend.almowafraty.com/api/v1/markets/auth/forget-password',
  //       data: {
  //         '': resetpass.text,
  //         '': resetConfpass.text,
  //       },
  //     );
  //     // final user = SignInModel.fromJson(response);
  //     return response.data;
  //   } on DioException catch (e) {
  //     String errorMessage = ErrorHandler.handleDioError(e);
  //     emit(ResetFailure(errorMessage: errorMessage));
  //   } catch (e) {
  //     emit(ResetFailure(
  //         errorMessage: "An unexpected error occurred: ${e.toString()}"));
  //   }
  // }

  // Future<void> verifyCode(String code, String token) async {
  //   emit(VerifyCodeLoading());
  //   try {
  //     final response = await Dio().post(
  //       'https://backend.almowafraty.com/api/v1/markets/auth/verify-code',
  //       data: {
  //         'verification_code': code,
  //       },
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token', // هنا تم إضافة الـ token
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       emit(VerifyCodeSuccess());
  //     } else {
  //       emit(VerifyCodeFailure(response.data['message']));
  //     }
  //   } catch (e) {
  //     // emit(VerifyCodeFailure(e.response.data['message']));
  //     emit(VerifyCodeFailure('حدث خطأ أثناء التحقق من الكود.'));
  //   }
  // }
}
