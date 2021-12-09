import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_list/desc.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  TrendingMovies({this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Trending Movies",
              style: GoogleFonts.breeSerif(
                fontSize: 26,
              ),
            ),
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    banner: 'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launch: trending[index]['release_date'],
                                  )));
                    },
                    child: trending[index]['title'] != null
                        ? Container(
                            padding: EdgeInsets.all(10),
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 190,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['poster_path']))),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Text(
                                      trending[index]['title'] != null
                                          ? trending[index]['title']
                                          : 'Loading...',
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
