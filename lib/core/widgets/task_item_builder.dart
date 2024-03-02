import 'package:database_project/core/utiles/functions/components.dart';
import 'package:flutter/material.dart';

class TaskItemBuilder extends StatelessWidget {
  const TaskItemBuilder({super.key, required this.tasks});
  final List<Map> tasks;
  @override
  Widget build(BuildContext context) {
    return   tasks.isNotEmpty?
   ListView.separated(
        itemBuilder:(context,index)=>buildTaskItem(context, tasks[index]) ,
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsetsDirectional.only(start:15),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
      )
   : const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,),
            Text(
              'No Tasks yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
  }
}
