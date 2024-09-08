import 'package:event_testing/Featuer/home/presentation/manger/detailes_cubit/detailes_repo.dart';
import 'package:event_testing/Featuer/home/presentation/manger/detailes_cubit/details_event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailsCubit extends Cubit<EventDState> {
  final EventRepositoryDetails eventRepository;

  EventDetailsCubit(this.eventRepository) : super(EventDInitial());

  Future<void> fetchEvent(int id) async {
    try {
      emit(EventDLoading());
      final event = await eventRepository.fetchEventDetails(id);
      emit(EventDLoaded(event));
    } catch (e) {
      emit(EventDError(e.toString()));
    }
  }
}
