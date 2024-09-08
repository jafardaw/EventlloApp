import 'package:event_testing/Featuer/Guests/presentation/view/widget/guest_card.dart';
import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/core/style.dart';
import 'package:flutter/material.dart';
import 'package:event_testing/Featuer/Guests/data/guest_model.dart';

class GusetsViewBody extends StatefulWidget {
  const GusetsViewBody({super.key});

  @override
  State<GusetsViewBody> createState() => _GusetsViewBodyState();
}

class _GusetsViewBodyState extends State<GusetsViewBody> {
  @override
  Widget build(BuildContext context) {
    final List<Guest> guests = [
      Guest(
        name: 'John Doe',
        description: 'A special guest at our event.',
        imageUrl: 'assets/images/birthday.jpg',
      ),
      Guest(
        name: 'Jane Smith',
        description: 'Known for her amazing performances.',
        imageUrl: 'assets/images/birthday.jpg',
      ),
      // أضف المزيد من الضيوف هنا
    ];

    return Container(
      decoration: linearGradientMethod(),
      child: Column(
        children: [
          const WelcomeGuests(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: const Color.fromARGB(255, 186, 181, 163),
                child: Text(
                  'Guest List',
                  style: Styles.textStyleAppBar,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: guests.length,
              itemBuilder: (context, index) {
                final guest = guests[index];
                return GuestCard(guest: guest);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeGuests extends StatelessWidget {
  const WelcomeGuests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Icon(
            Icons.group,
            size: 80,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome to the Guest List',
            style: Styles.textStyleAppBar,
          ),
          Text(
            'Here are our special guests for the event.',
            style: Styles.textStyleAppBar,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
