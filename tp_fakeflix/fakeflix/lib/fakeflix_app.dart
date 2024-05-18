import 'package:fakeflix/movie.dart';
import 'package:fakeflix/movie_service.dart';
import 'package:flutter/material.dart';

class FakeflixApp extends StatelessWidget {
  const FakeflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "images/fakeflix.png",
            fit: BoxFit.cover,
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FutureBuilder<List<Movie>?>(
                future: MovieService.readMovies(),
                builder: (BuildContext context, AsyncSnapshot snapschot) {
                  if (snapschot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapschot.hasError) {
                    return Text("Error: ${snapschot.error}");
                  } else {
                    return Text("${snapschot.data}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
