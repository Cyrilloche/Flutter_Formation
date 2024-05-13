import 'package:flutter/material.dart';

class ArtwordWidget extends StatelessWidget {
  const ArtwordWidget({super.key, required String title});

  static _displayInformation() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Museum'),
      ),
      body: const Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('images/Mona_Lisa.jpg'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.25,
                      child: Icon(
                        Icons.favorite,
                        size: 100,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Text(
              'Mona Lisa',
              style: TextStyle(
                  fontFamily: 'Merryweather',
                  fontSize: 30,
                  color: Colors.brown),
            ),
            Text(
              'Léonard De Vinci',
              style: TextStyle(
                  fontFamily: 'Merryweather',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 50,
                  icon: Icon(
                    Icons.article,
                  ),
                  onPressed: _displayInformation,
                ),
                IconButton(
                  iconSize: 50,
                  icon: Icon(
                    Icons.favorite,
                  ),
                  onPressed: _displayInformation,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
