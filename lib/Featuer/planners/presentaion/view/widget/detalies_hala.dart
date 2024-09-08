import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/special_requirement_cubit/special_requirement_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/special_requirement_cubit/special_requirement_state.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/sala_owners_screen.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom_app_bar.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:event_testing/core/widgets/custom_drawer.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallDetailsPage extends StatefulWidget {
  const HallDetailsPage({super.key, required this.nameHala, required this.id});
  final String nameHala;
  final num id;

  @override
  HallDetailsPageState createState() => HallDetailsPageState();
}

// HallDetailsPageState Definition
class HallDetailsPageState extends State<HallDetailsPage> {
  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  String? selectedFlowers;
  int? selectedFlowersCount;
  int? selectedChairs;
  String? selectedFoodAndDrinks;
  bool carService = false;
  TextEditingController notesController = TextEditingController();

  // القوائم الجديدة
  String? selectedDJService;
  String? selectedDecorationService;
  String? selectedPhotographerService;
  String? selectedLightingService;
  String? selectedBandService;
  int? selectedMinimumAmount;
  String? selectedAdditions;
  String? selectedComments;
  String? selectedRequirementId;
  int? selectedNumberCar;

  final List<String> flowersList = ['ورد', 'زنابق', 'بنفسج'];
  final List<int> flowersCountList = [10, 20, 30, 40, 50];
  final List<int> numberCar = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  final List<int> chairsList = [50, 100, 150, 200];
  final List<String> foodAndDrinksList = ['عربي', 'غربي', 'أسيوي', 'نباتي'];

  // قوائم الخدمات الجديدة
  final List<String> djServiceList = ['DJ1', 'DJ2', 'DJ3'];
  final List<String> decorationServiceList = [
    'Classic',
    'Modern',
    'Traditional'
  ];
  final List<String> photographerServiceList = [
    'Photographer1',
    'Photographer2',
    'Photographer3'
  ];
  final List<String> lightingServiceList = ['Basic', 'Advanced', 'Premium'];
  final List<String> bandServiceList = ['Band1', 'Band2', 'Band3'];
  final List<int> minimumAmountList = [1000, 2000, 3000, 4000, 5000];
  final List<String> additionsList = ['Add1', 'Add2', 'Add3'];
  final List<String> commentsList = ['Comment1', 'Comment2', 'Comment3'];
  final List<String> requirementIdList = ['Req1', 'Req2', 'Req3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: tr('hall_details')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/birthday.jpg', // Replace with your image URL
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.nameHala,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr('hall_description'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  // const SalaOwnersScreen(),
                  const SizedBox(height: 20),
                  buildDropdownButton<int>(
                    tr('select_chairs'),
                    chairsList,
                    selectedChairs,
                    (int? newValue) {
                      setState(() {
                        selectedChairs = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('food_and_drinks'),
                    foodAndDrinksList,
                    selectedFoodAndDrinks,
                    (String? newValue) {
                      setState(() {
                        selectedFoodAndDrinks = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_dj_service'),
                    djServiceList,
                    selectedDJService,
                    (String? newValue) {
                      setState(() {
                        selectedDJService = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_decoration_service'),
                    decorationServiceList,
                    selectedDecorationService,
                    (String? newValue) {
                      setState(() {
                        selectedDecorationService = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_photographer_service'),
                    photographerServiceList,
                    selectedPhotographerService,
                    (String? newValue) {
                      setState(() {
                        selectedPhotographerService = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_lighting_service'),
                    lightingServiceList,
                    selectedLightingService,
                    (String? newValue) {
                      setState(() {
                        selectedLightingService = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_band'),
                    bandServiceList,
                    selectedBandService,
                    (String? newValue) {
                      setState(() {
                        selectedBandService = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<int>(
                    tr('select_minimum_amount'),
                    minimumAmountList,
                    selectedMinimumAmount,
                    (int? newValue) {
                      setState(() {
                        selectedMinimumAmount = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_additions'),
                    additionsList,
                    selectedAdditions,
                    (String? newValue) {
                      setState(() {
                        selectedAdditions = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<String>(
                    tr('select_requirement_id'),
                    requirementIdList,
                    selectedRequirementId,
                    (String? newValue) {
                      setState(() {
                        selectedRequirementId = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  buildDropdownButton<int>(
                    tr('select_number_of_cars'),
                    numberCar,
                    selectedNumberCar,
                    (int? newValue) {
                      setState(() {
                        selectedNumberCar = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      labelText: tr('add_notes'),
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<SpecialRequirmentCubit, SpecialRequirementState>(
                    listener: (context, state) {
                      if (state is SpecialRequirementLoaded) {
                        Navigator.of(context).pop();
                        showCustomSnackBar(context, state.masseg,
                            color: Colors.pink);
                      } else if (state is SpecialRequirementError) {
                        Navigator.of(context).pop();
                        showCustomSnackBar(context, state.errorMessage,
                            color: Colors.red);
                      }
                    },
                    builder: (context, state) {
                      if (state is SpecialRequirementLoading) {
                        return buildLoadingIndicator();
                      }
                      return CustomButton(
                        onTap: () {
                          // تعيين التعليقات
                          context.read<SpecialRequirmentCubit>().comment.text =
                              notesController.text;

                          // استدعاء Cubit لباقي القيم
                          context
                              .read<SpecialRequirmentCubit>()
                              .createSpecialRequirement(
                                selectedFoodAndDrinks ?? '',
                                selectedDecorationService ?? '',
                                selectedPhotographerService ?? '',
                                selectedChairs?.toString() ?? '',
                                selectedMinimumAmount?.toString() ?? '',
                                selectedLightingService ?? '',
                                selectedDJService ?? '',
                                selectedNumberCar?.toString() ?? '',
                                selectedRequirementId ?? '',
                                selectedBandService.toString(),
                                selectedAdditions.toString(),
                                widget.id, // id
                              );
                        },
                        text: tr('confirm_order'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<T> buildDropdownButton<T>(
    String labelText,
    List<T> items,
    T? selectedValue,
    void Function(T? newValue) onChanged,
  ) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple, width: 2.0),
        ),
        labelStyle: TextStyle(color: Colors.grey[700]),
      ),
      value: selectedValue,
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.purple), // يمكنك تغيير الأيقونة كما تشاء
              const SizedBox(width: 10),
              Text(
                value.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.purple,
      style: const TextStyle(color: Colors.black),
    );
  }
}
