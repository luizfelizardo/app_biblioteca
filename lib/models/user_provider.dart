import 'package:flutter/cupertino.dart';
import 'package:biblioteca_uniceu_alvarenga/models/user.dart';

// ignore: must_be_immutable
class UserProvider extends InheritedWidget {
  @override
  final Widget child;
  List<User> users = [];
  User? userSelected;
  int? indexUser;
  UserProvider({
    super.key,
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider widget) {
    return true;
  }
}
