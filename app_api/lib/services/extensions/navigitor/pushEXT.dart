import 'package:flutter/material.dart';

extension nav on BuildContext {
  pushAndRemove({required Widget view}) {
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => view), (route) => false);
  }

  pushPage({required Widget page}) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }
}
