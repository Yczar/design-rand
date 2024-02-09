import 'package:design_task/app/authentication/ui/cubit/authentication_cubit.dart';
import 'package:design_task/app/authentication/ui/widgets/busha_form_field.dart';
import 'package:design_task/app/explore/ui/view/explore_page.dart';
import 'package:design_task/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationCubit(),
      child: const AuthenticationView(),
    );
  }
}

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({
    super.key,
  });

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  // keys
  late GlobalKey<FormState> _formKey;
  // controllers
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  // notifiers
  late ValueNotifier<bool> _showPasswordNotifier;
  @override
  void initState() {
    super.initState();
    // keys
    _formKey = GlobalKey();

    // notifiers
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    //
    _showPasswordNotifier = ValueNotifier(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationFailure) {
        } else if (state is AuthenticationSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<dynamic>(
              builder: (_) => const ExplorePage(),
            ),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Log in to your account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Welcome back! Please enter your registered email address '
                            'to continue',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BushaFormField(
                            controller: _emailController,
                            validator: Validators.emailValidator,
                            title: 'Email Address',
                            hintText: 'hello@busha.co',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ValueListenableBuilder(
                            valueListenable: _showPasswordNotifier,
                            builder: (_, showPassword, __) {
                              return BushaFormField(
                                controller: _passwordController,
                                obscureText: showPassword,
                                title: 'Password',
                                validator: Validators.passwordValidator,
                                hintText: 'Enter Password',
                                suffixWidget: TextButton(
                                  onPressed: () {
                                    _showPasswordNotifier.value =
                                        !_showPasswordNotifier.value;
                                  },
                                  child: const Text(
                                    'Show',
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0xFF12A633),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;

                        context.read<AuthenticationCubit>().signIn(
                              _emailController.text,
                              _passwordController.text,
                            );
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _showPasswordNotifier.dispose();
    super.dispose();
  }
}
