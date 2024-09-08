import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_repo.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_state.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPlacesCubit extends Cubit<SearchPlacesState> {
  final ApiServiceSerchPlaces _apiService;

  SearchPlacesCubit(this._apiService) : super(SearchPlacesInitial());

  Future<void> searchPlaces(String query) async {
    emit(SearchPlacesLoading());
    try {
      final places = await _apiService.searchPlaces(query);

      emit(SearchPlacesLoaded(places));
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(SearchPlacesError(errorMessage));
    } catch (e) {
      emit(SearchPlacesError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
