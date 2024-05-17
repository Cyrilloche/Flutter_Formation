import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/my_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    //on vérifie qu'un widget affiche "0 + 2 ="
    expect(find.text('0 + 2 = '), findsOneWidget);
    //on vérifie qu'un widget affiche "2"
    expect(find.text('2'), findsOneWidget);

    //on simule un clic sur le bouton dont l'intitulé est "+2"
    //ce qui incrémente de 2 la valeur de counter
    await tester.tap(find.text("+2"));
    await tester.pump();

    //on vérifie qu'un widget affiche "4"
    expect(find.text('4'), findsOneWidget);
    //on vérifie qu'un widget affiche "2 + 2 ="
    expect(find.text('2 + 2 = '), findsOneWidget);
  });
}
