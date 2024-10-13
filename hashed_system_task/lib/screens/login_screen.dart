import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashed_system_task/bloc/checkbox_bloc/checkbox_bloc.dart';
import 'package:hashed_system_task/utils/extension_function.dart';

import '../bloc/api_request_status.dart';
import '../bloc/internet_connectivity_bloc/internet_connectivity_bloc.dart';
import '../bloc/password_visibility_bloc/password_visibility_bloc.dart';
import '../bloc/signin_bloc/signin_bloc.dart';
import '../network/request/sign_in_body.dart';
import '../utils/StringPath.dart';
import '../utils/constant_resource.dart';
import '../utils/custom_color.dart';
import '../utils/string_resource.dart';
import '../widget/widget_button.dart';
import '../widget/widget_text_feild.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  @override
  void dispose() {
    emailTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectivityBloc, InternetConnectivityState>(
      listener: (context, state) {
        state is InternetLostState
            ? ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(StringResources.INTERNET_ERROR)))
            : const SizedBox.shrink();
      },
      child: Scaffold(
        body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state){
            ApiRequestStatus? status = state.apiRequestStatus;
            if (status is ApiRequestStatusSuccess) {
              print('ApiRequestStatusSuccess');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            } else if (status is ApiRequestStatusFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(status.errorMessage)),
              );
            }
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0), // For horizontal padding
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Image.asset(StringPath.BACK_IMAGE_PATH),
                            const SizedBox(width: 20),
                            const Text(
                              StringResources.SIGNIN,
                              style: TextStyle(
                                fontSize: ConstantResource.FONT_SIZE_TWENTY_FOUR,
                                fontFamily: StringResources.INTER,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: Image.asset(StringPath.LOGO_IMAGE_PATH,width: 200,height: 80,),
                        ),
                        const SizedBox(height: ConstantResource.HEIGHT_FIFTY),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            StringResources.EMAIL,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontFamily: StringResources.INTER,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        WidgetTextField(
                          textEditingController: emailTEC,
                          hintText: StringResources.EMAIL,
                          showSuffixIcon: false,
                          isPasswordVisible: false,
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            StringResources.PASSWORD,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontFamily: StringResources.INTER,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
                          builder: (context, state) {
                            return WidgetTextField(
                              textEditingController: passwordTEC,
                              hintText: StringResources.PASSWORD,
                              showSuffixIcon: true,
                              isPasswordVisible: state.isPasswordVisible ?? true,
                              togglePasswordVisibility: _togglePasswordVisibility,
                            );
                          },
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              BlocBuilder<CheckBoxBloc, CheckBoxState>
                                (builder: (context, state) {
                                  return  Checkbox(
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    activeColor: Colors.lightBlueAccent,
                                    side: BorderSide(color: CustomColors.silver, width: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    value: state.isChecked ?? false,
                                    onChanged: (newValue) {
                                      // Handle checkbox value change
                                      context.read<CheckBoxBloc>().add(
                                          CheckBoxEvent(newValue)
                                      );
                                    },
                                  );
                                 },
                              ),
                              const Text(
                                'I agree with the terms and conditions',
                                style: TextStyle(
                                  color: CustomColors.silver,
                                  fontSize: 13,
                                  fontFamily: StringResources.INTER,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontFamily: StringResources.INTER,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(width: 3),
                            InkWell(
                              onTap: () {
                                // Handle Sign Up tap
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: CustomColors.green,
                                  fontSize: 14,
                                  fontFamily: StringResources.INTER,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: ConstantResource.HEIGHT_FIFTIEN),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0), // Bottom padding of 30
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8, // 80% width of the screen
                    height: 50, // Define a fixed height for the button
                    child: BlocBuilder<InternetConnectivityBloc, InternetConnectivityState>(
                      builder: (context, state) {
                        InternetConnectivityState internetState = state;
                        return WidgetElevatedButton(
                          onTap: () {
                            if (emailTEC.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(StringResources.EMPTY_EMAIL_ERROR),
                                ),
                              );
                            } else if (!emailTEC.text.isValidEmail()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(StringResources.INVLAID_EMAIL_ERROR),
                                ),
                              );
                            } else if (passwordTEC.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(StringResources.EMPTY_PASSWORD_ERROR),
                                ),
                              );
                            } else {
                              var state = BlocProvider.of<CheckBoxBloc>(context).state;
                              if(state.isChecked == true){
                                print('true');
                                _signIn(email: emailTEC.text, password: passwordTEC.text, state: internetState);
                              } else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Please agree with our terms and condition first')),
                                );
                              }
                            }
                          },
                          buttonText: StringResources.CONTINUE,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _togglePasswordVisibility(bool? isPasswordVisible) {
    context.read<PasswordVisibilityBloc>().add(PasswordVisibilityEvent(isPasswordVisible));
  }

  Future<void> _signIn({required String email,
    required String password,
    required InternetConnectivityState state}) async {
    if (_loginFormKey.currentState?.validate() == true) {
      print('_signIn');
      FocusScope.of(context).unfocus();
      if (state is InternetGainedState) {
        print('InternetGainedState');
        final body = SignInBody(
            email: email,
            password: password,
            device_id: 'dcndjc89');
        context.read<SignInBloc>().add(
            SignInDataEvent(body)
        );
      } else {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(StringResources.INTERNET_ERROR)));
      }
    }
  }
}
