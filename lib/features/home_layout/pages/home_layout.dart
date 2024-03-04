import 'package:database_project/features/home_layout/pages/widget/bottom_sheet_body.dart';
import 'package:database_project/features/manager/cubit.dart';
import 'package:database_project/features/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text(
                  state.title[AppStates.currentIndex],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (state.bottomSheetShow == true) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertIntoDatabase(
                        title: cubit.titleController.text,
                        time: cubit.timeController.text,
                        date: cubit.dateController.text,
                      );

                      cubit.getDataFromDatabase();

                      cubit.moveBottomSheet(
                          bottomSheetShow: false, fabIcon: Icons.edit);

                      Navigator.pop(context);
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Form(
                              key: formKey,
                              child: const BottomSheetBody(),
                            ),
                          );
                        })
                        .closed
                        .then((value) {
                          cubit.moveBottomSheet(
                            bottomSheetShow: false,
                            fabIcon: Icons.edit,
                          );
                        });
                    cubit.moveBottomSheet(
                      bottomSheetShow: true,
                      fabIcon: Icons.add,
                    );
                  }
                },
                child: Icon(state.fabIcon),
              ),
              body: state is AppLoadingDataFromDatabaseState
                  ? const Center(child: CircularProgressIndicator())
                  : state.screen[AppStates.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: AppStates.currentIndex,
                onTap: (index) {
                  cubit.changeNavBarState(index: index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Tasks',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: 'Archived',
                  )
                ],
              ),
            ),
          );
        });
  }
}
