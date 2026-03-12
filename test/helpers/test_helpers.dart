import 'package:flutter/material.dart';
import 'package:recast_designs_task/theme/responsive.dart';

/// A StatefulWidget that initialises [Responsive] via [didChangeDependencies]
/// before its child is built — mirrors how [_ResponsiveShell] works in the app.
class ResponsiveTestWrapper extends StatefulWidget {
  final Widget child;

  const ResponsiveTestWrapper({super.key, required this.child});

  @override
  State<ResponsiveTestWrapper> createState() => _ResponsiveTestWrapperState();
}

class _ResponsiveTestWrapperState extends State<ResponsiveTestWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Responsive.init(context);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// Wraps [child] inside a [MaterialApp] + [Scaffold] with [Responsive]
/// initialised so that widgets using [Responsive.w/h/sp] work in tests.
Widget buildTestApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: ResponsiveTestWrapper(child: child),
    ),
  );
}
