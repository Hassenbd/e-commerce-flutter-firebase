import 'package:e_commerce/constants.dart';
import 'package:e_commerce/provider/adminMode.dart';
import 'package:e_commerce/provider/modelHud.dart';
import 'package:e_commerce/screen/admin/admin.dart';
import 'package:e_commerce/screen/home.dart';
import 'package:e_commerce/screen/signup_screen.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/widgets/icon_widget.dart';
import 'package:e_commerce/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Login extends StatelessWidget {
  Login({super.key});
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
          inAsyncCall: Provider.of<ModelHud>(context).isLoading,
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
                      onPressed: () {
                        loginAction(context);
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
                            Provider.of<AdminMode>(context, listen: false);
                        adminMode.changeStatu(true);
                      },
                      child: Text("I m a Admin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? kMainColor
                                  : Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        final adminMode =
                            Provider.of<AdminMode>(context, listen: false);
                        adminMode.changeStatu(false);
                      },
                      child: Text("I m a user",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
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

  void loginAction(BuildContext context) async {
    final modelhud = Provider.of<ModelHud>(context, listen: false);
    modelhud.changeisLoading(true);
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (_password == "admin1234") {
          try {
            await _auth.signIn(_email, _password);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Admin()));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 2),
                content: Text(e.toString())));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 2),
              content: Text("some thing was wrong")));
        }
      } else {
        try {
          await _auth.signIn(_email, _password);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(e.toString())));
        }
      }
    }
    modelhud.changeisLoading(false);
  }
}
