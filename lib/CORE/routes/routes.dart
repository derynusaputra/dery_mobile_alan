import 'package:flutter/material.dart';

getToRoute(
  BuildContext context, {
  required Widget widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

getToSlide(BuildContext context, {required Widget widget}) {
  Navigator.of(context).push(_createRoute(widget));
}

getBack(
  BuildContext context,
) {
  Navigator.pop(context);
}

Route _createRoute(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 1),
    reverseTransitionDuration: Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
