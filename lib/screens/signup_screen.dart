import 'package:flutter/material.dart';
import 'package:sisa/screens/login_screen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FB),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Poppins-Reguler',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Nama Lengkap'),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('Email'),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 4),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: isEmailValid ? null : "Email tidak valid",
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('Kata Sandi'),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Konfirmasi Kata Sandi'),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      isEmailValid = emailController.text.isNotEmpty;
                    });
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // Set the text color to black
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  },
                  child: Text(
                    "Sudah Punya Akun? Masuk",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
