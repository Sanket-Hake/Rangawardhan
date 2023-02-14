import 'package:flutter/material.dart';
import 'package:rangawardhan/Widgets/appBar.dart';

class DeveloperCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              customAppBar(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    devlopers(
                        "https://cdn-icons-png.flaticon.com/512/21/21104.png",
                        "Sanket Hake",
                        "EXTC",
                        "sankethake4847@gmail.com",
                        "8356994981"),
                    SizedBox(
                      height: 20,
                    ),
                    devlopers(
                        "https://cdn-icons-png.flaticon.com/512/21/21104.png",
                        "Soumitra Kand",
                        "IT",
                        "soumitrakand3@gmail.com",
                        "8356994981"),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget devlopers(
    String image, String name, String branch, String gmail, String no) {
  return Card(
    color: Color.fromARGB(255, 36, 35, 35),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 40,
    shadowColor: Color.fromARGB(255, 30, 6, 110),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(height: 5.0),
                Text(
                  branch,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  gmail,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  no,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
