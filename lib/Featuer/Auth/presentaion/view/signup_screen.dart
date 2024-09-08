import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/Featuer/Auth/presentaion/manger/auth_cubit/user_cubit_cubit.dart';
import 'package:event_testing/Featuer/Auth/presentaion/view/signin_screen.dart';
import 'package:event_testing/Featuer/home/presentation/home_view.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/style.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import 'widget/row_divider_auth_widget.dart';
import 'widget/row_icon_auth_widget.dart';
import 'widget/row_navigator_auth_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserCubitCubit>();
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'get_started'.tr(),
                        style:
                            Styles.textStyle30.copyWith(color: Colors.purple),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // full name

                      CustomTextfield(
                        controller: cubit.signUpFullName,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_name'.tr();
                          }
                          return null;
                        },
                        label: Text('full_name'.tr()),
                        hintText: 'enter_full_name'.tr(),
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),

                      CustomTextfield(
                        controller: cubit.signUpEmail,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_email'.tr();
                          }
                          return null;
                        },
                        label: Text('email'.tr()),
                        hintText: 'enter_email'.tr(),
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      CustomTextfield(
                        controller: cubit.signUpPAssowrd,
                        hint: '',
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_password'.tr();
                          }
                          return null;
                        },
                        label: Text('password'.tr()),
                        hintText: 'enter_password'.tr(),
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: agreePersonalData,
                              onChanged: (bool? value) {
                                setState(() {
                                  agreePersonalData = value!;
                                });
                              },
                              activeColor: Colors.purple),
                          Text(
                            'i_agree_to_the_processing_of'.tr(),
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: _showPersonalDataDialog,
                            child: Text(
                              'personal_data'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      BlocConsumer<UserCubitCubit, UserCubitState>(
                        listener: (context, state) {
                          if (state is SignUpSuccess) {
                            showCustomSnackBar(context, state.message,
                                color: Colors.purpleAccent);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => const SignInScreen(),
                              ),
                            );
                          } else if (state is SignUpFailure) {
                            showCustomSnackBar(context, state.errorMessage,
                                color: Colors.red);
                          }
                        },
                        builder: (context, state) {
                          if (state is SignUpLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.purple),
                            );
                          }
                          return CustomButton(
                            text: 'sign_up'.tr(),
                            onTap: () {
                              validateMethod(cubit);
                            },
                          );
                        },
                      ),
                      // signup button
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedBottonAuth(
                      //       formSignupKey: _formSignupKey,
                      //       agreePersonalData: agreePersonalData),
                      // ),
                      const SizedBox(
                        height: 30.0,
                      ),

                      const RowDividerAuthWidget(),

                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up social media logo
                      const RowIconAuthWidget(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      RowNavigatorAuthwidget(
                          text: 'already_have_account'.tr(),
                          text1: 'signin'.tr()),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPersonalDataDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('personal_data_processing_agreement'.tr()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('your_data_kept_confidential'.tr()),
                const SizedBox(height: 10),
                Text('data_used_official_purposes'.tr()),
                // Add more conditions here
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('agree'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void validateMethod(UserCubitCubit userCubit) {
    if (_formSignupKey.currentState?.validate() ?? false) {
      userCubit.signUp();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
