import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sponsor extends StatefulWidget {
  const Sponsor({super.key});

  @override
  State<Sponsor> createState() => _SponsorState();
}

class _SponsorState extends State<Sponsor> {
  @override
  List<String> sponsors = [
    "assets/Images/Sponsors/Hindmata.jpg",
    "assets/Images/Sponsors/LIC.jpg",
    "assets/Images/Sponsors/MaharashtraTimes.jpg",
    "assets/Images/Sponsors/MarketcityKurla.jpg",
    "assets/Images/Sponsors/Masti.jpg",
    "assets/Images/Sponsors/Mayaboli.jpg",
  ];
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5.0, mainAxisSpacing: 18.0),
          itemCount: sponsors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 100,
              surfaceTintColor: Colors.blueAccent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(sponsors[index]),
                  fit: BoxFit.fill,
                ),
              ),
            );
          }),
    );
  }
}
