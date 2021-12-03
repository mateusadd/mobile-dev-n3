import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    onTap: () {},
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']))),
                          ),
                          Container(
                            child: Text(trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'Loading...'),
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
