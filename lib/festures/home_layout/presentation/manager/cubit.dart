 import 'package:database_project/festures/home_layout/presentation/manager/states.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialNavBarState());
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  Database? database;
  static AppCubit get(context)=>BlocProvider.of(context);

  void moveBottomSheet({required bool bottomSheetShow,required IconData fabIcon}){
    emit(AppChangeBottomSheetState(bottomSheetShow,fabIcon));
  }
  void changeNavBarState({required int index}){
    emit(AppChangeNavBarState(index: index));
  }

   void createDatabase()async
  {
       await openDatabase(
      'amr.db',
      version: 1,
      onCreate: (database,version)async{
        await database.execute(
              'CREATE TABLE amr(id INTEGER PRIMARY KEY , title TEXT ,time TEXT ,date TEXT , status TEXT)'
          ).then((value) => print('table is created'));
      },
      onOpen: (database){
      emit(AppCreateDatabaseState());
    }
    ).then((value) {
         database =value;
         getDataFromDatabase();
      });
  }

  void insertIntoDatabase({
    required String title,
    required String time,
    required String date,
})async {
       await database!.transaction((txn) async {
        await txn.rawInsert(
          'INSERT INTO amr( title , time , date ,status)VALUES("$title","$time","$date","New")'
      );
    });
      emit(AppInsertIntoDatabaseState());
  }

  void getDataFromDatabase() {
    emit(AppLoadingDataFromDatabaseState());
      database!.rawQuery(
        'SELECT * FROM amr',
    ).then((value) {
      emit(AppGetFromDatabaseState(val: value));
     });
  }
  void updateDatabase({required String status, required int id})async {
    await database!.rawUpdate(
        'UPDATE amr SET status=? WHERE id=?',
      [status,id]
    );
      emit(AppUpdateDatabaseState());
  }
  void deleteFromDatabase({required int id})async {
      await database!.rawDelete(
      'DELETE FROM amr WHERE id=?',[id]
    );
      getDataFromDatabase();
      emit(AppDeleteFromDatabaseState());

  }
}
