import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/more.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 18, 18, 18),
      body: Drawer(
          child: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage(
                                "assets/Images/Rangwardhan_Logo.png"),
                          ),
                        ),
                      ]),
                )),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
       
            InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, "/About");
              },
              child: ListTile(
                leading: Icon(
                  Icons.account_box_rounded,
                  color: Colors.white,
                ),
                tileColor: Colors.white,
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
             Navigator.popAndPushNamed(context, "/sponsors");
              },
              child: ListTile(
                leading: Container(
                  height: 22,
                  width: 25,
                  child: Image(
                    image: AssetImage("assets/Images/event.png"),
                    color: Colors.white,
                  ),
                ),
                tileColor: Colors.blue[200],
                title: Text(
                  "Sponsors",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
             Navigator.popAndPushNamed(context, "/guest");
              },
              child: ListTile(
                leading: Container(
                  height: 22,
                  width: 25,
                  child: Image(
                    image: AssetImage("assets/Images/teams.jpg"),
                    color: Colors.white,
                  ),
                ),
                tileColor: Colors.blue[200],
                title: Text(
                  "Guests",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          

            InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, "/Contact_us");
              },
              child: ListTile(
                leading: Icon(Icons.call, color: Colors.white),
                tileColor: Colors.blue[200],
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, "/developer");
              },
              child: ListTile(
                leading: Icon(Icons.call, color: Colors.white),
                tileColor: Colors.blue[200],
                title: Text(
                  "Devloper",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

void signout(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: AlertDialog(
          title: Text(
        'Sign Out Completed',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
