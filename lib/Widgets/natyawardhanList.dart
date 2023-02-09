import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class natyawardhan extends StatefulWidget {
  List<String> image_name;
  String folder;

  List<String>? Titles;
  List<String>? Position;
  natyawardhan(
      {Key? key,
      this.Titles,
      this.Position,
      required this.folder,
      required this.image_name})
      : super(key: key);

  @override
  State<natyawardhan> createState() => _natyawardhanState();
}

class _natyawardhanState extends State<natyawardhan> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }

  Future<void> _loadImageUrls() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('natyawardhan')
        .child('${widget.folder}');
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
            crossAxisSpacing: 12,
            mainAxisSpacing: 18,
            mainAxisExtent: 180),
        itemCount: _imageUrls == null ? 0 : _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 3, color: Colors.white),
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
                  SizedBox(
                    height: 3.0,
                  ),
                  widget.Titles != null
                      ? Center(
                          child: AutoSizeText(
                            widget.Titles![index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                            maxLines: 1,
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  widget.Position != null
                      ? Center(
                          child: AutoSizeText(
                            widget.Position![index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white),
                            maxLines: 1,
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
            ),
          );
        },
      ),
    );
  }
}
