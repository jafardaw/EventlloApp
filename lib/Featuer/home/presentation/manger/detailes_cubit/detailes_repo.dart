import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/home/data/details_event_model.dart';
import 'package:event_testing/const.dart';

class EventRepositoryDetails {
  final Dio dio = Dio();

  Future<DetaileEvent> fetchEventDetails(int id) async {
    final response = await dio.get('$url/api/one/events/$id');
    if (response.statusCode == 200) {
      return DetaileEvent.fromJson(response.data['event']);
    } else {
      throw Exception('Failed to load event');
    }
  }
}
