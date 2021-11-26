import 'package:floating_menu_button/src/floating_menu_background.dart';
import 'package:floating_menu_button/src/floating_menu_button.dart';
import 'package:floating_menu_button/src/floating_menu_models.dart';
import 'package:floating_menu_button/src/floating_menu_tray.dart';
import 'package:flutter/material.dart';

class FloatingMenuWidget extends StatelessWidget {
  final Widget child;
  final List<MenuItems> menuItems;
  final MenuTray menuTray;
  final MenuButton menuButton;
  final ValueChanged<MenuItems>? onItemSelection;
  final menuButtonKey = GlobalKey<MenuButtonWidgetState>();
  final bgKey = GlobalKey<BgWidgetState>();
  final trayState = GlobalKey<FloatingMenuTrayWidgetState>();
  final bool closeOnItemClick;

  FloatingMenuWidget(
      {Key? key,
      required this.child,
      this.menuItems = const [],
      this.menuButton = const MenuButton(),
      this.menuTray = const MenuTray(),
      this.closeOnItemClick = true,
      this.onItemSelection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BgWidget(
          key: bgKey,
        ),
        Positioned(
          right: 25,
          bottom: 25,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingMenuTrayWidget(
                menuTray,
                menuItems,
                key: trayState,
                onItemClick: (menuItem) {
                  onItemSelection?.call(menuItem);
                  if (closeOnItemClick) {
                    menuButtonKey.currentState?.onClick();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MenuButtonWidget(
                menuButton,
                key: menuButtonKey,
                onClick: (isOpen) {
                  bgKey.currentState?.updateState(isOpen);
                  trayState.currentState?.update(isOpen);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
