import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Widgets/appBar.dart';

class Contact extends StatelessWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController no = TextEditingController();
  final TextEditingController emailID = TextEditingController();
  final TextEditingController Suggestion = TextEditingController();
  late String formattedDate;
  late String formattedTime;
  storeData() {
    FirebaseFirestore.instance.collection("Suggestions").doc(name.text).set({
      'name': name.text,
      "no": no.text,
      'emailID': emailID.text,
      'Suggestion': Suggestion.text,
      'date': formattedDate,
      'time': formattedTime,
    }).catchError((e) {
      print(e);
    });
  }

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    formattedDate = "${now.day}-${now.month}-${now.year}";
    formattedTime = "${now.hour}:${now.minute}:${now.second}";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FadeInDownBig(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBar(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 177, 173, 163)
                                .withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white30,
                          width: 2,
                        )),
                    child: Column(children: [
                      SizedBox(height: 10),
                      Text(' Share Your Valuable Feedback ',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 15),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              register("Name", "Enter Your Name", false,
                                  Icon(Icons.people), "", name, 1),
                              SizedBox(height: 15),
                              register("Number", "Enter Your Mobile Number",
                                  false, Icon(Icons.contact_page), "", no, 1),
                              SizedBox(height: 15),
                              register(
                                  " Email ID",
                                  "Enter your Email",
                                  false,
                                  Icon(Icons.email_outlined),
                                  "email",
                                  emailID,
                                  1),
                              SizedBox(height: 15),
                              Card(
                                  color: Colors.transparent,
                                  // color: Color.fromARGB(255, 36, 35, 35),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: TextFormField(
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      controller: Suggestion,
                                      decoration: InputDecoration(
                                        labelText: 'Enter your suggestion',
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: Colors.amber, width: 2.0),
                                        ),
                                      ),
                                      maxLines: 5,
                                      minLines: 3,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                    //     child: TextFormField(
                                    //         onChanged: (value) {
                                    //           String y = value;
                                    //         },
                                    //         controller: Suggestion,

                                    //         validator: (value) {
                                    //           if (value == null || value.isEmpty) {
                                    //             return "please Enter some text";
                                    //           }
                                    //         },
                                    //         decoration: InputDecoration(
                                    //             labelText: "Suggestion",

                                    //             focusedBorder: OutlineInputBorder(
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(20),

                                    //             contentPadding:
                                    //                 const EdgeInsets.symmetric(
                                    //                     horizontal: 20)),
                                    //         keyboardType: TextInputType.multiline,
                                    //         maxLines: 5),
                                    // ),
                                  )),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () async {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      storeData();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    } else {
                                      const SnackBar(content: Text('form not'));
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Send",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget register(String labelText, String hintText, bool x, Icon myicon,
    String y, TextEditingController z, int lines) {
  return Card(
    color: Colors.transparent,
    // color: Color.fromARGB(255, 36, 35, 35),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 40,
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
          onChanged: (value) {
            String y = value;
          },
          obscureText: x,
          controller: z,
          style: const TextStyle(fontSize: 15, color: Colors.white),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please Enter some text";
            }
          },
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.amber, width: 2)),
              prefixIcon: myicon,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
          keyboardType: TextInputType.multiline,
          maxLines: lines),
    ),
  );
}
