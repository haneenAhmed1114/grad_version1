abstract class AppStates {}

class AppInitialState extends AppStates{}

class AppBottomNavState extends AppStates{}

class AppGetEmployeesLoadingState extends AppStates{}

class AppGetEmployeesSuccessState extends AppStates{}

class AppGetEmployeesErrorState extends AppStates{
  final String error;
  AppGetEmployeesErrorState(this.error);
}

class AppGetSearchLoadingState extends AppStates{}

class AppGetSearchSuccessState extends AppStates{}

class AppGetSearchErrorState extends AppStates{
  final String error;
  AppGetSearchErrorState(this.error);
}





