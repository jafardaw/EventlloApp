import 'package:event_testing/test_hala_veiw/presentation/data/sala_model.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/dealet_sala/delet_sala_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../const.dart';
import '../../manger/dealet_sala/delect_sala_cubit.dart';
import '../../manger/sala_cubit/sala_cubit.dart';

class SalaCard extends StatefulWidget {
  final void Function()? onTap;
  final void Function()? onDetailsTap;
  final SalaModel salaModel;
  final num placeId;

  const SalaCard({
    Key? key,
    this.onTap,
    this.onDetailsTap,
    required this.salaModel, required this.placeId,
  }) : super(key: key);

  @override
  SalaCardState createState() => SalaCardState();
}

class SalaCardState extends State<SalaCard> {
  bool isLiked = false;
  double buttonSize = 40.0;

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
                  child: Image.network(
                    '$url/${widget.salaModel.images![0].image}',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 178, 139, 192),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 26,
                        ),
                        onPressed: ()async{
                         await  BlocProvider.of<DeleatSalaCubit>(context).deletePlace(
                              widget.placeId);
                     //    await  BlocProvider.of<SalaCubit>(context).fetchPlaces();

                        },
                      ),

                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 26,
                            ),
                            onPressed: widget.onDetailsTap,
                          ),
                          const SizedBox(width: 8),

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
                child:  Text(
                  widget.salaModel!.name!,
                  style: TextStyle(
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
  void _deleteGuest(num placeId) async {
    await BlocProvider.of<DeleatSalaCubit>(context).deletePlace(
      placeId,
    );
    // Update the list of guests after deletion
    BlocProvider.of<SalaCubit>(context).fetchPlaces();
  }

  void _showDeleteDialog(num placeId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this guest?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ Dialog بدون حذف
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ Dialog
                _deleteGuest(placeId);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

