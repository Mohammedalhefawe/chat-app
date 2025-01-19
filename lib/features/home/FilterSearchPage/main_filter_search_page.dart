import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apiproject/constants/app_color.dart';
import 'package:apiproject/features/home/FilterSearchPage/SearchSalaryPage.dart';
import 'package:apiproject/features/home/FilterSearchPage/SearchSpecializationPage.dart';
import 'SearchJobTitlePage.dart';

class FilterSearchPage extends StatefulWidget {
  const FilterSearchPage({Key? key}) : super(key: key);

  @override
  State<FilterSearchPage> createState() => _Filter_Search_Page_screenState();
}

class _Filter_Search_Page_screenState extends State<FilterSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 24,
              right: 24,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
                        width: 100.w,
                      ),
                      Text('Filters',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchJobTitlePage();
                        }));
                      },
                      color: AppColor.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Search Job Title",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchSalaryPage();
                        }));
                      },
                      color: AppColor.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Search Salary ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchSpecializationPage();
                        }));
                      },
                      color: AppColor.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Search Specialization",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 45.h,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfffdf5d7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.lightGreenAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  )
                ]),
          )
        ]));
  }
}
