import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const textStyle =
  TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'SF');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Cart',
          style: textStyle,
        ),
      ),
    );
  }
}
