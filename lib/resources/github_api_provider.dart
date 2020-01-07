

import 'package:crossroads_test/dao/commit_history.dart';
import 'package:crossroads_test/resources/repository.dart';

class Repository {
  final githubApiProvider = GithubApiProvider();

  Future<CommitHistory> fetchAllCommit() => githubApiProvider.fetchGithubCommitHistory();


}

