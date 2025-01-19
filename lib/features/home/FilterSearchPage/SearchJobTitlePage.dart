import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:apiproject/add/widget/colors.dart';

import '../../../constants/option_constant.dart';

class SearchJobTitlePage extends StatefulWidget {
  const SearchJobTitlePage({super.key});

  @override
  State<SearchJobTitlePage> createState() => _SearchJobTitlePageState();
}

class _SearchJobTitlePageState extends State<SearchJobTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, right: 20, left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              PhloxAnimations(
                duration: const Duration(seconds: 1),
                fromY: 100,
                fromX: -50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Text('Job Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 75.w),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Wrap(
                        children: jobtital.map(
                          (hobby) {
                            bool isSelected = false;
                            if (JobTital!.contains(hobby)) {
                              isSelected = true;
                            }
                            return GestureDetector(
                              onTap: () {
                                if (!JobTital!.contains(hobby)) {
                                  if (JobTital!.length < 5) {
                                    JobTital!.add(hobby);
                                    setState(() {});
                                    print(JobTital);
                                  }
                                } else {
                                  JobTital!.removeWhere(
                                      (element) => element == hobby);
                                  setState(() {});
                                  print(JobTital);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColor.primaryColor
                                        : AppColor.secondaryColor,
                                    borderRadius: BorderRadius.circular(18.r),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    hobby,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
