// import 'package:flutter/material.dart';

// import '../../../../core/utils/media_query_utils.dart';


// class CustomAppBar extends StatelessWidget {
//   final String text;

//   const CustomAppBar({
//     super.key,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 110,
//       width: MediaQueryUtils.getScreenWidth(context),
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration:  BoxDecoration(
//         color: Theme.of(context).colorScheme.primary,
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: MediaQueryUtils.getHeightPercentage(context, 0.01),
//           ),
//           const Text(
//             'Standard Wash',
//             style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: MediaQueryUtils.getHeightPercentage(context, 0.02),
//           ),
//           Text(
//             text,
//             style: const TextStyle(
//                 fontSize: 25.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
