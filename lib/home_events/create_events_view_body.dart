import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:flutter/material.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manger/create_event/create_event_cubit.dart';
import 'manger/create_event/create_events_state.dart';

class CreateEventsViewBody extends StatelessWidget {
  const CreateEventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final crCubit=context.read<Createeventcubit>();
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
            'Create Your Event',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
           CustomTextfield(
            controller: crCubit.title,
            hint: '',
            hintText: 'Enter Event Name',
            prefixIcon: Icon(Icons.event, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(
            controller: crCubit.description,
            hint: '',
            hintText: 'Enter Event Description',
            maxLength: 250,
            keyboardType: TextInputType.multiline,
            prefixIcon: Icon(Icons.description, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(
             controller: crCubit.time,
            hint: '',
            hintText: 'Enter Event Time',
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
                  controller: crCubit.date,
                  hintText: 'Enter Event Date',
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
                      return 'Please enter the event date';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
           CustomTextfield(
            controller: crCubit.location,
            hint: '',
            hintText: 'Enter Event Location',
            prefixIcon: Icon(Icons.location_on, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(
            controller: crCubit.budget,
            hint: '',
            hintText: 'Enter Event Budget',
            keyboardType: TextInputType.number,
            prefixIcon: Icon(Icons.attach_money, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 10),
           CustomTextfield(
            controller: crCubit.status,
            hint: '',
            hintText: 'Enter Event status',
            keyboardType: TextInputType.number,
            prefixIcon: Icon(Icons.star_rate, color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 30),
          BlocConsumer   <Createeventcubit,CreateEventState>(
         builder: (BuildContext context, state) {
           if(state is CreateEventLoading){
             return Center(child: CircularProgressIndicator(color: Colors.purple,),);
           }
           CustomButton(
             onTap: crCubit.createSpecialRequirement(),
           text: 'انشاء حدث',
         ); return SizedBox() ;},   listener: (BuildContext context, Object? state) {

            if(state is CreateEventLoaded){
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

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.maxLength,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.label,
    this.hintStyle,
    this.controller,
    required String hint,
    this.suffixIcon,
    this.validator,
    this.obscuringCharacter = '*',
  });
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  final Text? label;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final int? maxLength;
  final String? Function(String?)? validator;
  final String obscuringCharacter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: obscuringCharacter,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: label,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: buildBorder(Colors.purple),
        border: buildBorder(Colors.purple),
        focusedBorder: buildBorder(Colors.purple),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? Colors.black12),
    );
  }
}
