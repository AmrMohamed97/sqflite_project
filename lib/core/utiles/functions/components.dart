 import 'package:database_project/features/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//amr 4
 Widget  buildTaskItem(context , Map model) =>Dismissible(
    key: UniqueKey(),
    onDismissed: (direction){
      AppCubit.get(context).deleteFromDatabase(id: model['id']);
     },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child:   Row(
          children:[
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize:18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed:(){
                BlocProvider.of<AppCubit>(context).updateDatabase(
                  status: 'Done',
                  id: model['id'],
                );
                BlocProvider.of<AppCubit>(context).getDataFromDatabase();
              } ,
              icon:const Icon(Icons.check_circle,color: Colors.indigo,) ,
            ),
            IconButton(
              onPressed: (){
                AppCubit.get(context).updateDatabase(
                  status: 'Archived',
                  id: model['id'],
                );
                AppCubit.get(context).getDataFromDatabase();
              },
              icon:const Icon(Icons.archive,color: Colors.black26) ,
            ),
          ]
      ),
    ),
  );
