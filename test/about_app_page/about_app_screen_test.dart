import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_about_page/nasa_about_page.dart';

void main() {
  testGoldens('About app page golden test', (tester) async {
    await tester.pumpWidgetBuilder(const NasaAboutPage());
    await screenMatchesGolden(tester, 'about_page');
  });
}