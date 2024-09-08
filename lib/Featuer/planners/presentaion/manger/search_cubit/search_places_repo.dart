import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/planners/data/search_places_model.dart';
import 'package:event_testing/const.dart';

class ApiServiceSerchPlaces {
  final Dio _dio = Dio();
  final String baseUrl = '$url/api/search/places';

  Future<List<SearchPlacesModel>> searchPlaces(String query) async {
    try {
      final response = await _dio.get(
        baseUrl,
        data: {'search': query},
      );

      // التحقق من استجابة الـ API
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((json) => SearchPlacesModel.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب البيانات: ${response.statusCode}');
      }
    } catch (e) {
      print('خطأ في جلب البيانات: $e'); // تسجيل الخطأ
      throw Exception('فشل في جلب الأماكن: $e');
    }
  }
}
