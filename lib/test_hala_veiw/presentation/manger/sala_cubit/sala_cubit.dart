import 'package:dio/dio.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:event_testing/test_hala_veiw/presentation/data/sala_model.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/sala_cubit/sala_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalaCubit extends Cubit<SalaState> {
  SalaCubit() : super(SalaInitial());

  Future<void> fetchPlaces() async {
    emit(SalaLoading());
    try {
      final response =
          await Dio().get('$url/api/places'); // ضع هنا رابط الـ API الخاص بك
      final List<SalaModel> places = (response.data as List)
          .map((json) => SalaModel.fromJson(json))
          .toList();
      emit(SalaLoaded(places));
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(SalaError(errorMessage));
    } catch (e) {
      emit(SalaError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}

class ErrorHandler implements Exception {
  static String handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "انتهى وقت الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.";
      case DioExceptionType.sendTimeout:
        return "انتهى وقت إرسال الطلب إلى الخادم. قد تكون هناك مشكلة في الشبكة، حاول مرة أخرى.";
      case DioExceptionType.receiveTimeout:
        return "انتهى وقت استقبال الرد من الخادم. قد تكون هناك مشكلة في الشبكة، حاول مرة أخرى.";
      case DioExceptionType.badCertificate:
        return "شهادة الأمان غير صالحة. تأكد من أنك تتصل بالخادم الصحيح.";
      case DioExceptionType.cancel:
        return "تم إلغاء الطلب إلى الخادم. إذا لم تكن أنت من ألغى الطلب، يرجى المحاولة مرة أخرى.";
      case DioExceptionType.connectionError:
        return "خطأ في الإتصال بالخادم. تأكد من أنك متصل بالإنترنت وحاول مرة أخرى.";
      case DioExceptionType.unknown:
        return "فشل الإتصال بالخادم أو مشكلة في الإتصال بالإنترنت. يرجى التحقق من اتصالك وحاول مرة أخرى.";
      case DioExceptionType.badResponse:
        if (e.response != null) {
          return _handleBadResponse(e.response!);
        } else {
          return "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.";
        }
      default:
        return "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.";
    }
  }

  static String _handleBadResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return "طلب غير صالح. يرجى التحقق من المعلومات المدخلة والمحاولة مرة أخرى.";
      case 401:
        return "غير مصرح. يرجى التحقق من بيانات الاعتماد الخاصة بك والمحاولة مرة أخرى.";
      case 403:
        return "ممنوع الوصول. ليس لديك الصلاحية للوصول إلى هذا المورد.";
      case 404:
        return "الصفحة المطلوبة غير موجودة. تأكد من صحة الرابط أو المحاولة لاحقًا.";
      case 500:
        return "خطأ في الخادم. هناك مشكلة في الخادم، يرجى المحاولة لاحقًا.";
      case 502:
        return "خطأ في البوابة. الخادم تلقى استجابة غير صالحة من خادم آخر.";
      case 503:
        return "الخدمة غير متاحة. الخادم غير متاح حاليًا، يرجى المحاولة لاحقًا.";
      case 504:
        return "انتهى وقت الاتصال بالخادم. الخادم لم يتمكن من الرد في الوقت المناسب.";
      default:
        return "خطأ غير معروف: ${response.statusCode}. يرجى المحاولة مرة أخرى.";
    }
  }
}
