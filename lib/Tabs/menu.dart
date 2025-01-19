import 'package:apiproject/features/SaveList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../add/widget/colors.dart';
import '../bloc/Dark/theme_bloc.dart';
import '../bloc/locale/locale_bloc.dart';
import '../constants/app_localizations.dart';
import '../core/routing/routes.dart';
import '../features/home/ui/home_screen.dart';

import '../theme/dark.dart';

class Side_bar extends StatefulWidget {
  const Side_bar({super.key});

  @override
  State<Side_bar> createState() => _SidebarState();
}

class _SidebarState extends State<Side_bar> {
  DarkTheme currentTheme = DarkTheme.Light;

  void _toggleTheme() {
    setState(() {
      currentTheme =
          currentTheme == DarkTheme.Light ? DarkTheme.Dark : DarkTheme.Light;
      context.read<ThemeBloc>().add(ThemeChangedEvent(theme: currentTheme));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Home_Screen();
                            }));
                          },
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                                Icon(Icons.home, color: AppColor.primaryColor),
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 16.sp, // Responsive font size
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>    Container(child:
                            // BlocProvider(
                            // create: (context) => SaveCubit(getIt())..getSpecializations(),
                            // child:  Save(),
                            // ),),
                            // ));
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SaveList();
                            }));
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
                            'Save',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 4.w, right: 63.w, top: 2.h, bottom: 2.h),
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        AppColor.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(currentTheme.icon,
                                          color: AppColor.primaryColor),
                                      onPressed: _toggleTheme,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 11.w),
                              Text(
                                currentTheme.name,
                                style: TextStyle(
                                  fontSize: 16.sp, // Responsive font size
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(AppLocalizations.of(context)!
                                      .translate("language")),
                                  content: BlocConsumer<LocaleBloc,
                                      ChangeLocaleState>(
                                    listener: (context, state) {
                                      // Navigator.of(context).pop();
                                    },
                                    builder: (context, state) {
                                      return DropdownButton<String>(
                                        value: 'ar',
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: ['ar', 'en'].map((String items) {
                                          return DropdownMenuItem<String>(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          if (newValue != null) {
                                            BlocProvider.of<LocaleBloc>(context)
                                                .changeLanguage(newValue);
                                            context
                                                .read<LocaleBloc>()
                                                .changeLanguage(newValue);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.language,
                                color: AppColor.primaryColor),
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.translate("language"),
                            style: TextStyle(
                              fontSize: 16.sp, // Responsive font size
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.loginScreen);
                          },
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.logout,
                                color: AppColor.primaryColor),
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.translate("logOut"),
                            style: TextStyle(
                              fontSize: 16.sp, // Responsive font size
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
