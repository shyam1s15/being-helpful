import 'package:being_helpful/scr/helpers/screen_navigation.dart';
import 'package:being_helpful/scr/helpers/styles.dart';
import 'package:being_helpful/scr/providers/auth.dart';
import 'package:being_helpful/scr/screens/home.dart';
import 'package:being_helpful/scr/screens/login.dart';
import 'package:being_helpful/scr/widgets/custom_text.dart';
import 'package:being_helpful/scr/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _key,
      body: SafeArea(
          child: SingleChildScrollView(
        child: authProvider.status == Status.Authenticating
            ? const Loading()
            : Column(children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text(
                          'BH',
                          style: TextStyle(fontSize: 50),
                        ),
                        radius: 100,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authProvider.email,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            icon: Icon(Icons.email)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authProvider.name,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "User Name",
                            icon: Icon(Icons.person)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authProvider.password,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            icon: Icon(Icons.password)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (!await authProvider.signUp()) {
                        // _key.currentState!.showSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registration Failed!')));
                        return;
                      }
                      authProvider.cleanController();
                      changeScreenReplacement(context, const Home());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: red,
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CustomText(
                              text: 'Register',
                              color: white,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeScreen(context, LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(text: 'Login Here'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeScreen(context, Home());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomText(text: 'Skip Registrations'),
                    ],
                  ),
                ),
              ]),
      )),
    );
  }
}
