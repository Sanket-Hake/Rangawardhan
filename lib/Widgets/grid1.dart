import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Grid1 extends StatefulWidget {
  String name;
  Grid1({Key? key, required this.name}) : super(key: key);

  @override
  State<Grid1> createState() => _Grid1State();
}

class _Grid1State extends State<Grid1> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }

  Future<void> _loadImageUrls() async {
    final storageRef = FirebaseStorage.instance.ref().child(widget.name);
    final items = await storageRef.listAll();
    print(items);
    for (var item in items.items) {
      try {
        final url = await item.getDownloadURL();
        setState(() {
          _imageUrls.add(url.toString());
          print(_imageUrls);
        });
      } catch (e) {
        print("Error getting URL: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 12,
          // mainAxisSpacing: 12,
          mainAxisExtent: 110),
      itemCount: _imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.white),
            ),
            child: Expanded(
              flex: 6,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(_imageUrls[index]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
