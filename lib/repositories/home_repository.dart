import 'package:acote_task/models/user_model.dart';
import 'package:acote_task/services/acote_api_service.dart';
import 'package:flutter/material.dart';

class HomeRepository {
  final AcoteApiService acoteApiService;

  HomeRepository({required this.acoteApiService});

  Future<List<UserModel>> getUserLists(
      {required int since, int perPage = 30}) async {
    final List<UserModel> userLists = await acoteApiService.get<UserModel>(
        '/users?since=$since&per_page=$perPage', UserModel.fromJson);
    debugPrint('################ user : $userLists');
    return userLists;
  }
}
