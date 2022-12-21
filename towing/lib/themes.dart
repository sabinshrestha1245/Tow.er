import 'package:flutter/material.dart';

ThemeData rootTheme(){
  final ThemeData base = ThemeData();
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
        bodyText1: base.bodyText1!.copyWith(
            fontSize: 16,
            color: const Color.fromRGBO(65, 64, 66, .1),
            fontWeight: FontWeight.normal
        ),
        headline1: base.headline1!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 21,
          color: Colors.black,
        ),
        headline2: base.headline2!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.grey,
        ),
        button: base.button!.copyWith(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )

    );
  }

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.blue,
    cardColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,

  );
}