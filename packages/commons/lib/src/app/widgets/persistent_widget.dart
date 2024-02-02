import 'package:flutter/material.dart';

/// widget with [AutomaticKeepAliveClientMixin]
class PersistentWidget extends StatefulWidget {
  const PersistentWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PersistentWidget> createState() => _PersistentWidgetState();
}

class _PersistentWidgetState extends State<PersistentWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
