part of 'handler.dart';

@immutable
abstract class AppState {}

class AppStateInitial extends AppState {}

class AppStateDataFetched extends AppState {}

class AppStateCustomerDeleted extends AppState {}

class AppStateCustomerAdded extends AppState {}
