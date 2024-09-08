import 'package:dio/dio.dart';
import 'package:event_testing/home_events/manger/delete_event/delete_event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../const.dart';

class DeleatEventCubit extends Cubit<DeleatEventState> {
  DeleatEventCubit() : super(DeletEventInitial());

  Future<void> deleteGuest(
    int id,
  ) async {
    print('iiiidddd$id');
    const String urld = '$url/api/auth/delete/Guests/';

    try {
      emit(DeletEventInloading());

      final dio = Dio();

      await dio.delete('$urld$id');

      print('issssssssssssssssssssaaaaaaaaaaaaaaaadddddddd');
      emit(DeletEventSuccess(deletedGuest: 'Guest has been removed.'));
    } catch (e) {
      emit(DeletEventFailure(error: 'The guest was not deleted.'));
    }
  }
}
