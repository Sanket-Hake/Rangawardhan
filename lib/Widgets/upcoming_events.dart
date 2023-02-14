import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class Uevents extends StatefulWidget {
  

  @override
  State<Uevents> createState() => _listViewState();
}

class _listViewState extends State<Uevents> {
  FirebaseFirestore db = FirebaseFirestore.instance;
    Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db
          .collection("events")
          .where("tense" , isEqualTo: "upcoming")
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
          itemExtent: 140,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  final Uri _url = Uri.parse(
                                Value[index]["form"]);
                  _launchUrl(_url); 
                },
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
              ),
            );
          },
        );
      },
    );
  }
}
