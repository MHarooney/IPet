import 'package:flutter/material.dart';
import 'package:ipet/presentation/common/label.dart';
import 'package:ipet/presentation/common/theme.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;
  final double width, height;

  const DeliveryButton({
    Key key,
    this.onTap,
    this.text,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(14.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: deliveryGradients,
          ),
        ),
        child: Padding(
          padding: padding,
          child: Label(
            text: text,
            textColor: Colors.white,
            txtStyle: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
