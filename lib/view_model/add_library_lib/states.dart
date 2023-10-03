abstract class AddNewLibState {}

final class AddNewLibInitial extends AddNewLibState {}

final class AddNewLoadingState extends AddNewLibState {}

final class AddNewSucssesState extends AddNewLibState {}

final class AddNewErrorState extends AddNewLibState {}

final class AddNameErrorState extends AddNewLibState {}

final class AddImageErrorState extends AddNewLibState {}

final class AddgitHubUrlErrorState extends AddNewLibState {}

final class AddpubDevUrlErrorState extends AddNewLibState {}

final class AddTypeErrorState extends AddNewLibState {}
