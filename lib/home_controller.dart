import 'package:flutter/cupertino.dart';

class HomeController extends InheritedNotifier<ValueNotifier<int>>{
  HomeController({super.key, required super.child, })
      : super(
    notifier: ValueNotifier(0),
  );

  static HomeController of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<HomeController>()!;

  }

  int get value => notifier!.value;

  increment(){
    notifier!.value++;
  }


}