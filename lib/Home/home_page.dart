import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rangawardhan/Drawer/Events.dart';
import 'package:rangawardhan/Widgets/slider.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Drawer/Drawer.dart';
import '../Drawer/Team.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Drawer/natyawardhana.dart';
import 'main_home.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 30,
          centerTitle: true,
          title: Image(
            image: AssetImage("assets/Images/rangawardhan.png"),
            height: 250,
            width: 250,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        drawer: MainDrawer(),
        backgroundColor: Colors.black,
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
            buttonBackgroundColor: Color.fromARGB(255, 244, 242, 242),
            backgroundColor: Colors.transparent , 
            height: 60,
            items: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.home,
                  color: (page == 0)
                  ?  Colors.red
                  : Colors.orange,
                ),
              ),
              Icon(
                Icons.event,
                size: 30,
                 color: (page == 1)
                  ?  Colors.red
                  : Colors.orange,
              ),
              FaIcon(
                FontAwesomeIcons.userFriends,
                 color: (page == 2)
                  ?  Colors.red
                  : Colors.orange,
              ),
              Icon(
                FontAwesomeIcons.theaterMasks,
                  color: (page == 3)
                  ?  Colors.red
                  : Colors.orange,
              )
            ],
            onTap: (value) => setState(() {
              page = value;
            }),
          ),
        ));
  }
}
