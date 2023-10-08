abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInErrorState extends SignInState {}

final class SignInErrorEmailState extends SignInState {}

final class SignInSucssesState extends SignInState {}
