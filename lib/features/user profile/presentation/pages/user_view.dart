import 'package:chatapp/core/di/injection_container.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_event.dart';
import 'package:chatapp/features/user%20profile/presentation/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserProfileBloc>()..add(UserProfileRequested()),
      child: UserProfilePage(),
    );
  }
}
