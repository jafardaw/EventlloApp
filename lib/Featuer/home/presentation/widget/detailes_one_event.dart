import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../manger/detailes_cubit/detaile_event_cubit.dart';
import '../manger/detailes_cubit/details_event_state.dart';
import '../manger/detailes_cubit/detailes_repo.dart';

class EventDetailPage extends StatelessWidget {
  final int eventId;

  const EventDetailPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EventDetailsCubit(EventRepositoryDetails())..fetchEvent(1),
      child: Scaffold(
        appBar: AppBar(
          title: Text('event_details.event_details'.tr()),
        ),
        body: BlocBuilder<EventDetailsCubit, EventDState>(
          builder: (context, state) {
            if (state is EventDLoading) {
              return Center(child: Text('loading'.tr()));
            } else if (state is EventDLoaded) {
              final event = state.event;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${'event_details.title'.tr()}: ${event.title}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                        '${'event_details.description'.tr()}: ${event.description}'),
                    const SizedBox(height: 10),
                    Text('${'event_details.date'.tr()}: ${event.date}'),
                    const SizedBox(height: 10),
                    Text('${'event_details.time'.tr()}: ${event.time}'),
                    const SizedBox(height: 10),
                    Text('${'event_details.location'.tr()}: ${event.location}'),
                    const SizedBox(height: 10),
                    Text('${'event_details.budget'.tr()}: ${event.budget}'),
                    const SizedBox(height: 10),
                    Text('${'event_details.rate'.tr()}: ${event.rate}'),
                    const SizedBox(height: 10),
                    Text(
                        '${'event_details.created_at'.tr()}: ${event.createdAt}'),
                    const SizedBox(height: 10),
                    Text(
                        '${'event_details.updated_at'.tr()}: ${event.updatedAt}'),
                  ],
                ),
              );
            } else if (state is EventDError) {
              return Center(child: Text('${'error'.tr()} ${state.message}'));
            } else {
              return Center(child: Text('unknown'.tr()));
            }
          },
        ),
      ),
    );
  }
}
