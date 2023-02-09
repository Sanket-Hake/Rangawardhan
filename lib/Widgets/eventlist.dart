import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class eventList extends StatefulWidget {
  String folder;
  String name;
  List<String>? Titles;
  eventList({Key? key, required this.name, required this.folder, this.Titles})
      : super(key: key);

  @override
  State<eventList> createState() => eventListState();
}

class eventListState extends State<eventList> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }

  Future<void> _loadImageUrls() async {
    final storageRef =
        FirebaseStorage.instance.ref().child(widget.folder).child(widget.name);
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
    return !_imageUrls.isEmpty
        ? Container(
            height: 210,
            child: ListView.builder(
              
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _imageUrls.length,
              itemExtent: 150,

              itemBuilder: (context, index) {
                return Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(25),
                  //   border: Border.all(width: , color: Colors.white),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: NetworkImage(_imageUrls[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        widget.Titles != null
                            ? Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    widget.Titles![index],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
