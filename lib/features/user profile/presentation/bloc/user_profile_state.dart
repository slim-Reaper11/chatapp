import 'package:equatable/equatable.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();
  @override
  List<Object?> get props => [];
}

final class UserProfileInitial extends UserProfileState {
  const UserProfileInitial();
}

final class UserProfileLoading extends UserProfileState {
  const UserProfileLoading();
}

final class UserProfileSuccess extends UserProfileState {
  const UserProfileSuccess();
}

final class AvatarLoading extends UserProfileState {
  const AvatarLoading();
}

final class AvatarLoadingSuccess extends UserProfileState {
  const AvatarLoadingSuccess();
}
