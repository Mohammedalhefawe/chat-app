import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';

import '../../constants/app_color.dart';





class SelectPositionScreen extends StatefulWidget {
  const SelectPositionScreen({Key? key}) : super(key: key);

  @override
  State<SelectPositionScreen> createState() => _SelectPositionScreenState();
}

class _SelectPositionScreenState extends State<SelectPositionScreen> {
  List<String> SelectPositionList = [
    "None",
    "Marketing",
    "Quality Assurance"
    "Engineering",
    "Community and Social Services",
    "Sales",
    "Others",
    "Program and Project Management",
    "Military and Protective Services",
    "Media and Communication",
    "Suppor",
    "Operations",
    "Business Development",
    "Education",
    "Information Technology",
  "Administrative",
  "Arts and Design",
  "Healthcare Services"
  "Entrepreneurship",
  "Finance",
  "Human Resources",
  "Consulting"
  "Product Management",
  "Tourism",
  "Accounting",
  "Research",
  "Purchasing",
  "Real Estate",
    "Legal",
  ];

 List<String> SelectPosition = [];
dynamic ion;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, right: 20, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 25.h),
                      PhloxAnimations(
                        duration: Duration(seconds: 1),
                        fromDegrees: -90,
                        fromScale: 0,
                        fromOpacity: 0.1,
                        fromY: -100,
                        fromX: -200,
                        child: Text(
                          "What job role interest you?",
                          style: TextStyle(
                            // color:Dark().ColorText(),
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Wrap(
                        children: SelectPositionList.map(
                              (hobby) {
                          bool isSelected = false;
                            if (SelectPosition.contains(hobby)) {
                              isSelected = true;

                              ion =hobby;
                            }
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(hobby=="None"){
                                    SelectPosition.clear();
                                   // SelectPosition.add(hobby);

                                    showDialog(

                                      context: context,
                                      builder: (context) => AlertDialog(

                                       title: Text('You have selected: None',  style: TextStyle(
                                         // color: Dark().ColorText(),
                                       )
                                      // TextStyles.font15DarkBlueMedium,
                                       ),
                                        content: Text(
                                          'Do not to select a Job that interests you?',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Row(

                                            children: [

                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();

                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: AppColor.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 80),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.pop(context, SelectPosition);
                                                },
                                                child: Text(
                                                  'OK',
                                               style: TextStyle(
                                                 color: AppColor.primaryColor,
                                               ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }else{
                                    if(SelectPosition.contains('None'))
                                      SelectPosition.clear();

                                  }
                                  if(SelectPosition.contains(hobby)&&SelectPosition.length<5)
                                  {
                                    SelectPosition.add(hobby);
                                  }else{
                                    SelectPosition.remove(hobby);
                                  }
                                });
                                String message;
                                if (!SelectPosition.contains(hobby)) {
                                  if (  SelectPosition.length < 5 ) {
                                    SelectPosition.add(hobby);
                                    message='You have selected: ${SelectPosition.join('.')}';
                                    setState(() {});
                                    print(SelectPosition);
                                  }else{
                                    message='You can select up to 5 position.';
                                  }
                                } else {
                                  SelectPosition.removeWhere(
                                          (element) => element == hobby);
                                  message='You have selected: ${SelectPosition.join('.')}';
                                  setState(() {});
                                  print(SelectPosition);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: PhloxAnimations(
                                  duration: const Duration(seconds: 1),
                                  fromX: -40,
                                  fromY: 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColor.primaryColor
                                          : AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular(18.r),
                                    ),
                                    padding: EdgeInsets.all(14),
                                    child: Text(
                                      hobby,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp),
                                    ),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [

                  const Spacer(),
                  SizedBox(
                    height: 45.h,
                    width: 100.w,
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor,maximumSize: Size(67, 100)),

                      onPressed: () {
                        if(SelectPosition.isEmpty){
                        showDialog(

                          context: context,
                          builder: (context) => AlertDialog(

                            icon: const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 32,
                            ),
                            content: Text(
                              'Please select at least one position.',
                              style: TextStyle(
                                // color: Dark().ColorText(),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                 // Navigator.of(context).pushReplacementNamed(Routes.homeScreen);

                                  Navigator.pop(context);
                                  // Navigator.pop(context, SelectPosition);
                                },
                                child: Text(
                                  'OK',
                            style: TextStyle(color: AppColor.primaryColor,),
                                ),
                              ),
                            ],
                          ),
                        );}else{

// عرض الرسالة باستخدام AlertDialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Your Selections: '),
                              content: SingleChildScrollView( // استخدام SingleChildScrollView للتأكد من عرض كل النص
                                child: ListBody(
                                  children: SelectPosition.map((position) => Text(position,style: TextStyle(
                                    // color: Dark().ColorText(),
                                  ),)).toList(),
                                ),

                              ),
                              actions: <Widget>[
                                Text('Now click OK, then click Save to store the information.',style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(width: 8,),
                                SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                 if(SelectPosition!=null&&SelectPosition.isNotEmpty) {

                                        Navigator.of(context).pop();
                                        Navigator.pop(context, SelectPosition);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                      },

                      child: const Text('Back',style: TextStyle(
                        color: Colors.black
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
