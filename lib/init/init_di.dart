import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/main.dart';

Future<void> initDI() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // locator<SharedPreferences>().clear();
  if (locator<SharedPreferences>().getBool('isFirstTime') == null) {
    isFirstTime = true;
  } else {
    isFirstTime = false;
  }
}
