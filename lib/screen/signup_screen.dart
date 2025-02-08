import 'package:e_commerce/constants.dart';
import 'package:e_commerce/provider/modelHud.dart';
import 'package:e_commerce/screen/login.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/widgets/icon_widget.dart';
import 'package:e_commerce/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  final _auth = Auth();
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
                  height: height * .01,
                ),
                InputField((value) {}, "username", const Icon(Icons.person)),
                SizedBox(
                  height: height * .01,
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
                  height: height * .01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black),
                    child: Builder(builder: (context) {
                      return TextButton(
                        onPressed: () async {
                          final modelhud =
                              Provider.of<ModelHud>(context, listen: false);
                          modelhud.changeisLoading(true);
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            try {
                              await _auth.signUp(_email, _password);
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(e.toString()),
                                duration: const Duration(seconds: 2),
                              ));
                            }
                          }
                          modelhud.changeisLoading(false);
                        },
                        child: const Text(
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          "Sign Up",
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Do have account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) => Login()));
                      },
                      child: const Text("Sign in"))
                ])
              ],
            ),
          ),
        ));
  }
}
