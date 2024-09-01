import 'package:flutter/material.dart';

class AppShape{

  static const BorderRadius topRoundedCorners = BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  );

  static const RoundedRectangleBorder roundedCorners = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
  );


}