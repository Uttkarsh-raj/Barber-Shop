import 'package:flutter/material.dart';
import 'package:hair_salon/constants/colors.dart';
import 'package:hair_salon/view/verify.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _number = TextEditingController();
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
                              TextField(
                                controller: _number,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Enter Mobile Number",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.add_ic_call_outlined,
                                    size: 27,
                                  ),
                                  suffixIconColor: Colors.grey[400],
                                ),
                              ),
                              SizedBox(height: size.height * 0.05),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => VerificationPage(
                                        number: _number.text.trim().toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 28, 62, 101),
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
                    bottom: size.height * 0.31,
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
                              'assets/images/login_profile (1).png',
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
