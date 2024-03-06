import 'package:database_project/core/widgets/custom_form_field.dart';
import 'package:database_project/festures/home_layout/presentation/manager/cubit.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<AppCubit>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            label: 'Task Title',
            controller: cubit.titleController,
            prefix: Icons.title),
        const SizedBox(
          height: 10,
        ),
        CustomFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'this Field is required';
              }
              return null;
            },
            label: 'Task Time',
            controller: cubit.timeController,
            prefix: Icons.watch_later_outlined,
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                cubit.timeController.text =
                    value!.format(context);
              });
            }),
        const SizedBox(
          height: 10,
        ),
        CustomFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          label: 'Task Date',
          controller: cubit.dateController,
          prefix: Icons.calendar_today,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.parse('2030-12-30'),
            ).then((value) {
              cubit.dateController.text =
                  DateFormat.yMMMd().format(value!);
            });
          },
        ),
      ],
    );
  }
}
