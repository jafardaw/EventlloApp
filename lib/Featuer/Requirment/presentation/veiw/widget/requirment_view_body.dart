import 'package:event_testing/Featuer/planners/presentaion/manger/requirement/requirment_cubit.dart';
import 'package:event_testing/Featuer/planners/presentaion/manger/requirement/requirment_state.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/detalies_hala.dart';
import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequirmentViewBody extends StatelessWidget {
  const RequirmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final reqCubit = context.read<RequirmentCubit>();
    final formKey = GlobalKey<FormState>();
    return Container(
      decoration: linearGradientMethod(),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.sell_outlined,
                color: Color.fromARGB(255, 143, 88, 153),
                size: 100,
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'متطلبات الحفلة الرئيسية',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Description field with an icon and validation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CustomTextfield(
                controller: reqCubit.description,
                hintText: 'ادخل وصف الحفلة',
                label: const Text('وصف الحفلة'),
                prefixIcon:
                    const Icon(Icons.description, color: Colors.blueAccent),
                hintStyle: const TextStyle(color: Colors.grey),
                hint: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال وصف الحفلة';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // Cost field with an icon, validation, and animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CustomTextfield(
                controller: reqCubit.costRange,
                hintText: 'ادخل المبلغ المتوقع',
                label: const Text('المبلغ المتوقع'),
                prefixIcon: const Icon(Icons.attach_money, color: Colors.green),
                keyboardType: TextInputType.number,
                hintStyle: const TextStyle(color: Colors.grey),
                hint: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال المبلغ المتوقع';
                  } else if (double.tryParse(value) == null) {
                    return 'يرجى إدخال رقم صحيح';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // Status field with an icon, validation, and animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CustomTextfield(
                controller: reqCubit.status,
                hintText: 'ادخل حالة الحفلة',
                label: const Text('حالة الحفلة'),
                prefixIcon:
                    const Icon(Icons.event_available, color: Colors.orange),
                hintStyle: const TextStyle(color: Colors.grey),
                hint: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال حالة الحفلة';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // Time field with an icon, validation, and animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CustomTextfield(
                controller: reqCubit.time,
                hintText: 'ادخل وقت الحفلة',
                label: const Text('وقت الحفلة'),
                prefixIcon: const Icon(Icons.access_time, color: Colors.purple),
                keyboardType: TextInputType.datetime,
                hintStyle: const TextStyle(color: Colors.grey),
                hint: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال وقت الحفلة';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // Max value field with an icon, validation, and animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: CustomTextfield(
                controller: reqCubit.maxValue,
                hintText: 'ادخل اعلى قيمة',
                label: const Text('اعلى قيمة'),
                prefixIcon:
                    const Icon(Icons.trending_up, color: Colors.redAccent),
                keyboardType: TextInputType.number,
                hintStyle: const TextStyle(color: Colors.grey),
                hint: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال أعلى قيمة';
                  } else if (double.tryParse(value) == null) {
                    return 'يرجى إدخال رقم صحيح';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),

            // Date picker field with an icon, validation, and animation
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
                      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                  reqCubit.dateController.text = formattedDate;
                }
              },
              child: IgnorePointer(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: CustomTextfield(
                    controller: reqCubit.dateController,
                    hintText: 'ادخل تاريخ الحفلة',
                    label: const Text('تاريخ الحفلة'),
                    prefixIcon:
                        const Icon(Icons.calendar_today, color: Colors.teal),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hint: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال تاريخ الحفلة';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // A custom button with validation check
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: BlocConsumer<RequirmentCubit, RequirmentState>(
                  listener: (context, state) {
                    if (state is RequirmentLoaded) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HallDetailsPage(
                                  nameHala: 'aaaaa',
                                  id: state.id,
                                )),
                      );
                      showCustomSnackBar(
                          context, 'تم تسجيل الطلب بنجاح الرجاء الاكمال',
                          color: Colors.pink);
                    } else if (state is RequirmentError) {
                      showCustomSnackBar(context, state.message,
                          color: Colors.red);
                    }
                  },
                  builder: (context, state) {
                    if (state is RequirmentLoading) {
                      return buildLoadingIndicator();
                    }

                    return CustomButton(
                      text: 'التالي',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          reqCubit.requrment();
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
