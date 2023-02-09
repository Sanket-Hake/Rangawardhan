import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  String name ; 
  double extent ;
   listView({super.key , required this.name , required this.extent});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {


  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }

  Future<void> _loadImageUrls() async {
    final storageRef =
        FirebaseStorage.instance.ref().child(widget.name);
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

  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: _imageUrls.length,
      itemExtent: widget.extent,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left : 6 , right:6 ),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 3, color: Colors.white),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                  _imageUrls[index]),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
