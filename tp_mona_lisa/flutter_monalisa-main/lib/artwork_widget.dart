import 'package:flutter/material.dart';
import 'package:monalisa/description_text.dart';

class ArtworkWidget extends StatefulWidget {
  const ArtworkWidget({super.key});

  @override
  State<ArtworkWidget> createState() => _ArtworkWidgetState();
}

class _ArtworkWidgetState extends State<ArtworkWidget> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _onPressFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    if (_isFavorite) {
      const SnackBar snackBar = SnackBar(
        content: Text("L'oeuvre a été ajoutée à vos favoris"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _onPressDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  Widget _buildDescriptionWidget(bool show, String text) {
    return show
        ? SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.75,
              heightFactor: 0.5,
              alignment: FractionalOffset.center,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(153, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(); //utiliser un container vide pour ne rien afficher
  }

  Widget _buildImageStack(
      bool showDescription, String text, bool artworkIsFavorite) {
    return Flexible(
      flex: 7,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            "images/Mona_Lisa.jpg",
            fit: BoxFit.cover,
          ),
          _buildDescriptionWidget(showDescription, text),
          Icon(
            Icons.favorite,
            color: _getColorOrTransparentAccordingToFavoriteValue(
                artworkIsFavorite),
            size: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildTitlesRow() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("La Joconde", style: Theme.of(context).textTheme.displayLarge),
          Text("Léonard De Vinci",
              style: Theme.of(context).textTheme.displayMedium),
        ],
      ),
    );
  }

  Widget _buildButtonsRow(bool artworkIsFavorite) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.article),
            color: Colors.brown,
            onPressed: _onPressDescription,
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            color: _getFavoriteColorOrNeutralColorAccordingToFavoriteHelper(
                artworkIsFavorite),
            onPressed: _onPressFavorite,
          )
        ],
      ),
    );
  }

  Color _getColorOrTransparentAccordingToFavoriteValue(bool artworkIsFavorite) {
    return artworkIsFavorite
        ? Colors.red
        : const Color.fromARGB(75, 255, 255, 255);
  }

  Color _getFavoriteColorOrNeutralColorAccordingToFavoriteHelper(
      bool artworkIsFavorite) {
    return artworkIsFavorite ? Colors.red : Colors.brown;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Museum",
          style: TextStyle(
            color: _getColorOrTransparentAccordingToFavoriteValue(_isFavorite),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildImageStack(
              _showDescription,
              descriptionText,
              _isFavorite,
            ),
            _buildTitlesRow(),
            _buildButtonsRow(_isFavorite),
          ],
        ),
      ),
    );
  }
}
