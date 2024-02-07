import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pets.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  /*Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Store additional user details in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'address': _addressController.text.trim(),
      });

      print('Registration successful!');
    } catch (e) {
      print('Registration failed: $e');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/front.jpg"),
                  radius: 50,
                ),
                Text(
                  "Pet Adaptation",
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                  ),
                ),
                Text(
                  "Registration",
                  style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.deepPurple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFieldCard(
                    leadingIcon: Icons.person,
                    hintText: 'Name',
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFieldCard(
                    leadingIcon: Icons.email,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFieldCard(
                    leadingIcon: Icons.lock,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFieldCard(
                    leadingIcon: Icons.location_on,
                    hintText: 'Address',
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => petty()),
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
  final IconData leadingIcon;
  final String hintText;
  final bool obscureText;

  const TextFieldCard({
    required this.leadingIcon,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.deepPurple,
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}