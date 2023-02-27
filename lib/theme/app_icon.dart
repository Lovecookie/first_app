import 'package:flutter/material.dart';

class AppIcon {
  AppIcon._();

  static Widget home() {
    return const Icon(Icons.home);
  }

  static Widget search() {
    return const Icon(Icons.search);
  }

  static Widget notification() {
    return const Icon(Icons.notifications);
  }

  static Widget message() {
    return const Icon(Icons.message_sharp);
  }
}
