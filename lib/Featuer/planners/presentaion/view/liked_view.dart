import 'package:event_testing/Featuer/planners/presentaion/view/widget/liked_venue_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class LikedVenuesPage extends StatefulWidget {
  const LikedVenuesPage({Key? key}) : super(key: key);

  @override
  _LikedVenuesPageState createState() => _LikedVenuesPageState();
}

class _LikedVenuesPageState extends State<LikedVenuesPage> {
  Future<List<String>> _getLikedVenues() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('liked_venues') ?? [];
  }

  Future<void> _deleteAllLikedVenues() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('liked_venues');
    setState(() {});
  }

  Future<void> _deleteLikedVenue(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final likedVenues = prefs.getStringList('liked_venues') ?? [];
    likedVenues.removeAt(index);
    await prefs.setStringList('liked_venues', likedVenues);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorite'.tr()), // Use translation
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () async {
              await _deleteAllLikedVenues();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: _getLikedVenues(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('no_liked_venues'.tr())); // Use translation
          } else {
            final likedVenues = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: likedVenues.length,
                itemBuilder: (context, index) {
                  return LikedVenueCard(
                    name: likedVenues[index],
                    rate: 4.5,
                    onDelete: () async {
                      await _deleteLikedVenue(index);
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
