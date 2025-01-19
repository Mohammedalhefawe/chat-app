
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../../../constants/app_color.dart';
import '../../../networking/api_constants.dart';

enum _Tab {
  requirement,
  about,
}

class DetailFreelanceScreen extends StatefulWidget {
  const DetailFreelanceScreen({super.key});


  @override
  State<DetailFreelanceScreen> createState() => _DetailFreelanceScreenState();
}

class _DetailFreelanceScreenState extends State<DetailFreelanceScreen> {
  final selectedTab = ValueNotifier(_Tab.requirement);
  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');

    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  dynamic baseUrl = ApiConstants.Url;


  @override
  Widget build(BuildContext context) {
    final freelance = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var extractedPath = extractPath(freelance['profile_photo']!);


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 24,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: PhloxAnimations(
          duration: const Duration(milliseconds: 800),
          fromX: 200,
          child: Text(
            "Details",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 24,
            icon: const Icon(
              Icons.bookmark_border_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  PhloxAnimations(
                    duration: const Duration(seconds: 1),
                    fromY: -100,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Image.network(
                        // extractedPath,
                        // job['company_logo'],
                        // job['company_logo'],
                        freelance['profile_photo'] != null && freelance['profile_photo']!.isNotEmpty
                            ? baseUrl + extractedPath
                            : '',
                        width: 96,
                        height: 96,
                      ),
                      ),
                    ),

                  PhloxAnimations(
                    duration: const Duration(milliseconds: 800),
                    fromX: 200,
                    child:
                        Text(
                         freelance['general_job_title'],
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                           ),
                         ),
                          const SizedBox(height: 8),
                        PhloxAnimations(
                        duration: const Duration(milliseconds: 800),
                        fromX: 200,
                         child: Text(
                           freelance['specialization'],
                           style: Theme.of(context).textTheme.bodyMedium,
                           textAlign: TextAlign.center,
                                                   ),
                            ),

                  const SizedBox(height: 32),
                  PhloxAnimations(
                    duration: const Duration(milliseconds:850),
                    fromX: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.place_outlined,
                                color: AppColor.primaryColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              freelance['location'] ,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.attach_money_rounded,
                                color: AppColor.primaryColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              freelance['earnings'],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.phone,
                                color: AppColor.primaryColor,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              freelance['phone_number'],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  PhloxAnimations(
                    duration: const Duration(milliseconds: 900),
                    fromX: 200,
                    child: ValueListenableBuilder(
                      valueListenable: selectedTab,
                      builder: (context, value, child) {
                        return Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                left: value == _Tab.requirement
                                    ? 0
                                    : (MediaQuery.of(context).size.width - 48) /
                                    2,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  height: 40,
                                  width:
                                  (MediaQuery.of(context).size.width - 48) /
                                      2,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedTab.value = _Tab.requirement;
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Requirement",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(color: Colors.black38),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedTab.value = _Tab.about;
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "About",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(color: Colors.black38),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  PhloxAnimations(
                    duration: const Duration(milliseconds: 950),
                    fromX: 200,
                    child: ValueListenableBuilder(
                      valueListenable: selectedTab,
                      builder: (context, value, child) {
                        return value == _Tab.requirement
                            ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          separatorBuilder: (_, __) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "- ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(height: 1.4),
                                ),
                                Expanded(
                                  child: Text(
                                    freelance['requirements'],
                                    // recentJobs.requirements[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(height: 1.4),
                                  ),
                                )
                              ],
                            );
                          },
                        )
                            : Text(
                          freelance['job_information'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(height: 1.4),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: PhloxAnimations(
                duration: const Duration(milliseconds: 1000),
                fromX: 200,
                child: ElevatedButton(

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xffff962d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text(
                    "Apply Now",
                    style:TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                    // Theme.of(context)
                    //     .textTheme
                    //     .bodyLarge
                    //     ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: PhloxAnimations(
                duration: const Duration(milliseconds: 1000),
                fromX: 200,
                child: ElevatedButton(

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xffff962d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text(
                    "Chat",
                    style:TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                    // Theme.of(context)
                    //     .textTheme
                    //     .bodyLarge
                    //     ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
