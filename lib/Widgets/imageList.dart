import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class listView extends StatefulWidget {
  String name;
  double extent;
  String keys;
  String values;
  listView(
      {super.key,
      required this.name,
      required this.extent,
      required this.keys,
      required this.values});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db
          .collection(widget.name)
          .where(widget.keys, isEqualTo: widget.values)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
         final Value = (snapshot.data! as QuerySnapshot).docs;
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Value.length,
          itemExtent: widget.extent,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Colors.white),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(Value[index]["url"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
