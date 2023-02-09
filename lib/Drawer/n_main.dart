import 'package:flutter/material.dart';
import 'package:rangawardhan/Widgets/eventlist.dart';
import 'package:rangawardhan/Widgets/grid.dart';
import 'package:readmore/readmore.dart';

import '../Widgets/natyawardhanList.dart';

class NMain extends StatefulWidget {
  const NMain({Key? key}) : super(key: key);

  @override
  _NMainState createState() => _NMainState();
}

class _NMainState extends State<NMain> {
 

  @override
  Widget build(BuildContext context) {
     String content =
      "     खऱ्या-खोट्या आयुष्याचा साधलेला मेळ, काय खरं? काय खोटं? नाटक तर केवळ भावनांचा खेळ. नाटक निर्माण करतं द्वंद्वात्मक जीवनाची जाणीव, नाटक तर नऊ रसांनी संपन्न, जशी चमचमीत भेळ. नाटक नसतं कोणा एकासाठी, थांबत नाहीच मुळी कुणासाठी. नाटक हा साहित्यप्रकार, परि, तो सामूहिक आविष्कार. त्यात व्यक्त होणं असतचं जणू समुहासाठी.नाटक अर्थातच जीवनाची अनुकृती. नाटक म्हणजे केवळ 45 मिनिटांची एकांकिका नाही व 3 तासांचा प्रायोग नाही तर नाटक म्हणजे, लेखक, दिग्दर्शक, कलाकार, पात्र, घटना, नेपथ्य, वेषभूषा, या सर्वाच्या कष्टाचा, प्रयत्नांचा जणू जीवनपटच असतो. नाटकाला, रंगभूमीला आपण जेवढं प्रामाणिकपणे देऊ, नाटक तितकें व पटीने परत आपल्याला काहीतरी नक्कीच देतं. ज्यांना नाटक करणं महत्त्वाचं वाटतं, त्याहूनही पुढे जाऊन नाटक जगणं महत्त्वच वाटतं. अश्या विचारांतून, याच तळमळीने एका अभियांत्रिकी महाविद्यालयात आपल्या प्रयत्नांतून ऊभा होतं असलेलं आपलं नाट्यवर्धन! जिथे केली जाते कलेची साधना, प्रकाशात आणले जातात विचार अणि भावना. जिथे प्रत्येक कलेचा व कलाकाराचा केला जातो आदर , चला तर मग साथीने धरुया आपल्या नाट्यवर्धनचा पदर!";

  List<String> names = [
    "🎭सर्वोत्कृष्ट अभिनेत्री🎭",
    "🎭सर्वोत्कृष्ट एकांकिका🎭",
    "🎭शहाण्या माणसाचा चष्मा🎭",
    "🎭 हर्लेक्विन 🎭",
    "🎭 कवडसा २०१९ 🎭",
    "🎭 कवडसा २०१७ 🎭",
  ];

  List<String> images_drama = [
    'abhinetri.jpg',
    'akankika.jpg',
    'chasma.jpg',
    'harlequin.jpeg',
    'kavadasa.jpg',
    'kavadasa2017.jpg',
  ];

  List<String> name = ["प्रतिक देवकते", "आयुष देशपांडे", "अमित कापसे"];

  List<String> sanchalak = ["pratik.jpg", 'ayush.jpg', 'amit.jpg'];

  List<String> position = ["Committee Head", "Co-ordinator", "Co-ordinator"];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage(
                        "assets/Images/natyawardhan.jpg",
                      ),
                      fit: BoxFit.fill,
                    ),
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
                      content,
                      textAlign: TextAlign.justify,
                      trimLines: 7,
                      colorClickableText: Color.fromARGB(255, 231, 200, 154),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Show less',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "कारकीर्द : ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 40,
                    color: Color.fromARGB(255, 24, 21, 21),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          natyawardhan(
                              image_name: images_drama,
                              folder: 'karkirda',
                              Titles: names),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "संचालक मंडळी : ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 40,
                  color: Color.fromARGB(255, 24, 21, 21),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: natyawardhan(
                      image_name: sanchalak,
                      folder: 'sanchalak',
                      Titles: name,
                      Position: position,
                    ),
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
