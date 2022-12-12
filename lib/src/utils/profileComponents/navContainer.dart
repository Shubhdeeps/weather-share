// import 'package:flutter/material.dart';
// import '../utils.dart';

// class NavContainer extends StatelessWidget {
//   final Function tabChange;
//   final int tab;
//   const NavContainer(this.tabChange, this.tab, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               backgroundColor: tab == 0
//                   ? const Color.fromARGB(10, 255, 255, 255)
//                   : Colors.transparent,
//             ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//             onPressed: () => tabChange(0),
//             child: const Padding(
//                 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                 child: Text('SHARED')),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               backgroundColor: tab == 1
//                   ? const Color.fromARGB(10, 255, 255, 255)
//                   : Colors.transparent,
//             ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
//             onPressed: () => tabChange(1),
//             child: const Padding(
//                 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                 child: Text('FOLLOWERS')),
//           ),
//         ],
//       ),
//     );
//   }
// }
