import 'package:event_testing/Featuer/home/presentation/widget/detailes_one_event.dart';
import 'package:event_testing/home_events/data/event_planner_model.dart';
import 'package:event_testing/home_events/manger/home_event/home_event_cubit.dart';
import 'package:event_testing/home_events/manger/home_event/home_event_state.dart';
import 'package:event_testing/home_events/update_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_event.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final activeEvents = events.where((event) => event.isActive).toList();
    // final inactiveEvents = events.where((event) => !event.isActive).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateEventsView()),
        );
      },child: Icon(Icons.add)),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Events',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: BlocBuilder<EventPlannerCubit, EventPlannerState>(
        builder: (context, state) {
          if (state is EventPlannerLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          } else if (state is EventPlannerLoaded) {
            return Column(
              children: [
             Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Active Events',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          ),
          ),
          const SizedBox(height: 12),
          Expanded(
          child: PageView.builder(
          itemCount: state.events.length,
          itemBuilder: (context, index) {
          final event = state.events[index];
          return GestureDetector(
          onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم الضغط على ${event.title}')),
          );
          },
          child: Align(
          alignment:
          Alignment.center, // لضبط موقع الـ Card في الوسط
          child: SizedBox(
          width: 300, // عرض الـ Card
          height: 250, // ارتفاع الـ Card
          child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          shadowColor: Colors.white,
          margin: const EdgeInsets.only(right: 12.0),
          child: Stack(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ClipRRect(
          borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16)),
          child: Hero(
          tag: 'imageHero-${event.title}',
          child: Image.asset(
          'assets/images/festival.jpg',
          width: double.infinity,
          height: 150, // تعديل ارتفاع الصورة
          fit: BoxFit.cover,
          ),
          ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(
          horizontal: 12.0, vertical: 8.0),
          child: Row(
          children: [
          IconButton(
          icon: Icon(Icons.edit, color: Colors.white),
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) =>
          UpdateEventsView(id: state.events[index].id ,)),
          );
          },
          ),
          Expanded(
          child: Text(
          event.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          ),
          ),
          ),
          IconButton(
          icon:
          Icon(Icons.delete, color: Colors.white),
          onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(
          SnackBar(
          content: Text(
          'حذف ${event.title}')),
          );
          },
          ),
          ],
          ),
          ),
          ],
          ),
          ],
          ),
          ),
          ),
          ),
          );
          },
          ),
          ),
          ],
          ),
          ),
          ),
           Expanded(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'NotActive Events',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          ),
          ),
          const SizedBox(height: 12),
          Expanded(
          child: PageView.builder(
          itemCount: state.events.length,
          itemBuilder: (context, index) {
          final event = state.events[index];
          return GestureDetector(
          onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم الضغط على ${event.title}')),
          );
          },
          child: Align(
          alignment:
          Alignment.center, // لضبط موقع الـ Card في الوسط
          child: SizedBox(
          width: 300, // عرض الـ Card
          height: 250, // ارتفاع الـ Card
          child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          shadowColor: Colors.white,
          margin: const EdgeInsets.only(right: 12.0),
          child: Stack(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ClipRRect(
          borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16)),
          child: Hero(
          tag: 'imageHero-${event.title}',
          child: Image.asset(
          'assets/images/festival.jpg',
          width: double.infinity,
          height: 150, // تعديل ارتفاع الصورة
          fit: BoxFit.cover,
          ),
          ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(
          horizontal: 12.0, vertical: 8.0),
          child: Row(
          children: [
          IconButton(
          icon: Icon(Icons.delete, color: Colors.white),
          onPressed: () {


          },
          ),
          Expanded(
          child: Text(
          event.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          ),
          ),
          ),
          IconButton(
          icon:
          Icon(Icons.delete, color: Colors.white),
          onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(
          SnackBar(
          content: Text(
          'حذف ${event.title}')),
          );
          },
          ),
          ],
          ),
          ),
          ],
          ),
          ],
          ),
          ),
          ),
          ),
          );
          },
          ),
          ),
          ],
          ),
          ),
          )

              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  // Widget _buildEventsSection(
  //   BuildContext context, {
  //       required num id,
  //   required String title,
  //   required List<EventPlannerModel> events,
  //   required Color color,
  // }) {
  //
  // }
}
