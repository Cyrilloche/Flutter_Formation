import 'package:flutter/material.dart';

class ArtwordWidget extends StatefulWidget {
  const ArtwordWidget({super.key, required String title});

  @override
  State<ArtwordWidget> createState() => _ArtwordWidget();
}

class _ArtwordWidget extends State<ArtwordWidget> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _displayInformation() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  void _showSnackBar() {
    final snackBar = SnackBar(
      backgroundColor: _isFavorite ? Colors.red : Colors.grey,
      content: Text(
        _isFavorite ? "Ajoutez au favoris" : "Retirer des favoris",
        textAlign: TextAlign.center,
      ),
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _addToFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      _showSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Museum'),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('images/Mona_Lisa.jpg'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: _isFavorite ? 1 : 0.25,
                      child: Icon(
                        Icons.favorite,
                        size: 100,
                        color: _isFavorite ? Colors.red : Colors.white,
                      ),
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: _showDescription
                            ? const Text(
                                "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.")
                            : Container(),
                      )
                    ]),
              ],
            ),
            const Text(
              'Mona Lisa',
              style: TextStyle(
                  fontFamily: 'Merryweather',
                  fontSize: 30,
                  color: Colors.brown),
            ),
            const Text(
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
                  icon: const Icon(
                    Icons.article,
                  ),
                  onPressed: _displayInformation,
                ),
                IconButton(
                  iconSize: 50,
                  icon: const Icon(
                    Icons.favorite,
                  ),
                  onPressed: _addToFavorite,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
