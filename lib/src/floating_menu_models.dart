import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItems {
  String id;
  String value;

  MenuItems({required this.id, required this.value});
}

class MenuTray {
  final TextStyle itemTextStyle;
  final TextStyle selectedItemTextStyle;
  final Color backgroundColor;
  final double itemsSeparation;
  final double trayBorderRadius;
  final double? trayHeight;
  final double? trayWidth;
  final EdgeInsets padding;

  const MenuTray(
      {this.itemTextStyle = const TextStyle(color: Colors.black),
      this.selectedItemTextStyle =
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      this.backgroundColor = Colors.white,
      this.itemsSeparation = 10,
      this.trayBorderRadius = 5,
      this.trayHeight,
      this.trayWidth,
      this.padding = const EdgeInsets.all(15)});
}

class MenuButton {
  final TextStyle textStyle;
  final String textOnOpen;
  final String textOnClose;
  final Color bgColor;
  final IconData iconOnClose;
  final IconData iconOnOpen;
  final Color iconColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double iconSize;

  const MenuButton({
    this.textStyle = const TextStyle(color: Colors.black),
    this.textOnOpen = "Close",
    this.textOnClose = "Open",
    this.bgColor = Colors.white,
    this.iconOnClose = Icons.menu,
    this.iconOnOpen = Icons.close,
    this.iconColor = Colors.black,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
    this.iconSize = 20,
  });
}
