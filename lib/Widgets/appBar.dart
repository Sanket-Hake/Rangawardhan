import 'package:flutter/material.dart';

Widget customAppBar() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/Images/VJTI_Mumbai.jpeg"),
          fit: BoxFit.cover),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
             height: 100,
             child: Image(
               image: AssetImage(
                 "assets/gif/Rangawardhan.gif",
               ),
               fit: BoxFit.fill,
             ),
           ),
          // Text(
          //   "रंगवर्धन",
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 35,
          //       color: Colors.white),
          // ),
          // SizedBox(
          //   height: 100,
          //   child:
          // ),
            SizedBox(height: 60,) , 
      
    
        ],
      ),
    ),
  );
}
