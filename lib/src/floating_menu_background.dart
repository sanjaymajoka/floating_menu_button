import 'package:flutter/material.dart';

class BgWidget extends StatefulWidget {
  const BgWidget({Key? key}) : super(key: key);

  @override
  BgWidgetState createState() => BgWidgetState();
}

class BgWidgetState extends State<BgWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return isOpen ? Container(
      color: Colors.black.withAlpha(50),
    ) : Container();
  }

  void updateState(bool isOpen) {
    setState(() {
      this.isOpen = isOpen;
    });
  }
}