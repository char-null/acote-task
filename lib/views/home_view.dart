import 'package:acote_task/models/user_model.dart';
import 'package:acote_task/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserLists = ref.watch(homeViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: asyncUserLists.when(
          data: (userLists) {
            final itemLists =
                ref.read(homeViewModelProvider.notifier).insertAds(userLists);
            return ListView.builder(
              itemCount: itemLists.length,
              itemBuilder: (context, index) {
                final item = itemLists[index];
                if (item is UserModel) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.w,
                            backgroundImage: NetworkImage(item.avatarUrl),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            item.login,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {},
                    child:
                        Image.network('https://placehold.it/500x100?text=ad'),
                  );
                }
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
