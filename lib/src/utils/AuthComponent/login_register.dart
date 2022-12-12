import 'package:flutter/material.dart';

import '../utils.dart';

class LoginRegister extends StatelessWidget {
  final String titleName;
  final String infoText;
  final Function onEmailChange;
  final Function onPasswordChange;
  final bool isLoginPage;
  final Function changePage;
  final Function submitPress;
  final String error;
  final bool isLoading;
  LoginRegister({
    super.key,
    required this.titleName,
    required this.infoText,
    required this.onEmailChange,
    required this.onPasswordChange,
    required this.isLoginPage,
    required this.changePage,
    required this.submitPress,
    required this.error,
    required this.isLoading,
  });

  late String emailAddress = "";
  late String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(themeColor["primaryBG"]?.value ?? 0),
                Color(themeColor["secondaryBG"]?.value ?? 0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleName,
                  style: const TextStyle(color: Colors.white, fontSize: 42),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  onChanged: (value) {
                    onEmailChange(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 0)),
                      labelText: 'Enter your Email Address',
                      labelStyle: TextStyle(color: Colors.white60)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    onPasswordChange(value);
                  },
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 0)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white60)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: themeColor["active"], // Background color
                  ),
                  onPressed: () {
                    submitPress();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: 150,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (isLoading)
                            const SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 1),
                            ),
                          if (!isLoading)
                            const SizedBox(
                              width: 15,
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            titleName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "${infoText.split("?")[0]}?",
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () => changePage(),
                    child: Text(
                      infoText.split("?").last,
                      style:
                          TextStyle(color: themeColor["active"], fontSize: 18),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  textAlign: TextAlign.center,
                  error.split("]").last,
                  style: TextStyle(color: themeColor["active"], fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
