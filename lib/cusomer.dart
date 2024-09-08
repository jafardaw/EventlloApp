import 'package:dio/dio.dart';
import 'package:event_testing/Featuer/Guests/presentation/view/widget/welcome_guests.dart';
import 'package:event_testing/const.dart';
import 'package:event_testing/core/error/handel_error.dart';
import 'package:event_testing/core/function/linear_gradient_method.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:event_testing/core/widgets/custom_app_bar.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGuestPage extends StatefulWidget {
  const AddGuestPage({super.key});

  @override
  AddGuestPageState createState() => AddGuestPageState();
}

class AddGuestPageState extends State<AddGuestPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addguest = context.read<AddGuestCubit>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الضيوف',
      ),
      body: Container(
        decoration: linearGradientMethod(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const WelcomGuests(),
                const SizedBox(height: 20),
                CustomTextfield(
                  controller: addguest.guestname,
                  label: const Text('الاسم'),
                  hintText: 'إدخال الاسم',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم';
                    }
                    return null;
                  },
                  hint: '',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  controller: addguest.guestemail,
                  label: const Text('البريد الإلكتروني'),
                  hintText: 'إدخال البريد الإلكتروني',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال البريد الإلكتروني';
                    }
                    return null;
                  },
                  hint: '',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  controller: addguest.guestPhone,
                  label: const Text('رقم الهاتف'),
                  hintText: 'إدخال رقم الهاتف',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال رقم الهاتف';
                    }
                    return null;
                  },
                  hint: '',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  controller: addguest.guestaddress,
                  label: const Text('العنوان'),
                  hintText: 'إدخال العنوان',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال العنوان';
                    }
                    return null;
                  },
                  hint: '',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  controller: addguest.guestreqimintId,
                  label: const Text('معرف المتطلبات'),
                  hintText: 'إدخال معرف المتطلبات',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال معرف المتطلبات';
                    }
                    return null;
                  },
                  hint: '',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  controller: addguest.guestuserId,
                  label: const Text('معرف المستخدم'),
                  hintText: 'إدخال معرف المستخدم',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال معرف المستخدم';
                    }
                    return null;
                  },
                  hint: '',
                ),
                const SizedBox(height: 20.0),
                BlocConsumer<AddGuestCubit, AddGuestState>(
                  listener: (context, state) {
                    if (state is AddGuestPageLoaded) {
                      return showCustomSnackBar(context, state.masseg,
                          color: Colors.purple);
                    } else if (state is AddGuestPageError) {
                      return showCustomSnackBar(context, state.errorMessage,
                          color: Colors.purple);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddGuestPageLoading) {
                      return buildLoadingIndicator();
                    }
                    return CustomButton(
                      text: 'إضافة الضيف',
                      onTap: () {
                        addguest.addGuest();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddGuestCubit extends Cubit<AddGuestState> {
  AddGuestCubit() : super(AddGuestPageInitial());

//Sign up phone number
  TextEditingController guestname = TextEditingController();
  TextEditingController guestemail = TextEditingController();
  TextEditingController guestPhone = TextEditingController();

  TextEditingController guestaddress = TextEditingController();
  TextEditingController guestreqimintId = TextEditingController();
  TextEditingController guestuserId = TextEditingController();
  addGuest() async {
    emit(AddGuestPageLoading());

    try {
      final data = {
        'name': guestname.text,
        'email': guestemail.text,
        'phone': guestPhone.text,
        'address': guestaddress.text,
        'requirement_id': guestreqimintId.text,
        'user_id': guestuserId.text,
      };

      final response = await Dio().post(
        '$url/api/create/Guests',
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      emit(AddGuestPageLoaded(masseg: 'تم إضافة الضيف للحفلة'));

      return response;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(AddGuestPageError(errorMessage));
    } catch (e) {
      emit(AddGuestPageError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}

abstract class AddGuestState {}

class AddGuestPageInitial extends AddGuestState {}

class AddGuestPageLoading extends AddGuestState {}

class AddGuestPageLoaded extends AddGuestState {
  final String masseg;
  AddGuestPageLoaded({required this.masseg});
}

class AddGuestPageError extends AddGuestState {
  final String errorMessage;

  AddGuestPageError(this.errorMessage);
}
