import 'package:amaliy/providers/auth_provider.dart';
import 'package:amaliy/ui/auth/sign_in/widgets/social_buttons.dart';
import 'package:amaliy/ui/auth/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // LoginProvider x = context.read<LoginProvider>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 240, 240),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.6,
                    child: stackmethod(context),
                  ),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  Column(
                    children: [
                      const Center(
                        child: Text('or continue with'),
                      ),
                      SocialButtons(w: w),
                      Padding(
                        padding: EdgeInsets.all(w * 0.18),
                        child: Row(
                          children: [
                            const Text("Don't have an account yet? "),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const SignUpPage()),
                                  ),
                                );
                              },
                              child: const Text(
                                'Registration',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack stackmethod(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    LoginProvider x = context.watch<LoginProvider>();
    var h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(h * 0.025),
            ),
            width: w * 1,
            height: h * 0.4,
          ),
        ),
        Positioned(
          right: w * 0.35,
          top: h * 0.15,
          child: Text(
            'Welcome Back',
            style: TextStyle(color: Colors.white, fontSize: w * 0.08),
          ),
        ),
        Positioned(
          top: h * 0.22,
          left: w * 0.05,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(h * 0.023),
            ),
            width: w * 0.9,
            height: h * 0.36,
            child: Container(
              padding: EdgeInsets.all(h * 0.02),
              child: Column(
                children: [
                  TextFormField(
                    controller: x.emailController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.check_circle_rounded),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  TextFormField(
                    obscureText: x.obscureText,
                    controller: x.passwordController,
                    decoration: InputDecoration(
                      labelText: ('Password'),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade600),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(x.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            x.obscureText = !x.obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.012),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.045),
                  ),
                  SizedBox(
                    height: h * 0.06,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(h * 0.01),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red,
                        ),
                      ),
                      onPressed: (() {
                        if (x.passwordController.text.isNotEmpty &&
                            x.emailController.text.isNotEmpty) {
                          x.login(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('You should fill all fields'),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1)),
                          );
                        }

                        
                      }),
                      child: const Center(
                        child: Text('Sign In'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
