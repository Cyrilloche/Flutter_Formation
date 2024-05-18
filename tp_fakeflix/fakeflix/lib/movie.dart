class Movie {
  int movieId;
  String name;

  Movie({
    required this.movieId,
    required this.name,
  });

  // Movie.fromJson(Map<String, dynamic> json)
  //     : movieId = json['id'],
  //       name = json['original_title'];
  factory Movie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int movieId,
        'original_title': String name,
      } =>
        Movie(movieId: movieId, name: name),
      _ => throw const FormatException('Failed to load movie.'),
    };
  }
}
