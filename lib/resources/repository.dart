
import 'package:crossroads_test/dao/commit_history.dart';
import 'package:crossroads_test/dao/commit_response.dart';
import 'package:dio/dio.dart';
import 'package:crossroads_test/utils/config.dart';

class GithubApiProvider {
  Dio dio = Dio();

  Future<CommitResponse> fetchGithubCommitHistory() async {
    var response;
      response = await dio.get(Config.getCommitsUrl());

    if (response.statusCode == 200) {
      return CommitResponse.fromJson(response.data);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}

