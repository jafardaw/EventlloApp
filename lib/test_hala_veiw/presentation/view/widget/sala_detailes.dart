import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/test_hala_veiw/presentation/data/sala_model.dart';
import 'package:flutter/material.dart';

import '../../../../const.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final List<Widget>? leadingWidgets;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leadingWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (leadingWidgets != null && leadingWidgets!.isNotEmpty)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: leadingWidgets!,
            )
          : null,
      title: Text(
        title,
        style: Styles.textStyleAppBar,
      ),
      centerTitle: true,
      actions: actions,
      flexibleSpace: Container(
        decoration: linearGradientMethod(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

abstract class Styles {
  static TextStyle textStyle30 = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyleAppBar = const TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}

class SalaDetailScreen extends StatelessWidget {
  const SalaDetailScreen({super.key, required this.salaModel});
  final SalaModel salaModel;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: CustomAppBar(
        title: salaModel.name!,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: salaModel.images!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage('$url/${salaModel.images![index].image}'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple.shade600, Colors.purple.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: const Row(
                children: [
                  Icon(
                    Icons.celebration_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Discover the Perfect Venue for Your Event!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 20),
            Text(
              '${salaModel.capacity}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.deepPurple.shade700),
                const SizedBox(width: 5),
                Text(
                  '${salaModel.createdAt}',
                  style: TextStyle(fontSize: 18, color: Colors.purple.shade600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
            ),
            const SizedBox(height: 10),
            Text(
              'This luxury banquet hall is perfect for weddings, receptions, and special events. '
                  'It offers top-notch facilities, including a grand dining area, beautiful decor, and a spacious dance floor. '
                  'Make your event unforgettable with our exquisite services and elegant ambiance.',
              style: TextStyle(
                  fontSize: 16, color: Colors.purple.shade600, height: 1.5),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Rest of the code
