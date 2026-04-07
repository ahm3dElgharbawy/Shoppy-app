import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {

  /// Push new page
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push replacement
  Future<T?> replace<T>(Widget page) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push and remove all previous routes
  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Push and remove until condition
  Future<T?> pushAndRemoveUntil<T>(
      Widget page,
      bool Function(Route<dynamic>) predicate,
      ) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      predicate,
    );
  }

  /// Pop current page
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Pop until specific route name
  void popUntil(String routeName) {
    Navigator.of(this).popUntil(
      ModalRoute.withName(routeName),
    );
  }

  /// Push named route
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace with named route
  Future<T?> replaceNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Push named and remove all
  Future<T?> pushNamedAndRemoveAll<T>(
      String routeName, {
        Object? arguments,
      }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Check if can pop
  bool get canPop => Navigator.of(this).canPop();
}