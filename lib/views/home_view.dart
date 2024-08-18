import 'package:acote_task/models/user_model.dart';
import 'package:acote_task/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
          final isLoading = ref.read(isLoadingProvider);
          if (!isLoading) {
            ref.read(isLoadingProvider.notifier).isLoading();
            ref.read(homeViewModelProvider.notifier).loadMore();
          }
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncUserLists = ref.watch(homeViewModelProvider);
    ref.watch(isLoadingProvider);
    return SafeArea(
      child: Scaffold(
        body: asyncUserLists.when(
          data: (userLists) {
            final itemLists =
                ref.read(homeViewModelProvider.notifier).insertAds(userLists);
            return ListView.builder(
              controller: _scrollController,
              itemCount: itemLists.length,
              itemBuilder: (context, index) {
                final item = itemLists[index];
                if (item is UserModel) {
                  return _UserWidget(item: item);
                } else {
                  return const _AdWidget();
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

class _UserWidget extends StatelessWidget {
  final UserModel item;
  const _UserWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
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
  }
}

class _AdWidget extends StatelessWidget {
  const _AdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Image.network('https://placehold.it/500x100?text=ad'),
    );
  }
}
