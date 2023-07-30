import 'package:cart_demo/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/cart/cart_cubit.dart';
import 'feature/home/home_screen.dart';
import 'feature/product/product_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProductTabViewCubit>(
            create: (context) => ProductTabViewCubit(apiService: ApiService()),
          ),
          BlocProvider<CartTabViewCubit>(
            create: (context) => CartTabViewCubit(apiService: ApiService()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}