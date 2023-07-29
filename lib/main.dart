import 'package:cart_demo/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/cart/cart_cubit.dart';
import 'feature/cart/cart_service.dart';
import 'feature/home/home_screen.dart';
import 'feature/product/product_cubit.dart';
import 'feature/product/view/product_view.dart';

void main() {
  final productService = ProductService();
  final productCubit = ProductsCubit(productService: productService);

  final cartService = CartService();
  final cartCubit = CartCubit(cartService: cartService);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCubit>.value(value: productCubit),
        BlocProvider<CartCubit>.value(value: cartCubit),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ProductsCubit(productService: ProductService()),
        child: ProductListingView(),
      ),    );
  }
}
