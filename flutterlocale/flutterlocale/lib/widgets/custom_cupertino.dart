import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertino extends StatelessWidget {
  List<Widget>? children;
  Function(int)? onSelectedItemChange;

  CustomCupertino(BuildContext context,
      {Key? key, this.children, this.onSelectedItemChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(color: Theme.of(context).accentColor),
            actionTextStyle: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        child: CupertinoPicker(
          magnification: 1.5,
          children: children!,
          itemExtent: 20,
          
          onSelectedItemChanged: onSelectedItemChange,
        ),
      ),
    );
  }
}
