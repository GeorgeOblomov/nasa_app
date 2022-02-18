import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/ui/nasa_about_screen/nasa_about_screen.dart';

void main() {
  testGoldens('About app page golden test', (tester) async {
    await tester.pumpWidgetBuilder(
      const NasaAboutScreen(),
      wrapper: materialAppWrapper(localizations: [S.delegate]),
    );
    await screenMatchesGolden(tester, 'about_page');
  });
}