import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ttangkkeusmarket/app/src/modules/item/item_detail/item_detail.dart';

import 'package:ttangkkeusmarket/app/src/modules/cart/cart_screen.dart';
import 'package:ttangkkeusmarket/app/src/modules/register/buyer_register_view.dart';
import 'package:ttangkkeusmarket/app/src/providers/item_provider.dart';
import 'app/firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:ttangkkeusmarket/app/core/models/auth_model.dart';
import 'package:ttangkkeusmarket/app/core/models/query_model.dart';
import 'package:ttangkkeusmarket/app/src/custom_navigation_bar.dart';
import 'package:ttangkkeusmarket/app/src/providers/bottom_nav_provider.dart';
import 'package:ttangkkeusmarket/app/src/modules/login/login_view.dart';

import 'package:ttangkkeusmarket/app/src/modules/search/search_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/profile/profile_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/home/home_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/my_page/my_page_view.dart';

void main() async {
  var logger = Logger();

  logger.d("Logger is working!");

  WidgetsFlutterBinding.ensureInitialized(); //추가
  // await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {} catch (e) {
    print('Init failed' + e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
          // ChangeNotifierProvider(create: (_) => ItemProvider()),
          ChangeNotifierProvider(create: (_) => QueryProvider()),
          // ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFFF6C544),
          ),
          initialRoute: '/',
          routes: {
            //'/': (context) => CustomNavBar(),
            '/login': (BuildContext context) => const LoginView(),
            '/register': (BuildContext context) => const BuyerRegisterView(),
            '/detail': (BuildContext context) => DetailScreen(),
            '/search': (BuildContext context) => const SearchScreen(),
            '/profile': (BuildContext context) => ProfileView(),
            '/home': (BuildContext context) => const HomeView(),
            '/mypage': (BuildContext context) => const MyPageView(),
            '/cart': (BuildContext context) => CartView(),

            // '/': (context) => CustomNavBar(),
            // '/register': (context) => RegisterScreen(),
          },
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => BottomNavigationProvier()),
            ],
            child: const CustomNavBar(),
          ),
        ));
  }
}
