import 'package:flutter/material.dart';

class SksyIconButton extends StatefulWidget {
  const SksyIconButton({super.key, required this.id, required this.icon, required this.tooltip, required this.isActive});

  final int id;
  final Widget icon;
  final String tooltip;
  final bool isActive;

  @override
  State<SksyIconButton> createState() => _SksyIconButtonState();
}

class _SksyIconButtonState extends State<SksyIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Ink(
          decoration: ShapeDecoration(
            color: widget.isActive ? Colors.red : Colors.transparent,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            icon: widget.icon,
            color: widget.isActive ? Colors.white : Colors.black,
            tooltip: widget.tooltip,
            onPressed: () {
              ButtonPressed(widget.id).dispatch(context);
            },
          ),
        ),
      ),
    );
  }
}

class ButtonPressed extends Notification {
  final int id;
  ButtonPressed(this.id);
}