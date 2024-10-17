import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technical_test/features/home/home_page.dart';
import 'package:technical_test/features/login/bloc/login_bloc.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  bool _isObscure = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        final status = state.status;
        if (status == LoginStatus.loading) {
          toastification.dismissAll();
          toastification.show(
            context: context,
            type: ToastificationType.info,
            style: ToastificationStyle.flatColored,
            title: const Text('Memproses'),
            showProgressBar: false,
          );
        } else if (status == LoginStatus.success) {
          toastification.dismissAll();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );
        } else if (status == LoginStatus.failure) {
          toastification.dismissAll();
          toastification.show(
            context: context,
            autoCloseDuration: const Duration(seconds: 5),
            type: ToastificationType.error,
            style: ToastificationStyle.flatColored,
            title: Text(state.errorMessage),
            showProgressBar: false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ruangan Meeting',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 40,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Sign In'),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Password',
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 16,
                      ),
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          Login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
