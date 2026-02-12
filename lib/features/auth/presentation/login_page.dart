import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:landing_widgets/features/auth/state/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> cleFormulaire = GlobalKey<FormState>();

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();

  void seConnecter() {
    if (cleFormulaire.currentState!.validate()) {
      context.read<AuthProvider>().login();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Connexion réussie")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page de connexion")),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),

          child: Form(
            key: cleFormulaire,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Veuillez vous connecter",
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: nomController,
                  decoration: const InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(),
                  ),

                  validator: (valeur) {
                    if (valeur == null || valeur.isEmpty) {
                      return "Entrez votre nom";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: prenomController,
                  decoration: const InputDecoration(
                    labelText: "Prénom",
                    border: OutlineInputBorder(),
                  ),

                  validator: (valeur) {
                    if (valeur == null || valeur.isEmpty) {
                      return "Entrez votre prénom";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: seConnecter,
                    child: const Text("Se connecter"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
