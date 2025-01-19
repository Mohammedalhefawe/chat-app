// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:yallawork/features/add/widget/colors.dart';
// import 'package:yallawork/features/posts/logic/home_cubit.dart';
// import 'package:yallawork/features/posts/logic/home_state.dart';
// import 'package:yallawork/features/posts/models.dart';
// import '../../../core/networking/api_constants.dart';
// import '../../../core/routing/routes.dart';
// import '../../add/widget/shared_preferences.dart';
//
// class RecentJobWidget extends StatefulWidget {
//   RecentJobWidget({super.key});
//
//   @override
//   State<RecentJobWidget> createState() => _RecentJobWidgetState();
// }
//
// class _RecentJobWidgetState extends State<RecentJobWidget> {
//   dynamic baseUrl = ApiConstants.Url;
//   List<Post> savedPosts = []; // List to store saved posts
//   int? id;
//   String extractPath(String fullPath) {
//     var pathParts = fullPath.split('\\');
//     return pathParts.sublist(pathParts.length - 1).join('/');
//   }
//   String token=  CachData.getData(key: 'access_token');
//   Future SendIdPostSave(int? id )async{
//     var headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization':'Bearer ${token}'
//     };
//     var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/api/wishlist/add_post'));
//     request.body = json.encode({
//       "post_id":id,
//     });
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//
//       print(await response.stream.bytesToString());
//       print('truuuuuuuuuuuuuuuuuu');
//
//
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {
//         if (state is SpecializationsSuccess) {
//           setState(() {});
//         }
//       },
//       builder: (context, state) {
//         var cubit = context.read<HomeCubit>();
//         if (state is SpecializationsLoading && cubit.allPosts.isEmpty) {
//           return setupLoading();
//         }
//         return setupSuccess(cubit.allPosts, state is SpecializationsLoading);
//       },
//     );
//   }
//
//   Widget setupLoading() {
//     return const SizedBox(
//       height: 100,
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
//
//   Widget setupSuccess(List<Post> specializationsList, bool isLoading) {
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: specializationsList.length + (isLoading ? 1 : 0),
//       separatorBuilder: (context, index) {
//         return const Divider();
//       },
//       itemBuilder: (context, index) {
//         if (index == specializationsList.length) {
//           return const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//
//         final job = specializationsList[index];
//         var extractedPath = extractPath(job.companyLogo!);
//         bool isSaved = savedPosts.contains(job); // Check if the post is saved
//
//         return InkWell(
//           onTap: () {
//             Navigator.pushNamed(
//               context,
//               Routes.detailJobScreen,
//               arguments: {
//                 'company_logo': job.companyLogo,
//                 'general_job_title': job.generalJobTitle,
//                 'company_name': job.companyName,
//                 'detailed_location': job.detailedLocation,
//                 'expected_salary': job.expectedSalary,
//                 'enrollment_status': job.enrollmentStatus,
//                 'requirements': job.requirements,
//                 'job_information': job.jobInformation,
//               },
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Image.network(
//                     job.companyLogo != null && job.companyLogo!.isNotEmpty
//                         ? baseUrl + extractedPath
//                         : '',
//                     width: 48,
//                     height: 48,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         job.generalJobTitle!,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             job.applicationDeadline!,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.place_outlined,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 3),
//                           Text(
//                             job.detailedLocation!,
//                             style: TextStyle(fontSize: 11),
//                           ),
//                           const SizedBox(width: 4),
//                           const Icon(
//                             Icons.card_travel_rounded,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 3),
//                           Text(
//                             job.enrollmentStatus!,
//                             style: TextStyle(fontSize: 11),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 3),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         id = job.id;
//                         //   id= await SharedPrefHelper.getInt(SharedPrefKeys.postId);
//                         print('id_save_post= $id');
//                        // SendIdPostSave(id!);
//                         bool isSuccess = await SendIdPostSave(id!);
//
//                         if (isSuccess) {
//                           setState(() {
//                             if (isSaved) {
//                               savedPosts.remove(job);
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text('Removed from saved posts'),
//                                 ),
//                               );
//                             } else {
//                               savedPosts.add(job);
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text('Added to saved posts successfully!'),
//                                 ),
//                               );
//                             }
//                           });
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Failed to add to saved posts. Please try again.'),
//                             ),
//                           );
//                         }
//                       },
//                       child: Icon(
//                         isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
//                         color: isSaved ? AppColor.primaryColor : null,
//                       ),
//                     ),
//
//
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget setupError() {
//     return const SizedBox(
//       height: 100,
//       child: Center(
//         child: Text('Error loading data.'),
//       ),
//     );
//   }
// }
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:yallawork/features/add/widget/colors.dart';
// import 'package:yallawork/features/posts/logic/home_cubit.dart';
// import 'package:yallawork/features/posts/logic/home_state.dart';
// import 'package:yallawork/features/posts/models.dart';
// import '../../../core/networking/api_constants.dart';
// import '../../../core/routing/routes.dart';
// import '../../add/widget/shared_preferences.dart';
//
// class RecentJobWidget extends StatefulWidget {
//   RecentJobWidget({super.key});
//
//   @override
//   State<RecentJobWidget> createState() => _RecentJobWidgetState();
// }
//
// class _RecentJobWidgetState extends State<RecentJobWidget> {
//   dynamic baseUrl = ApiConstants.Url;
//   List<Post> savedPosts = [];
//   int? id;
//   String extractPath(String fullPath) {
//     var pathParts = fullPath.split('\\');
//     return pathParts.sublist(pathParts.length - 1).join('/');
//   }
//   String token = CachData.getData(key: 'access_token');
// late bool savedd ;
//   Future<bool> SendIdPostSave(int? id) async {
//     var headers = {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//     var request = http.Request('POST', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/add_post'));
//     request.body = json.encode({
//       'post_id': id,
//     });
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       savedd=true;
//       print(await response.stream.bytesToString());
//       print('Successfully added to wishlist');
//       return true;
//     } else {
//       print(response.reasonPhrase);
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {
//         if (state is SpecializationsSuccess) {
//           setState(() {});
//         }
//       },
//       builder: (context, state) {
//         var cubit = context.read<HomeCubit>();
//         if (state is SpecializationsLoading && cubit.allPosts.isEmpty) {
//           return setupLoading();
//         }
//         return setupSuccess(cubit.allPosts, state is SpecializationsLoading);
//       },
//     );
//   }
//
//   Widget setupLoading() {
//     return const SizedBox(
//       height: 100,
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
//
//   Widget setupSuccess(List<Post> specializationsList, bool isLoading) {
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: specializationsList.length + (isLoading ? 1 : 0),
//       separatorBuilder: (context, index) => const Divider(),
//       itemBuilder: (context, index) {
//         if (index == specializationsList.length) {
//           return const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//
//         final job = specializationsList[index];
//         var extractedPath = extractPath(job.companyLogo!);
//         savedd = savedPosts.contains(job);
//         return InkWell(
//           onTap: () {
//             Navigator.pushNamed(
//               context,
//               Routes.detailJobScreen,
//               arguments: {
//                 'company_logo': job.companyLogo,
//                 'general_job_title': job.generalJobTitle,
//                 'company_name': job.companyName,
//                 'detailed_location': job.detailedLocation,
//                 'expected_salary': job.expectedSalary,
//                 'enrollment_status': job.enrollmentStatus,
//                 'requirements': job.requirements,
//                 'job_information': job.jobInformation,
//               },
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Image.network(
//                     job.companyLogo != null && job.companyLogo!.isNotEmpty
//                         ? baseUrl + extractedPath
//                         : '',
//                     width: 48,
//                     height: 48,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         job.generalJobTitle!,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             job.applicationDeadline!,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.place_outlined,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 3),
//                           Text(
//                             job.detailedLocation!,
//                             style: const TextStyle(fontSize: 11),
//                           ),
//                           const SizedBox(width: 4),
//                           const Icon(
//                             Icons.card_travel_rounded,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 3),
//                           Text(
//                             job.enrollmentStatus!,
//                             style: const TextStyle(fontSize: 11),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 3),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         id = job.id;
//                         print('id_save_post= $id');
//                      await SendIdPostSave(id!);
//                       },
//                       child: Icon(
//                         savedd ? Icons.bookmark : Icons.bookmark_border_rounded,
//                         color: savedd ? AppColor.primaryColor : null,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget setupError() {
//     return const SizedBox(
//       height: 100,
//       child: Center(
//         child: Text('Error loading data.'),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../add/widget/colors.dart';
import '../../../add/widget/shared_preferences.dart';
import '../../../core/helpers/sharedpreference.dart';
import '../../../core/routing/routes.dart';
import '../../../networking/api_constants.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import '../models.dart';

class RecentJobWidget extends StatefulWidget {
  const RecentJobWidget({super.key});

  @override
  State<RecentJobWidget> createState() => _RecentJobWidgetState();
}

class _RecentJobWidgetState extends State<RecentJobWidget> {
  dynamic baseUrl = ApiConstants.Url;
  List<int> savedPosts = []; // List to store saved post IDs
  int? id;

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  String? token = CachData.getData(key: 'access_token');

  Future<bool> SendIdPostSave(int id) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'POST', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/add_post'));
    request.body = json.encode({
      "post_id": id,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print('Successfully added to wishlist');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> RemoveIdPostSave(int id) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'DELETE', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/remove_post'));
    request.body = json.encode({
      "post_id": id,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print('Successfully removed from wishlist');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SpecializationsSuccess) {
          setState(() {});
        }
      },
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        if (state is SpecializationsLoading && cubit.allPosts.isEmpty) {
          return setupLoading();
        }

        return setupSuccess(cubit.allPosts, state is SpecializationsLoading);
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(List<Post> specializationsList, bool isLoading) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specializationsList.length + (isLoading ? 1 : 0),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        if (index == specializationsList.length) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final job = specializationsList[index];
        var extractedPath = extractPath(job.companyLogo!);
        bool isSaved = savedPosts.contains(job.id);
        SharedPrefHelper.setData('save', isSaved);

        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailJob,
              arguments: {
                'company_logo': job.companyLogo,
                'general_job_title': job.generalJobTitle,
                'company_name': job.companyName,
                'detailed_location': job.detailedLocation,
                'expected_salary': job.expectedSalary,
                'enrollment_status': job.enrollmentStatus,
                'requirements': job.requirements,
                'job_information': job.jobInformation,
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    job.companyLogo != null && job.companyLogo!.isNotEmpty
                        ? baseUrl + extractedPath
                        : '',
                    width: 48,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.generalJobTitle!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            job.applicationDeadline!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.place_outlined,
                            size: 18,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            job.detailedLocation!,
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.card_travel_rounded,
                            size: 18,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            job.enrollmentStatus!,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 3),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        bool isSuccess;
                        if (isSaved) {
                          isSuccess = await RemoveIdPostSave(job.id!);
                        } else {
                          isSuccess = await SendIdPostSave(job.id!);
                        }

                        if (isSuccess) {
                          setState(() {
                            if (isSaved) {
                              savedPosts.remove(job.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Removed from saved posts'),
                                ),
                              );
                            } else {
                              savedPosts.add(job.id!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Added to saved posts successfully!'),
                                ),
                              );
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Failed to add to saved posts. Please try again.'),
                            ),
                          );
                        }
                      },
                      child: Icon(
                        isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border_rounded,
                        color: isSaved ? AppColor.primaryColor : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget setupError() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: Text('Error loading data.'),
      ),
    );
  }
}
