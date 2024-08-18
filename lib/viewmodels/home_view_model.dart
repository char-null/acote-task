import 'package:acote_task/constants/constants.dart';
import 'package:acote_task/models/user_model.dart';
import 'package:acote_task/repositories/home_repository.dart';
import 'package:acote_task/services/acote_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<List<UserModel>> build() {
    return getUserLists();
  }

  Future<List<UserModel>> getUserLists() async {
    final homeRepository = HomeRepository(acoteApiService: AcoteApiService());
    return await homeRepository.getUserLists(since: 0);
  }

  // 기존 userList에 광고 삽입
  List<dynamic> insertAds(List<UserModel> users) {
    List<dynamic> itemLists = [];
    for (int i = 0; i < users.length; i++) {
      itemLists.add(users[i]);
      if ((i + 1) % 10 == 0) {
        itemLists.add('ad');
      }
    }
    return itemLists;
  }

  Future<void> loadMore() async {
    final isLoading = ref.read(isLoadingProvider);
    if (isLoading) {
      final homeRepository = HomeRepository(acoteApiService: AcoteApiService());
      final newUserList =
          await homeRepository.getUserLists(since: state.requireValue.last.id);
      state = AsyncValue.data([...state.value!, ...newUserList]);
    }
    ref.read(isLoadingProvider.notifier).isCompleted();
  }

  Future<void> clickAd() async {
    if (!await launchUrl(Uri.parse(adLink))) {
      throw Exception('Could not launch url');
    }
  }
}

@riverpod
class IsLoading extends _$IsLoading {
  @override
  bool build() {
    return false;
  }

  isLoading() {
    state = true;
  }

  isCompleted() {
    state = false;
  }
}

@riverpod
class UserLogin extends _$UserLogin {
  @override
  String build() {
    return '';
  }

  void getUserLogin(String login) {
    state = login;
  }
}
