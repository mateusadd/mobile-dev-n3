import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_list/desc.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  TopRated({this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Top Rated Movies",
              style: GoogleFonts.breeSerif(
                fontSize: 26,
              ),
            ),
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: toprated[index]['title'],
                                    banner: 'https://image.tmdb.org/t/p/w500' +
                                        toprated[index]['poster_path'],
                                    description: toprated[index]['overview'],
                                    vote: toprated[index]['vote_average']
                                        .toString(),
                                    launch: toprated[index]['release_date'],
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                                toprated[index]['title'] != null
                                    ? toprated[index]['title']
                                    : 'Loading...',
                                style: GoogleFonts.breeSerif(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
