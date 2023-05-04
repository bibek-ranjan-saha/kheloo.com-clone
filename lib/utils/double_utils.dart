import 'package:flutter/cupertino.dart';

extension GapMaker on double {
  SizedBox padding() {
    return SizedBox(height: this, width: this);
  }
}
