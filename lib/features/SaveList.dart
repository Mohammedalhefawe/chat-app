import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apiproject/savepost/logic/save_cubit.dart';

import '../add/widget/colors.dart';
import '../core/di/dependency_injection.dart';
import '../savepost/ui/saveFreelance.dart';
import '../savepost/ui/savepost.dart';

class SaveList extends StatefulWidget {
  const SaveList({super.key});

  @override
  State<SaveList> createState() => _SaveListState();
}

class _SaveListState extends State<SaveList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archives'),
      ),
      body: Stack(
        children: [
          Container(),
          SafeArea(
              child: Container(
            width: 0.6.sw,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Container(
                            child: BlocProvider(
                              create: (context) =>
                                  SaveCubit(getIt())..getSpecializations(),
                              child: Save(),
                            ),
                          ),
                        ));
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.bookmark_border_rounded,
                            color: AppColor.primaryColor),
                      ),
                      title: Text(
                        'General Posts archives',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Container(
                            child: BlocProvider(
                              create: (context) =>
                                  SaveCubit(getIt())..getSpecializations(),
                              child: SaveFreelance(),
                            ),
                          ),
                        ));
                      },
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.bookmark_border_rounded,
                            color: AppColor.primaryColor),
                      ),
                      title: Text(
                        'Freelance Posts archives',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
