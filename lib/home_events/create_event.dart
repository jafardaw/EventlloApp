import 'package:event_testing/home_events/create_events_view_body.dart';
import 'package:flutter/material.dart';

class CreateEventsView extends StatelessWidget {
  const CreateEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'انشاء حدث',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const CreateEventsViewBody(),
    );
  }
}
