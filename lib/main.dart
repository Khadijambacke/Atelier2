import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/cta_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/features_sections.dart';
import 'widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/login_page.dart';
import 'features/auth/state/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _mode = ThemeMode.light;
  var conteur = 0;

  // Fonction appelée lorsqu'on change le toggle
  void changeTheme(bool isDark) {
    setState(() {
      //on execute les themes predefinie sur app_theme.dart dependant de la valeur de isDark
      _mode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Builder(
        builder: (context) {
          final auth = context.watch<AuthProvider>();

          final router = GoRouter(
            initialLocation: '/catalog',

            redirect: (context, state) {
              if (!auth.isLoggedIn) {
                return '/login';
              }
              return null;
            },

            routes: [
              GoRoute(
                path: '/login',
                builder: (context, state) => const LoginPage(),
              ),
              GoRoute(
                path: '/catalog',
                builder: (context, state) =>
                    MyHomePage(onThemeChanged: changeTheme),
              ),
            ],
          );

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _mode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const MyHomePage({super.key, required this.onThemeChanged});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Najma "),
        actions: [
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Rechercher...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          Switch(
            value: isDark,
            onChanged: (value) {
              widget.onThemeChanged(value);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            const SizedBox(height: 10),
            FeaturesSection(),
            const SizedBox(height: 25),
            Center(child: CtaButton()),
            const SizedBox(height: 8),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
