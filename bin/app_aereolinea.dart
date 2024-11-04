import 'package:mysql1/mysql1.dart';
import 'database.dart';
import 'app.dart';

main() async {
  (await Database().instalacion());
  app().menuInicial();
}
