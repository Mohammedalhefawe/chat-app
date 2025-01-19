import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apiproject/features/suggestion_post/ui/suggestion_post_ui.dart';
import '../../../my_widgets/headline_widget.dart';
import '../logic/suggestion_post_cubit.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<SuggestionCubit>().getSpecializations();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: HeadlineWidget(title: "Suggestion Jobs"),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              // HeadlineWidget(title: "Tips for you"),
              // SizedBox(height: 16),
              // TipsWidget(),
              // SizedBox(height: 24),
              SizedBox(height: 24.h),
              HeadlineWidget(title: "Posts"),
              SizedBox(height: 16.h),
              Container(child: RecentSuggestionWidget()),
              // Icon(Icons.home_filled),
              // PostsPage(),),

              //RecentSuggestionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
