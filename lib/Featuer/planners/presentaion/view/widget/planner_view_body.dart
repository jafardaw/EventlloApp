import 'package:event_testing/Featuer/planners/presentaion/manger/place_cubit/place_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/place_cubit/place_state.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_state.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/liked_view.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/contaner_search.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/detalies_hala.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/sala_owners_screen.dart';
import 'package:event_testing/core/function/error_view.dart';
import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/core/widgets/custom_drawer.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'venue_card.dart';
import 'package:easy_localization/easy_localization.dart';

class PlannersViewBody extends StatefulWidget {
  const PlannersViewBody({super.key});

  @override
  State<PlannersViewBody> createState() => _PlannersViewBodyState();
}

class _PlannersViewBodyState extends State<PlannersViewBody> {
  String selectedArea = 'mazzeh';

  List<String> areas = ['mazzeh', 'barzeh', 'kafrsouseh', 'malki', 'dummar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('venues'.tr())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LikedVenuesPage()),
          );
        },
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: linearGradientMethod(),
        child: Column(children: [
          const ContanerSearch(),
          const SizedBox(height: 28),
          // buildDropdownButton(
          //   selectedValue: selectedArea,
          //   items: areas,
          //   hint: 'area'.tr(),
          //   onChanged: (newValue) {
          //     setState(() {
          //       selectedArea = newValue!;
          //     });
          //     context.read<SearchPlacesCubit>().searchPlaces(selectedArea);
          //   },
          // ),
          BlocConsumer<PlaceCubit, PlaceState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PlaceLoading) {
                return buildLoadingIndicator();
              } else if (state is PlaceLoaded) {
                final places = state.places;
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: state.places.length,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      return VenueCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SalaOwnersScreen()),
                          );
                        },
                        place: place,
                      );
                    },
                  ),
                );
              } else if (state is PlaceError) {
                return buildErrorWidget('error'.tr() + state.message);
              }
              return const SizedBox(height: 8, width: 8);
            },
          ),
        ]),
      ),
    );
  }
}

////////////////
////////////
/////////
//////
////
//

Widget buildDropdownButton({
  required String? selectedValue,
  required List<String> items,
  required String hint,
  required void Function(String?) onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 238, 234, 234),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.9),
          spreadRadius: 8,
          blurRadius: 15,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedValue,
        hint: Text(hint, style: TextStyle(color: Colors.grey[600])),
        icon: const Icon(Icons.arrow_drop_down,
            color: Color.fromARGB(255, 8, 33, 159)),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black87),
        dropdownColor: Colors.white,
        onChanged: onChanged,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
}

     // Padding(
          //   padding: const EdgeInsets.only(left: 2, right: 2),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Expanded(
                //   child: buildDropdownButton(
                //     selectedValue: selectedCapacity,
                //     items: capacities,
                //     hint: 'سعة الصالة',
                //     onChanged: (newValue) {
                //       setState(() {
                //         selectedCapacity = newValue;
                //       });
                //     },
                //   ),
                // ),
          //       const SizedBox(width: 16),
          //       Expanded(
                //   child: buildDropdownButton(
                //     selectedValue: selectedArea,
                //     items: areas,
                //     hint: 'المنطقة',
                //     onChanged: (newValue) {
                //       setState(() {
                //         selectedArea = newValue;
                //       });
                //     },
                //   ),
                // ),
          //     ],
          //   ),
          // ),