import 'package:flutter/material.dart';
import 'package:kabrgy/features/commentsmodal.dart';
import 'package:kabrgy/screens/announcemenet_screen.dart';
import 'package:kabrgy/screens/req_screen.dart';
import 'package:kabrgy/screens/req_list_screen.dart';
import 'package:kabrgy/screens/home_screen.dart';
import 'package:kabrgy/screens/login_screen.dart';
import 'package:kabrgy/screens/module_list_screen.dart';
import 'package:kabrgy/screens/module_screen.dart';
import 'package:kabrgy/screens/register_screen.dart';
import 'package:kabrgy/screens/social_details_screen.dart';
import 'package:kabrgy/screens/social_screen.dart';
import 'package:kabrgy/screens/splash_screen.dart';
import 'package:kabrgy/screens/welcome_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const Welcome());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/announcement':
        return MaterialPageRoute(settings: settings, builder: (_) => const Announcements());
      case '/module_list':
        return MaterialPageRoute(builder: (_) => const ModuleList());
      case '/module':
        return MaterialPageRoute(settings: settings, builder: (_) => const Module());
      case '/req_list':
        return MaterialPageRoute(builder: (_) => const ReqList());
      case '/req':
        return MaterialPageRoute(settings: settings, builder: (_) => const Req());
      case '/socials':
        return MaterialPageRoute(builder: (_) => const Socials());
      case '/social_details':
        return MaterialPageRoute(builder: (_) => const SocialDetails());
      default:
        return _errorRoute();
    }

  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}