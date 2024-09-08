import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../const.dart';
import 'delet_sala_state.dart';

class DeleatSalaCubit extends Cubit<DeletSalaState> {
  DeleatSalaCubit() : super(DeletSalaInitial());

  Future<void> deletePlace(
      num id,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs
        .getString('access_token'); // Retrieve token from shared preferences

    if (token == null) {
      emit(DeletSalaError('Authentication token not found'));
      return;
    }

    Dio().options.headers['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xMzcuMTc4OjgwMDAvYXBpL3BsYW5uZXIvbG9naW4iLCJpYXQiOjE3MjM4MTUwNTUsImV4cCI6MTcyMzgxODY1NSwibmJmIjoxNzIzODE1MDU1LCJqdGkiOiJ5YVBLUklmVmJOR1pKVWl4Iiwic3ViIjoiMSIsInBydiI6IjA3NmY4N2Q5NDQ0MzVjNjE1YTQwOGNiYzg1OGZmNWQxMjc1NWJjMjQifQ.b105CQe2HhXdQYuQcy4cveXwDRhHFrcpvY0ebwNSXjQ';
    print('iiiidddd$id');
    const String urld = '$url/api/places/';

    try {
      emit(DeletSalaLoading());

      final dio = Dio();

      await dio.delete('$urld$id');

      print('issssssssssssssssssssaaaaaaaaaaaaaaaadddddddd');
      emit(DeletSalaLoaded( 'place has been removed.'));
    } catch (e) {
      emit(DeletSalaError('The guest was not deleted.'));
    }
  }
}
// class DeleatSalaCubit extends Cubit<DeletSalaState> {
//   DeleatSalaCubit() : super(DeletSalaInitial());
//
//   Future<void> deletePlace(num id) async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('access_token');
//
//     if (token == null) {
//       emit(DeletSalaError('Authentication token not found'));
//       return;
//     }
//
//     final String url = '$url/api/places/$id';
//
//     try {
//       emit(DeletSalaLoading());
//
//       final dio = Dio();
//       dio.options.headers['Authorization'] = 'Bearer $token';
//
//       await dio.delete(url);
//
//       emit(DeletSalaLoaded('Place has been removed.'));
//     } catch (e) {
//       emit(DeletSalaError('Failed to delete the place: ${e.toString()}'));
//     }
//   }
// }