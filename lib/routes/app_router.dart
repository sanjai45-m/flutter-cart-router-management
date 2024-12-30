import 'package:go_router/go_router.dart';
import 'package:nothingnew/screens/cart_screen.dart';

import '../screens/home_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/settings_screen.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    // GoRoute(
    //   path: '/wishlist',
    //   builder: (context, state) => const WishlistScreen(),
    // ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductDetailsScreen(
        productId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);