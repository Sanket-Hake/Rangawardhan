import 'package:flutter/material.dart';
import 'package:rangawardhan/Home/home_page.dart';

import '../Widgets/grid.dart';
import '../Widgets/rangawardhan.dart';
import '../sponsors/home_sponsor.dart';

class Events extends StatelessWidget {
  Events({super.key});
  List<String> pEvents = [
    "assets/Images/Events/DecemberToRemeber.jpg",
    "assets/Images/Events/AnnualEvent.png",
    "assets/Images/Events/Virutal_Event.png"
  ];

  List<String> events = [
    "assets/Images/Events/shubharambh.jpg",
    "assets/Images/Events/rangaKatta.jpg",
    "assets/Images/Events/bhatakanti.jpg",
  ];

  List<String> Titles = [
    "शुभारंभ",
    "रंगा कट्टा",
    "भटकंती",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 18, 18),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                customAppBar(),
                Center(
                  child: Text(
                    "रंगवर्धन: आवाज मराठी मनाचा !",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10 , right: 10),
                   child: Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Current Events",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                                 ),
                                 SizedBox(
                    height: 10,
                                 ),
                                 Grid(
                    Images: events,
                    Titles: Titles,
                                 ),
                   
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Past Events",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                                 ),
                                 SizedBox(
                  height: 10,
                ),
                 Grid(
                  Images:pEvents ,
                 
                ),
                    ],
                   ),
                 ), 
                 
               
              ],
            )),
      ),
    );
  }
}
