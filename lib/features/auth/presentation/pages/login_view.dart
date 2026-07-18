import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:chatapp/features/conversations/presentation/pages/conversation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  // bool _isLoading = false;
  // bool _rememberMe = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 204, 219, 219)),
      backgroundColor: const Color.fromARGB(255, 204, 219, 219),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.ac_unit_sharp, size: 40),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                const SizedBox(height: 25),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                // Password field.
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'At least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Sign in button with loading state.
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConversationPage(),
                        ),
                      );
                    }
                    if (state is AuthFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('${state.e}')));
                    }
                  },
                  child: FilledButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginRequested(
                          request: LoginRequest(
                            userName: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      );
                    },

                    child: BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        if (state == AuthLoading()) {
                          return CircularProgressIndicator();
                        } else {
                          return Text('Sign in');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
