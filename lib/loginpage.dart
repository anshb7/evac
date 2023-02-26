import 'package:evac/admin.dart';
import 'package:evac/adminlogin.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:string_validator/string_validator.dart';
// import 'package:evac/lib/main.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  double phoneNo = 0;
  double emergencyPhone = 0;
  String password = "";
  String confirmPassword = "";

  // CollectionReference Users =
  //     FirebaseFirestore.instance.collection("Users");
  bool isInt(String str) {
    try {
      int.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isAlpha(String str) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " User Registration Form",
          style: TextStyle(
              color: Color.fromRGBO(20, 20, 20, 1),
              fontFamily: "Product",
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                width: 500,
                child: Center(
                  child: Form(
                      key: formkey,
                      child: Expanded(
                          child: Center(
                              child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                child: Text(
                                  "Fill in your details!",
                                  style: TextStyle(
                                      color: Color.fromRGBO(20, 20, 20, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Product'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                style: TextStyle(fontFamily: "Product Sans"),
                                validator: (value) {
                                  if (isInt(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelText: "What's your name?",
                                    labelStyle:
                                        TextStyle(fontFamily: "Product Sans"),
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                onSaved: (newValue) {
                                  setState(() {
                                    name = newValue.toString();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                style: TextStyle(fontFamily: "Product Sans"),
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(fontFamily: "Product Sans"),
                                    prefixText: "+91",
                                    labelText: "What is your phone number?",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (isAlpha(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    phoneNo = double.parse(newValue.toString());
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                style: TextStyle(fontFamily: "Product Sans"),
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(fontFamily: "Product Sans"),
                                    prefixText: "+91",
                                    labelText: "Give your Emergency contact",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (isAlpha(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    emergencyPhone =
                                        double.parse(newValue.toString());
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(fontFamily: "Product Sans"),
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(fontFamily: "Product Sans"),
                                    labelText: "Enter your password",
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onChanged: (value) {
                                  password = value;
                                },
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    password = newValue.toString();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(fontFamily: "Product Sans"),
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelStyle:
                                        TextStyle(fontFamily: "Product Sans"),
                                    labelText: "Confirm your password",
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onChanged: (value) {
                                  confirmPassword = value;
                                },
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Kindly re-enter your password';
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  }
                                  if (value != password) {
                                    return 'The passwords do not match';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    confirmPassword = newValue.toString();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  final isValid =
                                      formkey.currentState?.validate();
                                  if (isValid!) {
                                    formkey.currentState?.save();
                                    try {
                                      // createuser();
                                      Navigator.pushNamed(
                                          context, '/otpscreen');
                                      final snackbar = SnackBar(
                                        content: Text(
                                          "Successfully Added!",
                                          style: TextStyle(
                                              fontFamily: "Product",
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);
                                      // Navigator.push(
                                      // context
                                      // ,
                                      // MaterialPageRoute(
                                      //     builder: ((context) =>
                                      //         UserDashboard()))
                                      // );
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                child: Text(
                                  "Submit! ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Product"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )))),
                ),
              ),
              Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you an admin?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: "Cera"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => Admin())));
                      },
                      child: Text(
                        "Sign up now!",
                        style:
                            TextStyle(color: Colors.blue, fontFamily: "Cera"),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future createuser() async {
  //   final User = UserInfo(
  //       name: name,
  //       phNo: phoneNo,
  //       emergencyPhone: emergencyPhone,
  //       password: password,
  //       confirmPassword: confirmPassword);
  //   final json = User.toJson();
  //   return Users.doc(user!.uid.toString()).set(json);
  // }
}
