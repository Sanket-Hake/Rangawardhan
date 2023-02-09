// import 'package:firebase_storage/firebase_storage.dart';
// import'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// class gallery extends StatefulWidget {
//   const gallery({super.key});

//   @override
//   State<gallery> createState() => _galleryState();
// }

// class _galleryState extends State<gallery> {
//    List<String> _imageUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadImageUrls();
//   }

//   Future<void> _loadImageUrls() async {
//     final storageRef =
//         FirebaseStorage.instance.ref().child("gallery");
//     final items = await storageRef.listAll();
//     print(items);
//     for (var item in items.items) {
//       try {
//         final url = await item.getDownloadURL();
//         setState(() {
//           _imageUrls.add(url.toString());
//           print(_imageUrls);
//         });
//       } catch (e) {
//         print("Error getting URL: $e");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: GridView.custom(
//   gridDelegate: SliverQuiltedGridDelegate(
//     crossAxisCount: 1,
//     mainAxisSpacing: 7,
//     crossAxisSpacing: 7,
//     repeatPattern: QuiltedGridRepeatPattern.inverted,
//     pattern: [
//       QuiltedGridTile(2, 2),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 2),
//     ],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//     (context, index) => ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image(
//                     image: NetworkImage(_imageUrls[index]),
//                     fit: BoxFit.fill,
//                   ),
//                 )
//   ),
// )
//     );
//   }
// }