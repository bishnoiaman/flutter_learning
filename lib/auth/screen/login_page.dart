import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoreup_cubit/resources/svg/app_svg.dart';
import 'package:scoreup_cubit/auth/cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController mobcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OtpSent) {
            Navigator.pushNamed(
              context,
              '/otp',
              arguments: {'mobileNumber': mobcontroller.text},
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              // resizeToAvoidBottomInset: true,
              reverse: true,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(
                                255,
                                225,
                                233,
                                240,
                              ),
                              radius: 80,
                            ),
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(
                                255,
                                241,
                                244,
                                247,
                              ),
                              radius: 50,
                            ),
                            SvgPicture.string(
                              AppIconSvg.loginPageIcon,
                              color: Colors.blue,
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(fontSize: 33, color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Boost Your Credit Score \n to ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '750+',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 270),
                        TextFormField(
                          controller: mobcontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            prefixText: '+91 ',
                            hintText: "Enter Your Mobile Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              final mobile = mobcontroller.text.trim();
                              context.read<AuthCubit>().login(mobile);
                            },
                            child: (state is AuthLoading)
                                ? CircularProgressIndicator(color: Colors.white,)
                                : Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      height: 2,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
