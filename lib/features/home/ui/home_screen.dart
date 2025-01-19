import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apiproject/Tabs/ProfilePagr.dart';
import 'package:apiproject/Tabs/posts.dart';
import 'package:apiproject/features/freelance/logic/homeF_cubit.dart';

import '../../../Tabs/freelanceposts.dart';
import '../../../Tabs/menu.dart';
import '../../../chat/modules/chat_page.dart';
import '../../../core/di/dependency_injection.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'yallaWork',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.search_sharp),
                onPressed: () {},
              ),
              // IconButton(
              //     color: Colors.black,
              //     icon: Icon(Icons.forum, size: 30,),
              //     onPressed: () {}
              // ),
            ],

            //Tab Bar
            bottom: TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.orangeAccent,
              labelColor: Colors.orangeAccent,
              tabs: [
                Tab(icon: Icon(Icons.home_filled)),

                // Tab(icon: Icon(Icons.control_point_rounded),),
                Tab(
                  icon: Icon(Icons.home_mini_outlined),
                ),
                Tab(
                  icon: Icon(Icons.person_2_outlined),
                ),
                Tab(
                  icon: Icon(Icons.forum),
                ),
                Tab(icon: Icon(Icons.menu)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: PostsPage(),
              ),

              Container(
                child: BlocProvider(
                  create: (context) =>
                      HomeFCubit(getIt())..getSpecializations(),
                  child: FreelancePage(),
                ),
              ),
              Container(
                child: ProfileScreen(),
              ),

              Container(
                child: ChatPage(),
              ),

              Container(
                child: Side_bar(),
              )
              // Icon(Icons.control_point_rounded),
              // Icon(Icons.bookmark_border_rounded),
            ],
          )),
    );
  }
}
