import 'package:chatapp/features/user%20profile/domain/repository/User_profile_repository.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_event.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required this.userProfileRepository})
    : super(UserProfileInitial()) {
    on<UserProfileRequested>(_loadProfile);
  }

  final UserProfileRepository userProfileRepository;

  void _loadProfile(UserProfileRequested event, Emitter emit) async {
    emit(UserProfileLoading());
    emit(AvatarLoading());
    await Future.delayed(Duration(seconds: 2));

    emit(UserProfileSuccess());

    emit(AvatarLoadingSuccess());
  }
}
