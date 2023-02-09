import 'package:flutter/material.dart';
import 'package:rangawardhan/Home/home_page.dart';
import 'package:rangawardhan/Widgets/eventlist.dart';

import '../Widgets/grid.dart';
import '../Widgets/rangawardhan.dart';

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
        backgroundColor: Color.fromARGB(255, 18, 18, 18),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Upcoming Events",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  eventList(
                    name: 'upcominEvents',
                    folder: 'events',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Recent Events",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  eventList(
                    name: 'recentEvents',
                    Titles: Titles,
                    folder: 'events',
                  ),
                  Text(
                    "Past Events",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  eventList(name: 'pastEvents', folder: 'events'),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
