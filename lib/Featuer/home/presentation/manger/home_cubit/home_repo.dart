import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/home/data/home_model.dart';
import 'package:event_testing/const.dart';

class EventRepository {
  final Dio _dio = Dio();

  Future<List<Event>> fetchEvents() async {
    try {
      final response = await _dio.get('$url/api/Show/events');
      List<Event> events = (response.data as List)
          .map((event) => Event.fromJson(event))
          .toList();
      return events;
    } catch (e) {
      throw Exception('Failed to load events');
    }
  }
}
