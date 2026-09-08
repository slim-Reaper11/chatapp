import 'package:chatapp/core/di/injection_container.dart';
import 'package:chatapp/features/auth/data/models/current_user.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_state.dart';
import 'package:chatapp/features/user%20profile/presentation/widgets/user_profile_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              buildWhen: (previous, current) => current != previous,
              builder: (context, state) {
                return UserProfileColumn(
                  userName: sl<CurrentUser>().user!.username,
                  firstName: sl<CurrentUser>().user!.firstName,
                  lastName: sl<CurrentUser>().user!.lastName,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
