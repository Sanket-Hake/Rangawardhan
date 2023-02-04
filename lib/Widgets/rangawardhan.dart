import 'package:flutter/material.dart';

Widget customAppBar() {
  return Container(
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
  );
}
