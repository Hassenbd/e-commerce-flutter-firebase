import 'package:e_commerce/constants.dart';
import 'package:e_commerce/provider/adminMode.dart';
import 'package:e_commerce/provider/modelHud.dart';
import 'package:e_commerce/screen/signup_screen.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/widgets/icon_widget.dart';
import 'package:e_commerce/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  login({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _auth = Auth();
  String _email = "";
  String _password = "";
  bool reload = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: kMainColor,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<Modelhud>(context).isLoading,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                icon_widget(height: height),
                SizedBox(
                  height: height * .05,
                ),
                InputField((value) {
                  _email = value;
                }, "email", const Icon(Icons.email)),
                SizedBox(
                  height: height * .01,
                ),
                InputField((value) {
                  _password = value;
                }, "password", const Icon(Icons.lock)),
                SizedBox(
                  height: height * .03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: TextButton(
                      onPressed: () async {
                        final modelhud =
                            Provider.of<Modelhud>(context, listen: false);
                        modelhud.changeisLoading(true);
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();

                          try {
                            final res = await _auth.signIn(_email, _password);
                            print(res.toString());
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(e.toString())));
                          }
                        }
                        modelhud.changeisLoading(false);
                      },
                      child: const Text(
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        "Login",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Don't have account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => SignupScreen()));
                      },
                      child: const Text("Sign up"))
                ]),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        final adminMode =
                            Provider.of<Adminmode>(context, listen: false);
                        adminMode.changeStatu(true);
                      },
                      child: Text("I m a Admin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Provider.of<Adminmode>(context).isAdmin
                                  ? kMainColor
                                  : Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        final adminMode =
                            Provider.of<Adminmode>(context, listen: false);
                        adminMode.changeStatu(false);
                        print(adminMode.isAdmin);
                      },
                      child: Text("I m a user",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Provider.of<Adminmode>(context).isAdmin
                                  ? Colors.white
                                  : kMainColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
