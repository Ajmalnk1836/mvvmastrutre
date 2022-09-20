import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmstructre/resourses/components/round_button.dart';
import 'package:mvvmstructre/utils/routes/utils.dart';
import 'package:mvvmstructre/view_model/auth_view_mode.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

ValueNotifier<bool> _obsucrePassword = ValueNotifier<bool>(false);
TextEditingController emailc = TextEditingController();
TextEditingController passc = TextEditingController();
FocusNode emilfocusNode = FocusNode();
FocusNode passworsFocusNode = FocusNode();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailc,
              focusNode: emilfocusNode,
              decoration: const InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email)),
              onFieldSubmitted: (value) {
                Utils.feildFocusChnage(
                    context, emilfocusNode, passworsFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsucrePassword,
              builder: (context, value, child) => TextFormField(
                obscureText: _obsucrePassword.value,
                focusNode: passworsFocusNode,
                obscuringCharacter: '*',
                controller: passc,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _obsucrePassword.value = !_obsucrePassword.value;
                        },
                        icon: Icon(_obsucrePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),  
            RoundButton(
              title: 'Register', 
              onpress: () {
                if (emailc.text.isEmpty) {
                  Utils.errorFlushbarMessage("Please enter email", context);
                } else if (passc.text.isEmpty) {
                  Utils.errortoastMessage("Please enter Password");
                } else {
                  Map data = {
                    "email": emailc.text.toString(),
                    "password": passc.text.toString()
                  };
                  provider.registerApi(data, context);
                }
              },
              loading: provider.loading,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    );
  }
}
