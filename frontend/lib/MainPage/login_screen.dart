// ======================================================
// FILE: login_screen.dart
// RENAMED FROM: lecture10-11.dart
// PURPOSE: Login screen with username/password fields,
//          show/hide password toggle, and navigation
//          to the Home screen on successful login.
// ======================================================

import 'package:flutter/material.dart';
import '../home_screen.dart'; // home_screen.dart

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controls whether the password text is visible or hidden
  bool _isPasswordVisible = false;

  // ── Logo at the top of the login form ──────────────────
  Widget logo() {
    return const CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 50,
      child: Icon(Icons.shopping_bag, size: 50, color: Colors.white),
    );
  }

  // ── App/store name displayed below the logo ────────────
  Widget appTitle() {
    return const Text(
      "Tibiame Script store",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  // ── Username input field ───────────────────────────────
  Widget usernameField() {
    return const TextField(
      style: TextStyle(fontSize: 15, color: Colors.blueAccent),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Enter your username",
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.person, color: Colors.blue, size: 25),
      ),
    );
  }

  // ── Password input field with show/hide toggle ─────────
  Widget passwordField() {
    return TextField(
      // Hides or shows the password text based on state
      obscureText: !_isPasswordVisible,
      style: const TextStyle(fontSize: 15, color: Colors.blueAccent),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Enter your password",
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.lock, color: Colors.blue, size: 25),
        suffixIcon: IconButton(
          // Eye icon toggles between visible and hidden
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.blue,
            size: 25,
          ),
          onPressed: () {
            // Flip the visibility state and rebuild the widget
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }

  // ── Login button → navigates to Home screen ───────────
  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the Home screen (no back button via push)
          MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
          Navigator.push(context, route);
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // ── Sign-in button (placeholder — logic not yet added) ─
  Widget signInButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Add sign-in / registration logic here
        },
        child: const Text(
          "Sign in",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            logo(),
            const SizedBox(height: 20),
            appTitle(),
            const SizedBox(height: 30),
            usernameField(),
            const SizedBox(height: 15),
            passwordField(),
            const SizedBox(height: 40),
            loginButton(),
            const SizedBox(height: 10),
            signInButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
