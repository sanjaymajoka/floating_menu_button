import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:floating_menu_button/src/constants.dart';
import 'package:floating_menu_button/src/floating_menu_models.dart';
import 'package:flutter/material.dart';

class FloatingMenuTrayWidget extends StatefulWidget {
  final MenuTray menuTray;
  final List<MenuItems> menuItems;
  final ValueChanged<MenuItems> onItemClick;

  const FloatingMenuTrayWidget(this.menuTray, this.menuItems,
      {Key? key, required this.onItemClick})
      : super(key: key);

  @override
  FloatingMenuTrayWidgetState createState() => FloatingMenuTrayWidgetState();
}

class FloatingMenuTrayWidgetState extends State<FloatingMenuTrayWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: durationInMilliseconds),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double trayWidth =
        widget.menuTray.trayWidth ?? (MediaQuery.of(context).size.width * 0.45);
    final double trayHeight =
        widget.menuTray.trayWidth ?? (MediaQuery.of(context).size.height * 0.3);
    return CircularRevealAnimation(
      animation: animation,
      centerOffset: Offset(trayWidth, trayHeight),
      child: Container(
        width: trayWidth,
        height: trayHeight,
        padding: widget.menuTray.padding,
        decoration: BoxDecoration(
          color: widget.menuTray.backgroundColor,
          borderRadius: BorderRadius.circular(
            widget.menuTray.trayBorderRadius,
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1)
          ],
        ),
        child: ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
          for (int index = 0; index < widget.menuItems.length; index++)
            _buildItem(index)
        ]),
      ),
    );
  }

  Widget _buildItem(int index) {
    MenuItems item = widget.menuItems[index];
    bool isSelected = index == selectedIndex;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
          widget.onItemClick.call(item);
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.value,
            style: isSelected
                ? widget.menuTray.selectedItemTextStyle
                : widget.menuTray.itemTextStyle,
          ),
          if (index != widget.menuItems.length - 1)
            SizedBox(
              height: widget.menuTray.itemsSeparation,
            )
        ],
      ),
    );
  }

  void update(bool isOpen) {
    if (isOpen) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}
