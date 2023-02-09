import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:readmore/readmore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  About({super.key});
  String Content =
      "      वीरमाता जिजाबाई टेक्नॉलॉजिकल इन्स्टिट्यूट मध्ये गेल्या २१ वर्षापासून अविरत कार्यरत असणारी रंगवर्धन ही एक मराठी संस्कृती जपणारी आणि राजभाषेचा आवाज टिकवणारी समिती ! मराठी संस्कृतीचा सन्मान करणारं मराठी व्यासपीठ म्हणून नेहमीच प्रत्येक मराठी मनात रंगवर्धनने घर केलं आहे. देशातील एक सर्वोत्तम अभियांत्रिकी महाविद्यालय असूनही मराठीसाठी काम करण्यास रंगवर्धन बांधिल आहे. मराठी कलावंतांना, गौरवास्पद काम करणाऱ्या अद्वितीय व्यक्तिमत्त्वांना तसेच अभियंत्यांच्या कलागुणांना वाव देणारं रंगवर्धन !‘मराठी वाड़्मय मंडळ’ नावाने मराठीचा जागर अनेक वर्ष करत २००१ मध्ये याला प्रत्येक मराठी माणसाच्या जीवनात रंग भरणारं म्हणून ‘रंगवर्धन’ नामकरण करण्यात आलं. अनेक वर्षांच्या अखंड प्रयत्नांनी रंगवर्धनने फक्त महाविद्यालयातच नव्हे तर मुंबईतील मानाच्या मराठी सोहळ्यात आपलं नाव कोरलं. तमाम महाराष्ट्रातील रसिक प्रेक्षक आणि राष्ट्रीय पातळीवर नाट्य सादर करणाऱ्या अनेक महाविद्यालयांना, महाराष्ट्रातील उत्तम गायकांना आणि मराठी सिनेसृष्टीतील अनेक गुणवंत कलाकारांना भुरळ पडली आहे. या प्रवासात अभियंत्यांसह महाराष्ट्रातील असंख्य दिग्गजांनी उपस्थिती लावून रंगवर्धनच्या यशोगाथेस हातभार लावला. मनोरंजनासह प्रबोधन आणि प्रोत्साहन, मार्गदर्शनपर कार्य रंगवर्धन नेहमीच करत आलं आहे.मराठी साहित्यास प्रोत्साहन देत लेखन, कथन, काव्य, संगीत, नृत्य, गायन, वादन, नाट्य, पथनाट्य, एकांकिका अशा अनेक स्पर्धा रंगवर्धनतर्फ आयोजित करण्यात येतात. मराठी संगीत मैफिली, सिनेसृष्टीतील मान्यवरांशी गप्पा गोष्टी रंगवर्धनची शोभा वाढवतात. वर्षभर चालणारं हे रंगवर्धन आयुष्यभर पुरेल एवढ्या आठवणींची शिदोरी देऊन आपल्या मातृभाषेवरील प्रेम अधिक वृद्धिंगत करून जातं, असं म्हटलं तर त्यात वावगं ठरणार नाही.";

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FadeInDownBig(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Images/VJTI_Mumbai.jpeg"),
                        fit: BoxFit.cover),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      image: AssetImage(
                        "assets/Images/rangwardhan.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "  मराठी अस्मितेची मराठी शान,\n मराठी परंपरेचा मराठी अभिमान,\nमराठी संस्कृतीचा मराठी अभिमान,",
                          style: TextStyle(fontSize:17 , color: Colors.white , fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "About the Committee",
                          style: const TextStyle(
                              color: Colors.orange , 
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        color: Color.fromARGB(255, 36, 35, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ReadMoreText(
                            Content,
                            textAlign: TextAlign.justify,
                            trimLines: 9,
                            colorClickableText:
                                Color.fromARGB(255, 231, 200, 154),
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' Show more',
                            trimExpandedText: ' Show less',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight:FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                          flex: 1,
                          child: FaIcon(FontAwesomeIcons.locationDot , color: Colors.white) ,), 
                          Expanded(
                            flex: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                               
                                Center(
                                  child: Text(
                                    " H R Mahajani Rd, Matunga",
                                    style: const TextStyle(
                                        color: Colors.orange ,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Mumbai, Maharashtra 400019",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         Expanded(
                          flex: 2,
                          child: FaIcon(FontAwesomeIcons.message , color: Colors.white) ,), 
                          Expanded(
                            flex: 10,
                            child: Text(
                              "rangawardhanfest@gmail.com",
                              style: const TextStyle(
                               color: Colors.orange ,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.twitter),
                          color: Colors.white,
                          onPressed: () {
                            final Uri _url =
                                Uri.parse('https://twitter.com/Rangawardhan');
                            _launchUrl(_url);
                          }),
                      SizedBox(width: 10.0),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.instagram),
                          color: Colors.white,
                          onPressed: () {
                            final Uri _url = Uri.parse(
                                'https://www.instagram.com/rangawardhan/');
                            _launchUrl(_url);
                          }),
                      SizedBox(width: 10.0),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.youtube),
                          color: Colors.white,
                          onPressed: () {
                            final Uri _url = Uri.parse(
                                'https://www.youtube.com/c/Rangawardhan/featuredss');
                            _launchUrl(_url);
                            print("Pressed");
                          }),
                      SizedBox(width: 10.0),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook),
                          color: Colors.white,
                          onPressed: () {
                            final Uri _url = Uri.parse(
                                'https://www.facebook.com/Rangawardhan');
                            _launchUrl(_url);

                            print("Pressed");
                          }),
                      SizedBox(width: 10.0),
                      IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          color: Colors.white,
                          onPressed: () {
                            final Uri _url = Uri.parse(
                                'https://www.linkedin.com/school/rangawardhan/');
                            _launchUrl(_url);
                            print("Pressed");
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
