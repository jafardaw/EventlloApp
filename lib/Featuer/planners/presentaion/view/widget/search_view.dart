import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_repo.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/search_cubit/search_places_state.dart';
import 'package:event_testing/core/function/error_view.dart';
import 'package:event_testing/core/style.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//بس عدل ال cubit الى place
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('searchPageTitle')),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEDE7F6), Color(0xFFB39DDB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextfield(
                    hint: '',
                    onChanged: (value) {
                      context.read<SearchPlacesCubit>().searchPlaces(value);
                    },
                    hintText: tr('searchHintText'),
                    label: Text(
                      tr('searchLabel'),
                      style: Styles.textStyle30.copyWith(color: Colors.purple),
                    ),
                  )),
              Expanded(
                child: BlocBuilder<SearchPlacesCubit, SearchPlacesState>(
                  builder: (context, state) {
                    if (state is SearchPlacesLoading) {
                      return buildLoadingIndicator();
                    } else if (state is SearchPlacesLoaded) {
                      final places = state.places;
                      return ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          final place = places[index];
                          return EventCardSearch(
                            imageUrl: 'https://via.placeholder.com/300',
                            eventName: place.name,
                            location: place.address,
                            date: '${place.createdAt}',
                          );
                        },
                      );
                    } else if (state is SearchPlacesError) {
                      return Center(child: Text(state.message));
                    }
                    return buildErrorWidget(tr('errorWidgetText'));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EventCardSearch extends StatelessWidget {
  final String imageUrl;
  final String eventName;
  final String location;
  final String date;

  const EventCardSearch({
    super.key,
    required this.imageUrl,
    required this.eventName,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // فعل ما يحدث عند النقر على البطاقة
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 8,
        shadowColor: Colors.purple.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventName,
                      style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.purple),
                      const SizedBox(width: 4.0),
                      Text(location,
                          style: const TextStyle(
                              color: Colors.purpleAccent, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.purple),
                      const SizedBox(width: 4.0),
                      Text(date,
                          style: const TextStyle(
                              color: Colors.purpleAccent, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    tr('detailsButtonText'),
                    style: const TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
