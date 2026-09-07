import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_bloc.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, state) {
                    if (state is AvatarLoading) {
                      return CircularProgressIndicator(
                        constraints: BoxConstraints(
                          maxHeight: 100,
                          minHeight: 100,
                          maxWidth: 100,
                          minWidth: 100,
                        ),
                      );
                    }
                    if (state is AvatarLoadingSuccess) {
                      return Icon(Icons.account_circle_rounded, size: 200);
                    } else {
                      return Icon(Icons.account_circle_rounded, size: 100);
                    }
                  },
                ),
                Text('user name'),
                Text('first name'),
                Text('last name'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
