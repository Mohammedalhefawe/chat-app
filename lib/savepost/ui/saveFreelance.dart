
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


import '../../add/widget/shared_preferences.dart';
import '../../core/routing/routes.dart';
import '../../my_widgets/headline_widget.dart';
import '../../networking/api_constants.dart';
import '../logic/save_cubit.dart';
import '../logic/save_state.dart';
import '../models/save_model.dart';



class SaveFreelance extends StatefulWidget {
  @override
  State<SaveFreelance> createState() => _SaveFreelanceState();
}

class _SaveFreelanceState extends State<SaveFreelance> {
  @override
  void initState() {
    super.initState();
    context.read<SaveCubit>().getSpecializations();
  }

  String token = CachData.getData(key: 'access_token');
  Future<bool>DeletePost(int id) async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('DELETE', Uri.parse('${ApiConstants.apiBaseUrl}wishlist/remove_post'));
    request.body = json.encode({
      "post_id": id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('truuuuuuuuuuuu');
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print('falseeeeeeee');
      print(response.reasonPhrase);
      return false;
    }

  }
  int? id;
  dynamic baseUrl = ApiConstants.Url;

  String extractPath(String fullPath) {
    var pathParts = fullPath.split('\\');
    return pathParts.sublist(pathParts.length - 1).join('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineWidget(title: "Saved Posts"),
      ),
      body: BlocConsumer<SaveCubit, SaveState>(
        listener: (context, state) {
          if (state is SpecializationsSuccess) {
            setState(() {});
          }
        },
        builder: (context, state) {
          var cubit = context.read<SaveCubit>();
          if (state is SpecializationsLoading ) {
            return setupLoading();
          } else if (state is SpecializationsSuccess) {
            return setupSuccess(state.responseModel.wishlistPosts.posts);
          } else {
            return setupError();
          }
        },
      ),
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupSuccess(List<List<WishlistPost>> specializationsLists) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: specializationsLists.length,
        itemBuilder: (context, outerIndex) {
          final specializationsList = specializationsLists[outerIndex];
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemCount: specializationsList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final freelance = specializationsList[index];
              var extractedPath = extractPath(freelance.profilePhoto ?? '');

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.detailsavefreelance,
                    arguments: {
                      'profile_photo': freelance.profilePhoto,
                      'phone_number': freelance.phoneNumber,
                      'location': freelance.location,
                      'general_job_title': freelance.generalJobTitle,
                      'specialization': freelance.specialization,
                      'earnings': freelance.earnings,
                      'job_information': freelance.jobInformation,
                      'requirements': freelance.requirements,
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
                        child: freelance.profilePhoto != null && freelance.profilePhoto!.isNotEmpty
                            ? Image.network(
                          baseUrl + extractedPath,
                          width: 48,
                          height: 48,
                        )
                            : SizedBox(width: 48, height: 48),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              freelance.generalJobTitle ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  freelance.applicationDeadline ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                    freelance.phoneNumber!,
                                    style: TextStyle(
                                      // Theme.of(context).textTheme.titleMedium,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                // const SizedBox(width: 5),
                                // // const Icon(
                                // //   Icons.card_travel_rounded,
                                // //   size: 20,
                                // // ),
                                const SizedBox(width: 12),
                                Text(
                                    freelance.specialization!,
                                    style: TextStyle(
                                      // Theme.of(context).textTheme.titleMedium,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    )

                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                      const SizedBox(width: 3),
                      GestureDetector(
                        onTap: () async {
                          bool isDeleted = await DeletePost(freelance.id!);
                          if (isDeleted) {
                            setState(() {
                              specializationsList.removeAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Deleted from saved posts successfully!'),
                                ),
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to delete from saved posts. Please try again.'),
                              ),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget setupError() {
    return const Center(
      child: Text('Error loading data.'),
    );
  }
}
