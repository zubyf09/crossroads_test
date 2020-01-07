
import 'package:crossroads_test/dao/commit_history.dart';
import 'package:dio/dio.dart';
import 'package:crossroads_test/utils/config.dart';

class GithubApiProvider {
  Dio dio = Dio();

  Future<CommitHistory> fetchGithubCommitHistory() async {
    var response;
      response = await dio.get(Config.getCommitsUrl());

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CommitHistory.fromJson(response);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}

