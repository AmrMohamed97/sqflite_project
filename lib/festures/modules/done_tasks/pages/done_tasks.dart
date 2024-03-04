 import 'package:database_project/core/widgets/task_item_builder.dart';
import 'package:database_project/festures/manager/cubit.dart';
import 'package:database_project/festures/manager/states.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context)  {
    return   BlocConsumer<AppCubit,AppStates>(
      builder: (context,state) {
        var tasks =AppStates.doneTasks;
        return TaskItemBuilder(tasks: tasks);      },
      listener: (context,state){},
    );
  }
}