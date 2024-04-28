import 'package:flutter/material.dart';
import 'package:shop_hub_store/views/screens/widget/banner_widget.dart';
import 'package:shop_hub_store/views/screens/widget/location_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationWidget(),
        SizedBox(
          height: 10,
        ),
        BannerWidget(),
      ],
    );
  }
}
