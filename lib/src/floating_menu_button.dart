import 'package:animate_icons/animate_icons.dart';
import 'package:floating_menu_button/src/constants.dart';
import 'package:floating_menu_button/src/floating_menu_models.dart';
import 'package:flutter/material.dart';

class MenuButtonWidget extends StatefulWidget {
  final MenuButton menuButton;
  final ValueChanged<bool> onClick;

  const MenuButtonWidget(this.menuButton, {Key? key, required this.onClick})
      : super(key: key);

  @override
  MenuButtonWidgetState createState() => MenuButtonWidgetState();
}

class MenuButtonWidgetState extends State<MenuButtonWidget> {
  bool isOpen = false;
  final AnimateIconController iconController = AnimateIconController();
  String buttonText = "";

  @override
  void initState() {
    super.initState();
    updateButtonText();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: widget.menuButton.padding,
        decoration: BoxDecoration(
          color: widget.menuButton.bgColor,
          borderRadius: BorderRadius.circular(widget.menuButton.borderRadius),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1)
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimateIcons(
                  size: widget.menuButton.iconSize,
                  duration:
                      const Duration(milliseconds: durationInMilliseconds),
                  startIcon: widget.menuButton.iconOnClose,
                  endIcon: widget.menuButton.iconOnOpen,
                  onStartIconPress: () => false,
                  onEndIconPress: () => false,
                  controller: iconController,
                  startIconColor: widget.menuButton.iconColor,
                  endIconColor: widget.menuButton.iconColor,
                ),
                InkWell(
                  onTap: onClick,
                  child: SizedBox(
                    width: widget.menuButton.iconSize+25,
                    height: widget.menuButton.iconSize+25,
                  ),
                )
              ],
            ),
            Text(
              buttonText,
              style: widget.menuButton.textStyle,
            )
          ],
        ),
      ),
    );
  }

  void onClick(){
    isOpen = !isOpen;
    if (isOpen) {
      iconController.animateToEnd.call();
    } else {
      iconController.animateToStart.call();
    }
    widget.onClick.call(isOpen);
    setState(() {
      updateButtonText();
    });
  }
  
  void updateButtonText() {
    buttonText =
        isOpen ? widget.menuButton.textOnOpen : widget.menuButton.textOnClose;
  }
}
