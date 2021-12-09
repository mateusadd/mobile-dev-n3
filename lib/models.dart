class Movie {
  final String title;
  final String banner;

  Movie({this.title, this.banner});

  factory Movie.fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final banner = json['poster_path'];
    return Movie(title: title, banner: banner);
  }
}