import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animate_do/animate_do.dart';
import 'package:rangawardhan/Home/slider.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Drawer/Drawer.dart';
import '../sponsors/home_sponsor.dart';

// import 'package:google_language_fonts/google_language_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    const url = "https://youtu.be/jK89jUVU0mU";

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: false,
        ));
  }

  String content =
      "        रंगवर्धन हा VJTI, मुंबई चा चार दिवसीय वार्षिक मराठी उत्सव आहे. जो मराठी आणि मराठी नाटक, साहित्य, संगीत आणि इतर कला प्रकार यांच्याप्रचारासाठी समर्पित आहे. रंगवर्धनमार्फत डिसेंबर महिन्यात विविध प्रदर्शन,चर्चासत्रे आणि स्पर्धा आयोजित केल्या जातात. महाविद्यालयीन कार्यक्रमात नाट्य आणि संगीत सादरीकरण केले जाते. मराठी संस्कृतीचे जतन आणि आधुनिकीकरणाशी जुळवून घेऊन गेल्या वर्षांमध्ये रंगवर्धनने प्रत्येकाच्या हृदयात स्वतःसाठी एक विशेष स्थान निर्माण केले आहे. संस्कृती ही मानवी जीवनाचे हृदय आणि आत्मा आहे आणि म्हणूनच त्याचे जतन करणे हे आपले कर्तव्य आहे. हे लक्षात घेऊन रंगवर्धनची स्थापना २००० साली झाली आणि तेव्हापासून रंगवर्धन परिवारातर्फे मराठी संस्कृती साजरी केली जात आहे.रंगवर्धने कला, साहित्य आणि अशा अनेक क्षेत्रांमध्ये मराठीला महत्त्व दिले आहे. विविध स्पर्धांच्या माध्यमातून मराठी संस्कृतीचे प्रदर्शन करताना आणि नामवंत व्यक्तींच्या उपस्थितीने धन्य झाल्यामुळे रंगवर्धन दरवर्षी काहीतरी नवीन आणि प्रासंगिक देण्याचा प्रयत्न करत आहे.";
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 40,
            // title: Container(
            //   width: 60,
            //   child: Image(
            //     image: AssetImage("assets/Images/Rangwardhan_Logo.png"),
            //   ),
            // ),
            centerTitle: true,
            title: Text(
              "रंगवर्धन",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.orange),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 24, 24, 24),
          drawer: MainDrawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: slider(),
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
                          child: Text(
                            "वीरमाता जिजाबाई तंत्रज्ञान संस्था प्रस्तुत,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.orange),
                          ),
                        ),
                        Center(
                          child: Text(
                            "रंगवर्धन २१-२२",
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
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ReadMoreText(
                              content,
                              textAlign: TextAlign.justify,
                              trimLines: 7,
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
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(20),
                            //   border: Border.all(width: 0, color: Colors.grey),
                            // ),
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: player,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "  Our Sponsors",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Card(
                          color: Color.fromARGB(255, 36, 35, 35),
                          // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 40,
                          shadowColor: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Sponsor(),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(
                                            255, 214, 133, 12), // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {},
                                      child: Text('More Sponsors'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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

Widget grid() {
  return GridView.count(
    crossAxisCount: 2,
    children: <Widget>[
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 10.0),
            Text('Image 1')
          ],
        ),
      ),
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 10.0),
            Text('Image 2')
          ],
        ),
      ),
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 10.0),
            Text('Image 3')
          ],
        ),
      ),
      Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 10.0),
            Text('Image 4')
          ],
        ),
      ),
    ],
  );
}
