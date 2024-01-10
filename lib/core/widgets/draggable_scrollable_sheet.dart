import 'package:flutter/material.dart';
import 'package:medhavi_app/core/utils/extensions/theme_extensions.dart';
import 'package:medhavi_app/core/utils/size/size_utils.dart';
import 'package:medhavi_app/core/widgets/decoration/container_decoration.dart';

class MyDraggableSheet extends StatefulWidget {
  const MyDraggableSheet({
    super.key,
    required this.builder,
    this.intialExtent = .5,
    this.minExtent = .5,
    this.maxExtent = .7,
  });

  final Widget Function(
      BuildContext, ScrollController, DraggableScrollableController) builder;

  /// [initialExtent] must be in double and the range is between 0 and 1
  final double intialExtent;

  /// [minExtent] must be in double and the range is between 0 and 1
  final double minExtent;

  /// [maxExtent] must be in double and the range is between 0 and 1
  final double maxExtent;

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();

  late double initialExtent;
  late double minExtent;
  late double maxExtent;

  @override
  void initState() {
    super.initState();
    initialExtent = widget.intialExtent;
    minExtent = widget.minExtent;
    maxExtent = widget.maxExtent;
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: initialExtent,
      minChildSize: minExtent,
      maxChildSize: maxExtent,
      builder: (_, scrollController) {
        return Container(
          decoration: CustomDecoration.containerDecoration(
            context,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
            backgroundColor: context.theme.backgroundPrimary,
          ),
          child: Column(
            children: [
              const BottomSheetAnchor(),
              Expanded(
                child: widget.builder(context, scrollController, _controller),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetAnchor extends StatelessWidget {
  const BottomSheetAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4.5.v,
            width: 35.h,
            decoration: CustomDecoration.containerDecoration(
              context,
              backgroundColor: context.theme.contentPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
