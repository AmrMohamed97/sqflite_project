 import 'package:database_project/core/widgets/task_item_builder.dart';
import 'package:database_project/features/manager/cubit.dart';
import 'package:database_project/features/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({Key? key}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: (context,state){
        var tasks =AppStates.archivedTasks;
        return TaskItemBuilder(tasks: tasks);      },
      listener: (context,state){},
    );
  }
}
