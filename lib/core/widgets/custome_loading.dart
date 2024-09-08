// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// Widget buildLoadingIndicator() {
//   return Scaffold(
//     body: Center(
//       child: SpinKitFadingGrid(
//         itemBuilder: (BuildContext context, int index) {
//           return const DecoratedBox(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.purple,
//                   Colors.pinkAccent,
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }

// import 'package:flutter/material.dart';

// Widget buildLoadingIndicator() {
//   return const Scaffold(
//     body: Center(
//       child: LoadingText(),
//     ),
//   );
// }

// class LoadingText extends StatefulWidget {
//   const LoadingText({super.key});

//   @override
//   _LoadingTextState createState() => _LoadingTextState();
// }

// class _LoadingTextState extends State<LoadingText>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<int> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     )..repeat();
//     _animation = IntTween(begin: 0, end: 3).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         String dots = '.' * (_animation.value + 1);
//         return RichText(
//           text: TextSpan(
//             style: const TextStyle(fontSize: 24, color: Colors.purple),
//             children: [
//               const TextSpan(text: 'loading'),
//               TextSpan(text: dots),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

Widget buildLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.purple,
    ),
  );
}
