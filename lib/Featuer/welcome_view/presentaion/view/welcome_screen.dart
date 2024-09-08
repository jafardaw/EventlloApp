// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../../Auth/presentaion/view/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimationWelcome;
  late Animation<Offset> _slideAnimationDetails;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _slideAnimationWelcome = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero, // End at the center of the screen
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimationDetails = Tween<Offset>(
      begin: const Offset(1, 0), // Start from the right of the screen
      end: Offset.zero, // End at its final position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    // Adding listener to AnimationController
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the signup page when the animation is complete
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 30.0,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _slideAnimationWelcome,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _slideAnimationWelcome,
                          child: child,
                        );
                      },
                      child: const Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _slideAnimationDetails,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _slideAnimationDetails,
                          child: child,
                        );
                      },
                      child: const Text(
                        'Enter personal details to your employee account',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Flexible(
          //   flex: 2,
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: Row(
          //       children: [
          //         const Expanded(
          //           child: WelcomeButton(
          //             buttonText: 'Sign in',
          //             onTap: SignInScreen(),
          //             color: Colors.transparent,
          //             textColor: Colors.white,
          //           ),
          //         ),
          //         Expanded(
          //           child: WelcomeButton(
          //             buttonText: 'Sign up',
          //             onTap: const SignUpScreen(),
          //             color: Colors.white,
          //             textColor: lightColorScheme.primary,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
