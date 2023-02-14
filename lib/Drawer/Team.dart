import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Widgets/team.dart';
import '../Widgets/appBar.dart';

class Teams extends StatelessWidget {
  Teams({super.key});

  List<String> name2023 = ["सौरभ पवार", "तेजश्री शिंदे"];
  List<String> image2023 = ["सौरभ पवार.jpg", "तेजश्री शिंदे.jpg"];
  List<String> position2023 = [
    "Secretary",
    "Secretary",
  ];

  List<String> name2022 = [
    "आदित्य कुंजीर",
    "दिव्या परदेशी",
    "यश पवार",
    "अभयसिंग पाटील",
    "प्रहेश चारथळ",
    "दिव्या जाधव",
    "लेण्याद्री साळवे"
  ];
  List<String> image2022 = [
    "आदित्य कुंजीर.jpg",
    "दिव्या परदेशी.png",
    "यश पवार.jpg",
    "अभयसिंग पाटील.JPG",
    "प्रहेश चारथळ.jpg",
    "दिव्या जाधव.jpg",
    "लेण्याद्री साळवे.jpeg"
  ];
  List<String> position2022 = [
    "Secretary",
    "Secretary",
    "Treasurer",
    "Treasurer",
    "Chief Coordinator",
    "Chief Coordinator",
    "Chief Coordinator",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBar(),
          //       Center(
          //   child: Text(
          //     "  व्ही. जे. टी. आय. चे मराठी मन\nआपलं तन, मन, धन फक्त रंगवर्धन",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                 
                  Center(
                    child: Text(
                      "रंगवर्धन २०२२-२३",
                      style: TextStyle(
                         fontFamily: "TiroDevanagariSanskrit",
                          color: Colors.orange,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 8,) , 
                  Card(
                    color: Color.fromARGB(255, 24, 21, 21),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 40,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Grid( name: 'team' )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Text(
                      "रंगवर्धन २०२१-२२",
                      style: TextStyle( fontFamily: "TiroDevanagariSanskrit",
                          color: Colors.orange,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Card(
                      color: Color.fromARGB(255, 24, 21, 21),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 40,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:Grid( name: 'team_2022' ))),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
