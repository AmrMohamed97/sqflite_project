 import 'package:database_project/core/widgets/task_item_builder.dart';
import 'package:database_project/festures/manager/cubit.dart';
import 'package:database_project/festures/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasks extends StatelessWidget{
  const NewTasks({Key? key}):super(key: key);
  @override
  Widget build (BuildContext context){
    return BlocConsumer<AppCubit,AppStates>(
      builder: (context,state){
        var tasks =AppStates.newTasks;
        return TaskItemBuilder(tasks: tasks);
      },
      listener: (context,state){},
    );
  }
}