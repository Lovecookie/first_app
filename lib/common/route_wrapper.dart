import 'package:first_app/widgets/pages/home_page.dart';
import 'package:first_app/widgets/pages/sign_in_page.dart';
import 'package:first_app/widgets/pages/sign_up_page.dart';
import 'package:first_app/widgets/pages/welcome_page.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRoute(
//    name: 'song',
//    path: 'songs/:songId',
//    builder: /* ... */,
//  ),
// To navigate to a route using its name, call goNamed:

// TextButton(
//   onPressed: () {
//     context.goNamed('song', params: {'songId': 123});
//   },
//   child: const Text('Go to song 2'),
// ),

// redirect: (BuildContext context, GoRouterState state) {
//   if (AuthState.of(context).isSignedIn) {
//     return context.namedLocation('signIn');
//   } else {
//     return null;
//   }
// },

class FRouteName {
  static const String welcome = 'welcome';
  static const String signUp = 'signUp';
  static const String signIn = 'signIn';

  static const String home = 'home';
}

class FAppRoute {
  static void go(BuildContext context, String routeName) {
    context.goNamed(routeName);
  }

  static void push(BuildContext context, String routeName) {
    context.pushNamed(routeName);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}

class FRouteWrapper {
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode ? true : false,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        name: FRouteName.welcome,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const FWelcomePage();
        },
        routes: [
          GoRoute(
              name: FRouteName.signUp,
              path: '$FRouteName.signUp',
              builder: (BuildContext context, GoRouterState state) {
                return const FSignUpPage();
              }),
          GoRoute(
              name: FRouteName.signIn,
              path: '$FRouteName.signIn',
              builder: (BuildContext context, GoRouterState state) {
                return const FSignInPage();
              }),
        ],
      ),
      GoRoute(
          name: FRouteName.home,
          path: '/$FAppRoute.home',
          builder: (BuildContext context, GoRouterState state) {
            return const FHomePage();
          }),
    ],
  );

  static GoRouter route() => _router;
}
