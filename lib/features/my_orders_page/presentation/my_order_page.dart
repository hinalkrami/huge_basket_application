import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
