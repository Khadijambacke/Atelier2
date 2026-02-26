import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/catalog/presentation/product_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/catalog', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductPage(productId: id);
      },
    ),
  ],
);
