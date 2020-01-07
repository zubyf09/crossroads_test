
class Config {



  static final String baseUrl = "https://api.github.com";
  static final String commithistoryUrl = "repos/google/oboe/commits";


  static String getCommitsUrl() {
    return   "https://api.github.com/repos/google/oboe/commits"; //"$baseUrl/$commithistoryUrl";zubyf09/crossroads_test
  }

}

