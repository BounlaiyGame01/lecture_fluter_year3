import 'package:flutter/material.dart';
import 'package:my_applecture/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // State variable to control password visibility.
  // When false, the text is obscured (default state).
  bool _isPasswordVisible = false;

  Widget logo() {
    // Note: Ensure the image asset path "Image/icon.png" is correct in your project.
    return const CircleAvatar(
      // Using a placeholder icon since the image asset might not be available
      backgroundColor: Colors.blue,
      radius: 50,
      // Using a placeholder icon since the image asset might not be available
      child: Icon(Icons.shopping_bag, size: 50, color: Colors.white),
    );
  }

  Widget TextStore() {
    return const Text(
      "Tibiame Script store",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget TextUsername() {
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

  Widget TextPassword() {
    return TextField(
      // Toggle obscureText based on the state variable
      obscureText: !_isPasswordVisible,
      style: const TextStyle(fontSize: 15, color: Colors.blueAccent),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Enter your password",
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.lock, color: Colors.blue, size: 25),
        suffixIcon: IconButton(
          // Change the icon based on the state
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.blue,
            size: 25,
          ),
          onPressed: () {
            // Toggle the state and rebuild the widget
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }

  Widget buttonLogin() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
            Navigator.push(context, route);
          });
          // Add login logic here
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget ButtonSignin() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          // Add sign in logic here
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
            TextStore(),
            const SizedBox(height: 30),
            TextUsername(),
            const SizedBox(height: 15),
            TextPassword(),
            const SizedBox(height: 40),
            buttonLogin(),
            const SizedBox(height: 10),
            ButtonSignin(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
