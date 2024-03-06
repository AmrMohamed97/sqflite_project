import 'package:database_project/festures/archived_tasks/presentation/pages/archived_tasks.dart';
import 'package:database_project/festures/done_tasks/presentation/pages/done_tasks.dart';
import 'package:database_project/festures/new_tasks/presentation/pages/new_tasks.dart';
import 'package:flutter/material.dart';

abstract class AppStates {
  IconData fabIcon = Icons.edit;
  bool bottomSheetShow = false;
  static int currentIndex =0;
  static List<Map> newTasks=[];
  static List<Map> doneTasks=[];
  static List<Map> archivedTasks=[];
  List title=[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  List screen=[
    const NewTasks(),
    const DoneTasks(),
    const ArchivedTasks(),
  ];
}

class AppInitialNavBarState extends AppStates {
  AppInitialNavBarState() {
    AppStates.currentIndex = 0;
  }
}
class AppChangeNavBarState extends AppStates {
  AppChangeNavBarState({required int index}) {
    AppStates.currentIndex =  index;
  }
}
class AppCreateDatabaseState extends AppStates{}
class AppInsertIntoDatabaseState extends AppStates{}
class AppGetFromDatabaseState extends AppStates{
  AppGetFromDatabaseState({required List<Map> val}){
    AppStates.newTasks=[];
    AppStates.doneTasks=[];
    AppStates.archivedTasks=[];
    for (var element in val) {
      if(element['status']=='New'){
        AppStates.newTasks.add(element);
      }
      else if(element['status']=='Done'){
        AppStates.doneTasks.add(element);
      }
      else if(element['status']=='Archived'){
        AppStates.archivedTasks.add(element);
      }
    }
  }
}
class AppLoadingDataFromDatabaseState extends AppStates{}
class AppChangeBottomSheetState extends AppStates{
  AppChangeBottomSheetState(bool bottomSheetShow,IconData fabIcon){
    this.bottomSheetShow=bottomSheetShow;
    this.fabIcon=fabIcon;
  }
}
class AppUpdateDatabaseState extends AppStates{}
class AppDeleteFromDatabaseState extends AppStates{}