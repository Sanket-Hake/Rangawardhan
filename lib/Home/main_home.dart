import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rangawardhan/Home/slider.dart';
import 'package:rangawardhan/Widgets/more.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Drawer/Drawer.dart';
import '../Widgets/grid1.dart';
import '../Widgets/upcomin-listview.dart';

class main_home extends StatefulWidget {
  const main_home({super.key});

  @override
  State<main_home> createState() => _main_homeState();
}

class _main_homeState extends State<main_home> {
  late YoutubePlayerController controller;
  List<String> _imageUrls = [];
  List<String> _imageUrls_event = [];
  @override
  void initState() {
    const url = "https://youtu.be/ZgYfb7YGktg";

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: false,
        ));
    _loadImageUrls();
    _loadImageUrls_events();
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _loadImageUrls() async {
    final storageRef = FirebaseStorage.instance.ref().child("slider");
    final items = await storageRef.listAll();
    print(items);
    for (var item in items.items) {
      try {
        final url = await item.getDownloadURL();
        setState(() {
          _imageUrls.add(url.toString());
          print(_imageUrls);
        });
      } catch (e) {
        print("Error getting URL: $e");
      }
    }
  }

  Future<void> _loadImageUrls_events() async {
    final storageRef =
        FirebaseStorage.instance.ref().child('events').child("upcominEvents");
    final items = await storageRef.listAll();

    for (var item in items.items) {
      try {
        final url = await item.getDownloadURL();
        setState(() {
          _imageUrls_event.add(url.toString());
        });
      } catch (e) {
        print("Error getting URL: $e");
      }
    }
  }

  String content =
      "       परीस एक असा धातू जो लोखंडाला स्पर्श करताच त्याचे रूपांतर सोन्यात करतो. असाच काहीसा स्पर्श आपल्या मराठी संस्कृतीचा आहे. विविध चालीरितींनी नटलेली वैभवशाली अशी आपली संस्कृती जी स्पर्शून गेल्यावर ज्याला स्पर्शीले त्यास उज्वल करते, स्वतःबद्दल विश्वास निर्माण करत जगण्याचा आनंद कळवते ! हाच स्पर्श अनुभवून देण्यासाठी रंगवर्धन २०२२-२३ घेऊन येत आहे .";

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:Colors.black , 
            elevation: 30,
            centerTitle: true,
            title: Image(
              image: AssetImage("assets/Images/rangwardhan.png"),
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
          backgroundColor: Color.fromARGB(255, 24, 24, 24),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  SizedBox(
                  //   height: 10,
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  slider(
                    imageUrls: _imageUrls,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: AutoSizeText(
                            "वीरमाता जिजाबाई तंत्रज्ञान संस्था प्रस्तुत,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.orange),
                            maxLines: 1,
                          ),
                        ),
                        Center(
                          child: Text(
                            "रंगवर्धन'२२-२३",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.orange),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          color: Color.fromARGB(255, 36, 35, 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 40,
                          shadowColor: Color.fromARGB(255, 30, 6, 110),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ReadMoreText(
                              content,
                              textAlign: TextAlign.justify,
                              trimLines: 10,
                              colorClickableText:
                                  Color.fromARGB(255, 231, 200, 154),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: ' Show more',
                              trimExpandedText: ' Show less',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: AutoSizeText(
                            "॥परीस स्पर्श मराठी संस्कृतीचा॥",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.orange),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: player,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        !_imageUrls_event.isEmpty
                            ? Text(
                                'Register for Upcoming Events',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.orange,
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 8,
                        ),
                        !_imageUrls_event.isEmpty
                            ? Card(
                                color: Color.fromARGB(255, 36, 35, 35),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 40,
                                shadowColor: Color.fromARGB(255, 30, 6, 110),
                                child: Container(
                                  height: 190,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      primary: false,
                                      // shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _imageUrls_event.length,
                                      itemExtent: 150,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            final Uri _url = Uri.parse(
                                                'https://docs.google.com/forms/d/e/1FAIpQLSfqStOU-IzhBNZ9x-UGO-LMspEdxGMv44JfAhAVOYXcXGwBFQ/viewform');
                                            _launchUrl(_url);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 6, right: 6),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 3,
                                                  color: Colors.white),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                image: NetworkImage(
                                                    _imageUrls_event[index]),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        //  slider. BuildIndicator() ,
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Our Special Guest',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => more(
                                      Count: 2,
                                      extend: 180,
                                      name: 'specialGuest',
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'See All > ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 246, 208, 152),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Card(
                          color: Color.fromARGB(255, 36, 35, 35),
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 40,
                          shadowColor: Color.fromARGB(255, 30, 6, 110),
                          child: Container(
                            height: 160,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: listView(
                                name: "specialGuest",
                                extent: 120,
                              ),
                            ),
                          ),
                        ),
                        // Card(
                        //   color: Color.fromARGB(255, 36, 35, 35),
                        //   margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30)),
                        //   elevation: 40,
                        //   shadowColor: Color.fromARGB(255, 30, 6, 110),
                        //   child: Container(
                        //     height: 160,
                        //     width: double.infinity,
                        //     child: Padding(
                        //          padding: const EdgeInsets.all(8.0),
                        //       child: listView(name: "specialGuest"),
                        //       // child: ListView.builder(
                        //       //   primary: false,
                        //       //   shrinkWrap: true,
                        //       //   scrollDirection: Axis.horizontal,
                        //       //   itemCount: 5,
                        //       //   itemExtent: 110,
                        //       //   itemBuilder: (context, index) {
                        //       //     return Padding(
                        //       //       padding: EdgeInsets.all(5),
                        //       //       child: ClipRRect(
                        //       //         borderRadius: BorderRadius.circular(50.0),
                        //       //         child: Image.network(
                        //       //           "https://starsunfolded.com/wp-content/uploads/2021/06/Hruta-Durgule.jpg",
                        //       //           width: 100.0,
                        //       //           height: 10.0,
                        //       //           fit: BoxFit.cover,
                        //       //         ),
                        //       //       ),
                        //       //     );
                        //       //   },
                        //       // ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "  Our Sponsors",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Card(
                          color: Color.fromARGB(255, 36, 35, 35),
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 40,
                          shadowColor: Color.fromARGB(255, 30, 6, 110),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Grid1(name: "top_sponsors"),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(
                                            255, 214, 133, 12), // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => more(
                                                Count: 3,
                                                    extend: 100,
                                                    name: 'sponsors',
                                                  )),
                                        );
                                      },
                                      child: Text('More Sponsors'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
