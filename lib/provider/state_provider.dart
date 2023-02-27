import 'package:first_app/provider/auth_state_provider.dart';

import 'app_state_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// app state provider
///
final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier(AppState(isBusy: false, pageIndex: 0));
});

///
/// auth state provider
///
final authStateProvier = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(AuthState(isBusy: false, pageIndex: 0));
});

///
/// state provider
///
final pageNameProvider = Provider<String>((ref) {
  final appState = ref.watch(appStateProvider);

  switch (appState.getPageIndex()) {
    case 0:
      return "Home";
    case 1:
      return "Search";
    case 2:
      return "Notification";
    case 3:
      return "Message";
  }

  return "";
});
