import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name, description, banner, vote, launch;

  const Description(
      {Key key,
      this.name,
      this.description,
      this.banner,
      this.vote,
      this.launch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      banner,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name != null ? name : 'Failed to Load',
                  style: GoogleFonts.breeSerif(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('Released on: ' + launch,
                  style: GoogleFonts.breeSerif(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 150,
                    width: 100,
                    child: Image.network(banner),
                  ),
                  Flexible(
                    child: Container(
                      child: Text(description,
                          style: GoogleFonts.breeSerif(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Positioned(
                  bottom: 10,
                  child: Text(' ⭐ Rating: ' + vote,
                      style: GoogleFonts.breeSerif(
                          fontSize: 15, fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ),
    );
  }
}
