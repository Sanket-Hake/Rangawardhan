import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Widgets/grid.dart';

class Teams extends StatelessWidget {
  Teams({super.key});

  List<String> Images2022_23 = [
    "assets/Images/team/Saurabh_pawar.jpg",
    "assets/Images/team/Tejashree_Shinde.jpg",
  ];

  List<String> Name2022_23 = ["सौरभ पवार", "तेजश्री शिंदे"];
  List<String> Position2022_23 = [
    "Secretary",
    "Secretary",
  ];

  List<String> Name2021_22 = [
    "आदित्य कुंजीर",
    "दिव्या परदेशी",
    "यश पवार",
    "अभयसिंग पाटील",
    "प्रहेश चारथळ",
    "दिव्या जाधव",
    "लेण्याद्री साळवे"
  ];

  List<String> position2021_22 = [
    "Secretary",
    "Secretary",
    "Treasurer",
    "Treasurer",
    "Chief Coordinator",
    "Chief Coordinator",
    "Chief Coordinator",
  ];

  List<String> Images2021_22 = [
    "assets/Images/2021/Aditya Kunjir.jpg",
    "assets/Images/2021/Divya Pardeshi.png",
    "assets/Images/2021/Yash Pawar.jpg",
    "assets/Images/2021/Abhay.JPG",
    "assets/Images/2021/Prahesh.jpg",
    "assets/Images/2021/Divya_CC.jpg",
    "assets/Images/2021/Lenyadri_CC.jpeg",
  ];
  List<String> position2020 = [
    "Secretary",
    "Secretary",
    "Treasurer",
    "Treasurer",
    "Chief Coordinator",
    "Chief Coordinator",
    "Chief Coordinator",
  ];

  List<String> Images2020 = [
    "assets/Images/2020/sanket.jpg",
    "assets/Images/2020/nishant.jpg",
    "assets/Images/2020/dnya.jpg",
    "assets/Images/2020/ishan.jpg",
    "assets/Images/2020/prajawal.jpg",
    "assets/Images/2020/prachi.jpg",
    "assets/Images/2020/priyanka.jpg"
  ];
  List<String> Name2020 = [
    "संकेत अडसूळ",
    "निशांत उभारे",
    "ज्ञानेश फेगडे",
    "ईशान सोनूर्लेकर",
    "प्रज्वल चव्हाणके",
    "प्राची नाईक",
    "प्रियांका घोरपडे"
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
                            color:Colors.orange,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Card(
                      color: Color.fromARGB(255, 24, 21, 21),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Grid(
                            Images: Images2022_23,
                            Titles: Name2022_23,
                            Position: Position2022_23,
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
                            Images: Images2021_22,
                            Titles: Name2021_22,
                            Position: position2021_22,
                          )),
                    ),
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

