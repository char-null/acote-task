import 'package:acote_task/viewmodels/detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailView extends ConsumerWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserDetailList = ref.watch(detailViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: asyncUserDetailList.when(
          data: (userDetailList) {
            return ListView.builder(
              itemCount: userDetailList.length,
              itemBuilder: (context, index) {
                final userDetail = userDetailList[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.w,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        userDetail.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      userDetail.description == null
                          ? const SizedBox()
                          : Text(userDetail.description!),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_border_rounded,
                                color: Colors.grey,
                                size: 20.w,
                              ),
                              Text(
                                userDetail.stargazersCount.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            userDetail.language ?? '',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                    ],
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text('에러가 발생했어요 $error'),
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
