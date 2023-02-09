import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rangawardhan/Drawer/Events.dart';
import 'package:rangawardhan/Home/slider.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Drawer/Drawer.dart';
import '../Drawer/Team.dart';
import '../Widgets/grid1.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Drawer/n_main.dart';
import 'main_home.dart';

// import 'package:google_language_fonts/google_language_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
  final screens = [
    main_home(),
    ranagaEvent(),
    Teams(),
    NMain(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[page],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
          child: CurvedNavigationBar(
            index: page,
            color: Colors.black,
            // buttonBackgroundColor: Color.fromARGB(255, 210, 205, 205),
            backgroundColor: Colors.red,
            height: 60,
            items: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.home,
                  color: Colors.orange,
                ),
              ),
              Icon(
                Icons.event,
                size: 30,
                color: Colors.orange,
              ),
              // ImageIcon(
              //   AssetImage("assets/Images/event.png"),
              //   color: Colors.orange,
              // ),
          
              FaIcon(
                FontAwesomeIcons.userFriends,
                color: Colors.orange,
              ),
              Icon(
                FontAwesomeIcons.theaterMasks,
                color: Colors.orange,
              )
            ],
            onTap: (value) => setState(() {
              page = value;
            }),
          ),
        ));
  }
}
