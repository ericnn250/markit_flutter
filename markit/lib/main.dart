// import 'package:flutter/material.dart';
// import 'package:markit/pages/homepage.dart';
// import 'package:markit/pages/login.dart';
//
// void main() {
//   runApp(MaterialApp(
//
//     debugShowCheckedModeBanner: false,
//     home: Login(),
//   ));
// }

import 'package:markit/provider/app.dart';
import 'package:markit/provider/product.dart';
import 'package:markit/provider/user.dart';
import 'package:markit/screens/home.dart';
import 'package:markit/screens/login.dart';
import 'package:markit/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
///admin
import 'package:markit/admin/providers/app_states.dart';
import 'package:markit/admin/providers/products_provider.dart';
import 'package:markit/admin/screens/admin.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),
  ///admin

    ChangeNotifierProvider.value(value: AppState()),
    ChangeNotifierProvider.value(value: ProductProviderAdmin()),

  ],
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.red
    ),
    home: ScreensController(),
  ),));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
        return Login();
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}

