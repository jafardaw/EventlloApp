import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/Featuer/Auth/presentaion/manger/auth_cubit/user_cubit_cubit.dart';
import 'package:event_testing/Featuer/home/presentation/home_view.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom-text-field.dart';
import 'package:event_testing/core/widgets/custom_button.dart';
import 'package:event_testing/core/widgets/custome_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import 'widget/row_divider_auth_widget.dart';
import 'widget/row_icon_auth_widget.dart';
import 'widget/row_navigator_auth_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool rememberPassword = true;
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
                  key: _formSignInKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'welcome_back'.tr(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomTextfield(
                        controller: cubit.signInEmail,
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
                        controller: cubit.signInpassword,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: rememberPassword,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberPassword = value!;
                                    });
                                  },
                                  activeColor: Colors.purple),
                              Text(
                                'remember_me'.tr(),
                                style: const TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'forget_password'.tr(),
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
                          if (state is SignInSuccess) {
                            showCustomSnackBar(context, state.message,
                                color: Colors.purpleAccent);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => const HomeView(),
                              ),
                            );
                          } else if (state is SignInFailure) {
                            showCustomSnackBar(context, state.errorMessage,
                                color: Colors.red);
                          }
                        },
                        builder: (context, state) {
                          if (state is SignInLoading) {
                            return buildLoadingIndicator();
                          }
                          return CustomButton(
                            text: 'signin'.tr(),
                            onTap: () {
                              validateMethod(cubit);
                            },
                          );
                        },
                      ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedBottonAuth(
                      //       formSignupKey: _formSignInKey,
                      //       agreePersonalData: rememberPassword),
                      // ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const RowDividerAuthWidget(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const RowIconAuthWidget(),

                      const SizedBox(
                        height: 25.0,
                      ),
                      // don't have an account
                      RowNavigatorAuthwidget(
                        text: 'dont_have_account'.tr(),
                        text1: 'sign_up'.tr(),
                      ),
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

  void validateMethod(UserCubitCubit userCubit) {
    if (_formSignInKey.currentState?.validate() ?? false) {
      userCubit.signIn();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
