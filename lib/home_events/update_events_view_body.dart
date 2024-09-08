import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:event_testing/home_events/manger/update_event/update_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manger/update_event/update_event_state.dart';

class UpdateEventsViewBody extends StatelessWidget {
  final num id;
  const UpdateEventsViewBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final upCubit=context.read<Updateeventcubit>();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade300, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text(
            'Update Your Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
           CustomTextfield(
            controller:upCubit.title ,
            hint: '',
            hintText: 'Update Event Name',
            prefixIcon: Icon(Icons.event, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(
             controller:upCubit.description ,

             hint: '',
            hintText: 'Update Event Description',
            maxLength: 250,
            keyboardType: TextInputType.multiline,
            prefixIcon: Icon(Icons.description, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(            controller:upCubit.time ,


             hint: '',
            hintText: 'Update Event Time',
            keyboardType: TextInputType.datetime,
            prefixIcon: Icon(Icons.access_time, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
              }
            },
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: CustomTextfield(
                  controller:upCubit.date ,

                  hintText: 'Update Event Date',
                  label: const Text(
                    'Event Date',
                    style: TextStyle(color: Colors.white),
                  ),
                  prefixIcon:
                      const Icon(Icons.calendar_today, color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white70),
                  hint: '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Update the event date';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
           CustomTextfield(
            controller:upCubit.location ,

            hint: '',
            hintText: 'Update Event Location',
            prefixIcon: Icon(Icons.location_on, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(
             controller:upCubit.budget ,

             hint: '',
            hintText: 'Update Event Budget',
            keyboardType: TextInputType.number,
            prefixIcon: Icon(Icons.attach_money, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 30),
          BlocConsumer   <Updateeventcubit,UpdateEventState>(
            builder: (BuildContext context, state) {
              if(state is UpdateEventLoading){
                return Center(child: CircularProgressIndicator(color: Colors.purple,),);
              }
              CustomButton(
                onTap: upCubit.updateSpecialRequirement(id),  text: 'تعديل حدث'

              ); return SizedBox() ;},   listener: (BuildContext context, Object? state) {
              if(state is UpdateEventLoaded){
               return showCustomSnackBarP(context, 'تم تعديل الحدث بنجاح',color: Colors.pink);
              }


          },
          ),
        ],
      ),
    );
  }

  void showCustomSnackBarP(BuildContext context, String message,
      {Color color = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
        duration: const Duration(seconds: 2),
      ),
    );
  }

}
