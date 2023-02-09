import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Widgets/grid.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Images/VJTI_Mumbai.jpeg"),
                      fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "रंगवर्धन",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 100,
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                "assets/gif/Rangawardhan.gif",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "  व्ही. जे. टी. आय. चे मराठी मन\nआपलं तन, मन, धन फक्त रंगवर्धन",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "रंगवर्धन २०२२-२३",
                        style: TextStyle(
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
                          child: Grid(
                            Titles: name2023,
                            Position: position2023,
                            year: 'team2023',
                            image_name: image2023 , 
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "रंगवर्धन २०२१-२२",
                        style: TextStyle(
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
                            child: Grid(
                            Titles: name2022,
                            Position: position2022,
                            year: 'team_2022',
                            image_name: image2022 , 
                          ))),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
