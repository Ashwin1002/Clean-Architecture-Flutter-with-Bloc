import 'package:flutter/material.dart';

Future<T?> customModalBottomSheet<T>(BuildContext context,
        {required Widget child, VoidCallback? onDragdownPressed}) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildFilterSheet(
        context,
        child: child,
        onDragdownPressed: onDragdownPressed,
      ),
    );

Widget _makeDismissible(
  BuildContext context, {
  required Widget child,
  VoidCallback? onDragDownPressed,
}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onDragDownPressed != null) {
          onDragDownPressed();
        }
        // Navigator.pop(context);
      },
      child: child,
    );

Widget _buildFilterSheet(
  BuildContext context, {
  required Widget child,
  VoidCallback? onDragdownPressed,
}) =>
    _makeDismissible(context,
        child: child, onDragDownPressed: onDragdownPressed);
