// ignore_for_file: deprecated_member_use

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:night_out/main.dart';
// import 'package:night_out/screens/productspage.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String otp;
  OTPScreen(this.otp);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final String verification_code;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 9, 9, 9),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(20, 20, 20, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(255, 237, 238, 238)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Verify Phone",
            style: TextStyle(
                color: Colors.black, fontFamily: "Product Sans", fontSize: 20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Code is sent to +91-9625276565",
                style: TextStyle(
                    color: Colors.black, fontFamily: "Product", fontSize: 15),
              ),
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    onCompleted: (pin) async {
                      // try {
                      //   // //await FirebaseAuth.instance
                      //   //     .signInWithCredential(PhoneAuthProvider.credential(
                      //   //         verificationId: verification_code,
                      //   //         smsCode: pin))
                      //   //     .then((value) async {
                      //   //   if (value.user != null) {
                      //       // Navigator.pushAndRemoveUntil(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) => page()),
                      //       //     (route) => false);
                      //     }
                      //   });/
                      // } catch (e) {
                      //   FocusScope.of(context).unfocus();
                      //   // _scaffoldkey.currentState!.showSnackBar(
                      //   //     SnackBar(content: Text('invalid OTP')));
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('invalid OTP')));
                      // }
                    },
                  )),
              Center(
                child: ElevatedButton(
                  child: Text("Go!"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    //   await FirebaseAuth.instance.verifyPhoneNumber(
    //       phoneNumber: '+91${widget.otp}',
    //       verificationCompleted: (PhoneAuthCredential credential) async {
    //         await FirebaseAuth.instance
    //             .signInWithCredential(credential)
    //             .then((value) async {
    //           // if (value.user != null) {
    //           //   Navigator.pushAndRemoveUntil(
    //           //       context,
    //           //       MaterialPageRoute(builder: (context) => MyApp()),
    //           //       (route) => false);
    //           // }
    //         });
    //       },
    //       verificationFailed: ( e) {
    //         print(e.message);
    //       },
    //       codeSent: (String verficationID, int? resendToken) {
    //         setState(() {
    //           verification_code = verficationID;
    //         });
    //       },
    //       codeAutoRetrievalTimeout: (String verificationID) {
    //         setState(() {
    //           verification_code = verificationID;
    //         });
    //       },
    //       timeout: Duration(seconds: 120));
    // }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _verifyPhone();
    }
  }
}
