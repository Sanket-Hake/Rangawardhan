import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rangawardhan/Home/home_page.dart';
import '../Widgets/team.dart';
import '../Widgets/appBar.dart';
import '../Widgets/imageList.dart';

class ranagaEvent extends StatelessWidget {
  // Events({super.key});

  List<String> Titles = [
    "भटकंती",
    "रंगा कट्टा",
    "शुभारंभ",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customAppBar(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "रंगवर्धन: आवाज मराठी मनाचा !",
                      style: TextStyle(
                         fontFamily: "TiroDevanagariSanskrit",
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Upcoming Events",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listView(
                            name: "events",
                            extent:150,
                            keys: "tense",
                            values: "upcoming")),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Recent Events",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 165,
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listView(
                            name: "events",
                            extent: 150,
                            keys: "tense",
                            values: "recent")),
                  ),
                  // SizedBox(height: 16),
                  // Text(
                  //   "Past Events",
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       color: Colors.orange,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(
                    height: 8,
                  ),
                  // Container(
                  //         height: 200,
                  //         width: double.infinity,
                  //         child: Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: listView(
                  //                 name: "events",
                  //                 extent: 140,
                  //                 keys: "tense",
                  //                 values: "past")),
                  //       ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
