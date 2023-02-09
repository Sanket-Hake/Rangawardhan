import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  List<String> image_name;
  String year;
  List<String>? Titles;
  List<String>? Position;
  Grid(
      {Key? key,
      this.Titles,
      this.Position,
      required this.year,
      required this.image_name})
      : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }

  Future<void> _loadImageUrls() async {
    final storageRef = FirebaseStorage.instance.ref().child(widget.year);
    final items = await storageRef.listAll();

    final itemsLength = items.items.length;

    for (int i = 0; i < items.items.length; i++) {
      try {
        final url =
            await storageRef.child('${widget.image_name[i]}').getDownloadURL();

        setState(() {
          _imageUrls.add(url);
        });
      } catch (e) {
        print("Error getting URL: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            mainAxisExtent: 180),
        itemCount: _imageUrls == null ? 0 : _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 3, color: Colors.white),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(_imageUrls[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                widget.Titles != null
                    ? Expanded(
                        flex: 1,
                        child: Text(
                          widget.Titles![index],
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                widget.Position != null
                    ? Expanded(
                        flex: 1,
                        child: Text(
                          widget.Position![index],
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
