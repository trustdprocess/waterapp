import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterapp/otp/otp.dart';


class forget_pass extends StatefulWidget {
  const forget_pass({super.key});

  @override
  State<forget_pass> createState() => _forget_passState();
}

class _forget_passState extends State<forget_pass> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    TextEditingController _emailController = TextEditingController();
    EmailOTP myauth = EmailOTP();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password "),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Your Email Address",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(
            height:size.height*0.01 ,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              elevation: 0,
              
            ),

              onPressed: () async {
                myauth.setConfig(
                    appEmail: "pankajpandey.p18@gmail.com",
                    appName: "Travel Eze",
                    userEmail: _emailController.text,
                    otpLength: 4,
                    otpType: OTPType.digitsOnly);
                if (await myauth.sendOTP() == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP has been sent"),
                  ));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => verification(myauth: myauth,)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP send failed"),
                  ));
                }
              },
              child: const Text("Send OTP")),

              
        ],
      ),
    );
  }
}