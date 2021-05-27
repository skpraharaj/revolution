// import 'package:flutter/material.dart';
// import 'package:revolution/models/message_model.dart';

// class FavouriteContacts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Favourite Contacts',
//                 style: TextStyle(
//                   color: Colors.blueGrey,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.more_horiz,
//                 ),
//                 iconSize: 25.0,
//                 color: Colors.blueGrey,
//                 onPressed: () {},
//               )
//             ],
//           ),
//         ),
//         Container(
//           height: 120.0,
//           color: Colors.blue,
//           child: ListView.builder(
//               padding: EdgeInsets.only(left: 10.0),
//               scrollDirection: Axis.horizontal,
//               itemCount: favorites.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     Text(favorites[index].name),
//                   ],
//                 );
//               }),
//         )
//       ],
//     );
//   }
// }
