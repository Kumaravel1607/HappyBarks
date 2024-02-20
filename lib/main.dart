import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_bark/screens/address/add_address.dart';
import 'package:happy_bark/screens/order/order_list_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:happy_bark/screens/splash/splash_page.dart';
import 'package:happy_bark/vet_visit_screens/deworming_screen.dart';
import 'package:happy_bark/vet_visit_screens/medicine_screen.dart';
import 'package:happy_bark/vet_visit_screens/schedule_screen.dart';
import 'package:happy_bark/vet_visit_screens/surgeries_screen.dart';
import 'package:happy_bark/vet_visit_screens/tick_and_flea_screen.dart';
import 'package:happy_bark/services/provider/connectivityProvider/connectivity_provider.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Util.sharedPrefs;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => FutureDataProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ConnectivityProvider(),
    ),
  ], child: const MyApp()));
}

BuildContext? testContext;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      // theme: primaryColors,
      home: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return // OrderListPage();
                SplashPage();
          },
        );
      }),
      //  onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
