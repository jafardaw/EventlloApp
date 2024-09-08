import 'package:event_testing/core/error/handel_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/planners/data/places_model.dart';
import 'package:event_testing/const.dart';
import 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit() : super(PlaceInitial());

  Future<void> fetchPlaces() async {
    emit(PlaceLoading());
    try {
      final response =
          await Dio().get('$url/api/places'); // ضع هنا رابط الـ API الخاص بك
      final List<Place> places =
          (response.data as List).map((json) => Place.fromJson(json)).toList();
      emit(PlaceLoaded(places));
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(PlaceError(errorMessage));
    } catch (e) {
      emit(PlaceError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
