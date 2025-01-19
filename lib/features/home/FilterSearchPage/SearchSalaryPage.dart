import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:apiproject/add/widget/colors.dart';

import '../../../constants/option_constant.dart';

class SearchSalaryPage extends StatefulWidget {
  const SearchSalaryPage({super.key});

  @override
  State<SearchSalaryPage> createState() => _SearchSalaryPageState();
}

class _SearchSalaryPageState extends State<SearchSalaryPage> {
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
                          SizedBox(width: 50.w),
                          Text('Salary From',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 50.w),
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
                        children: Salary.map(
                          (hobby) {
                            bool isSelected = false;
                            if (Salary_list!.contains(hobby)) {
                              isSelected = true;
                            }
                            return GestureDetector(
                              onTap: () {
                                if (!Salary_list!.contains(hobby)) {
                                  if (Salary_list!.length < 5) {
                                    Salary_list!.add(hobby);
                                    setState(() {});
                                    print(Salary_list);
                                  }
                                } else {
                                  Salary_list!.removeWhere(
                                      (element) => element == hobby);
                                  setState(() {});
                                  print(Salary_list);
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
