import 'package:flutter/material.dart';

class LikedVenueCard extends StatefulWidget {
  final String name;
  final VoidCallback onDelete;
  final double rate;

  const LikedVenueCard({
    Key? key,
    required this.name,
    required this.onDelete,
    required this.rate,
  }) : super(key: key);

  @override
  _LikedVenueCardState createState() => _LikedVenueCardState();
}

class _LikedVenueCardState extends State<LikedVenueCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: InkWell(
        onTap: () {
          _animationController.forward().then((_) {
            widget.onDelete();
            _animationController.reverse();
          });
        },
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
                      height: 300, // زيادة ارتفاع الصورة
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 178, 139, 192),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _animationController.forward().then((_) {
                              widget.onDelete();
                              _animationController.reverse();
                            });
                          },
                        ),
                        const SizedBox(
                            width: 100), // مساحة بين زر الحذف والتقييم
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 22,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${widget.rate}',
                              style: const TextStyle(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    widget.name,
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
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
