import 'package:flutter/material.dart';

// a little shortcut for the push function...
push(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

replace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

pop(context) {
  Navigator.pop(context);
}
