import 'package:event_testing/Featuer/planners/data/places_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VenueCard extends StatefulWidget {
  final void Function()? onTap;
  final Place place;
  const VenueCard({
    Key? key,
    this.onTap,
    required this.place,
  }) : super(key: key);

  @override
  VenueCardState createState() => VenueCardState();
}

class VenueCardState extends State<VenueCard> {
  bool isLiked = false;
  // int ratingCount = 5;
  // double rating = widget.place.rate;
  double buttonSize = 40.0;

  Future<void> _toggleLike() async {
    final prefs = await SharedPreferences.getInstance();
    final likedVenues = prefs.getStringList('liked_venues') ?? [];
    setState(() {
      isLiked = !isLiked;
      buttonSize = isLiked ? 50.0 : 40.0;
    });

    if (isLiked) {
      likedVenues.add(widget.place.name!);
    } else {
      likedVenues.remove(widget.place.name);
    }

    await prefs.setStringList('liked_venues', likedVenues);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 12,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/birthday.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 178, 139, 192),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: buttonSize,
                        height: buttonSize,
                        child: IconButton(
                          icon: Icon(
                            isLiked
                                ? Icons.thumb_up
                                : Icons.thumb_up_alt_outlined,
                            color: isLiked ? Colors.purple : Colors.white,
                          ),
                          onPressed: _toggleLike,
                        ),
                      ),
                      const SizedBox(width: 110),
                    const  Row(
                        children: [
                           Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 22,
                          ),
                           SizedBox(width: 5),
                          Text(
                            '3',
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  widget.place.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
