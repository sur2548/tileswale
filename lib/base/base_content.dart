import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tileswale/get.dart';

class Content<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) create;
  final Function(T)? onStateReady;

  const Content({
    Key? key,
    required this.create,
    this.onStateReady,
  }) : super(key: key);

  @override
  _ContentState<T> createState() => _ContentState<T>();
}

class _ContentState<T extends ChangeNotifier> extends State<Content<T>> {
  T state = locate<T>();

  @override
  void initState() {
    if (widget.onStateReady != null) {
      widget.onStateReady!(state);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => state,
      child: Consumer<T>(builder: widget.create),
    );
  }
}
