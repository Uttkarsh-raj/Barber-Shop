import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hair_salon/constants/colors.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  // final TextEditingController _number = TextEditingController();
  List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  int count = 0;
  late Timer _timer;
  int _secondsRemaining = 60;
  bool _isResendButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Start the countdown when the screen is loaded
    _startCountdown();
  }

  // Start the countdown
  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _isResendButtonEnabled = true;
        }
      });
    });
  }

  // Handle the resend button tap
  void _handleResendButtonTap() {
    if (_isResendButtonEnabled) {
      // Reset the timer and disable the button
      setState(() {
        _secondsRemaining = 60;
        _isResendButtonEnabled = false;
      });

      // Start the countdown again
      _startCountdown();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.46,
                child: Center(
                  child: Image.asset(
                    'assets/images/login.png',
                  ),
                ),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: size.height * 0.06),
                      Container(
                        // height: size.height * 0.3,
                        width: size.width * 0.91,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.4,
                            color: AppColors.borderGrey,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0).copyWith(
                            left: 17,
                            right: 17,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.08),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    6,
                                    (index) => SizedBox(
                                      width: size.width * 0.12,
                                      height: size.width * 0.11,
                                      child: Center(
                                        child: TextField(
                                          autofocus: true,
                                          textAlign: TextAlign.center,
                                          controller: _otpControllers[index],
                                          keyboardType: TextInputType.number,
                                          maxLength: 1,
                                          decoration: const InputDecoration(
                                            counterText: '',
                                            // hintText: '-',
                                            hintStyle: TextStyle(
                                              fontSize: 24,
                                              color: Color.fromARGB(
                                                  255, 37, 37, 37),
                                            ),
                                            // border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value.isNotEmpty) {
                                                count++;
                                              } else if (value.isEmpty) {
                                                count--;
                                              }
                                            });
                                            if (value.isNotEmpty && count < 6) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            } else if (value.isEmpty) {
                                              FocusScope.of(context)
                                                  .previousFocus();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Resend code in :',
                                      style: TextStyle(
                                        fontSize: 15,
                                        // color: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      ' $_secondsRemaining s ',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                      ),
                                    ),
                                    (_isResendButtonEnabled)
                                        ? TextButton(
                                            onPressed: _handleResendButtonTap,
                                            child: const Text(
                                              'Resend',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          )
                                        : const Text(
                                            'Resend',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 28, 62, 101),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: Text(
                                      'CONTINUE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              const Text(
                                'By continuing you agree to our',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Terms & Conditions ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Text(
                                      'and ',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Privacy Policy',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: size.height * 0.16,
                    bottom: size.height * 0.35,
                    child: Container(
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 5),
                            blurRadius: 1,
                            spreadRadius: 0.1,
                          )
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 60,
                            child: Image.asset(
                              'assets/images/login_lock.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
