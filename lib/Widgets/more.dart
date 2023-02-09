import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class more extends StatefulWidget {
  String name;
  int Count ; 
  double extend ;
  more({Key? key, required this.name ,required this.Count ,  required this.extend}) : super(key: key);

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
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
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.Count,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              
              mainAxisExtent: widget.extend),
          itemCount: _imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
            );
          },
        ),
    );
  }
}
