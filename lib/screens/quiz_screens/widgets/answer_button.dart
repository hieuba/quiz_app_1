// import 'package:flutter/material.dart';

// class AnswerButton extends StatelessWidget {
//   const AnswerButton({
//     super.key,
//     required this.text,
//     required this.onTap,
//   });
//   final String text;
//   final void Function() onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 4),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 87, 18, 99),
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12.0),
//           child: Text(
//             text,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
