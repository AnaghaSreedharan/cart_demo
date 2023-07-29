import 'package:cart_demo/feature/cart/cart_view.dart';
import 'package:cart_demo/feature/product/product_cubit.dart';
import 'package:cart_demo/feature/product/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/remote_service.dart';
import '../cart/cart_cubit.dart';
import '../cart/cart_service.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product and Cart'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Products'),
            Tab(text: 'Cart'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductListingView(),
          CartListingPage(),
        ],
      ),
    );
  }
}
