// import 'package:d2yrestaurant/models/drink.dart';
// import 'package:d2yrestaurant/models/restaurant.dart';
// import 'package:flutter/material.dart';

// class DrinkList extends StatelessWidget {
//   final Restaurants restaurants;

//   const DrinkList({Key? key, required this.restaurants}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 8.0, bottom: 16.0),
//       height: 120,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: restaurants.menus.drinks?.length,
//         itemBuilder: (context, index) {
//           return _buildDrinkList(context, restaurants.menus.drinks![index]);
//         },
//       ),
//     );
//   }
// }

// Widget _buildDrinkList(BuildContext context, Drinks drink) {
//   return InkWell(
//     onTap: () {},
//     child: Container(
//       width: MediaQuery.of(context).size.width / 3,
//       height: 120,
//       margin: const EdgeInsets.all(4.0),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 0,
//               blurRadius: 4,
//               offset: const Offset(2, 2),
//             )
//           ],
//           border: Border.all(width: 0.1),
//           borderRadius: const BorderRadius.all(Radius.circular(8.0))),
//       // width: 130,
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                   margin: const EdgeInsets.all(4.0),
//                   height: 120,
//                   width: 80,
//                   child: Image.asset(
//                     'assets/images/drink.jpg',
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 child: Center(
//                   child: Text(
//                     drink.name,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
