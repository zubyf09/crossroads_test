
class Config {



  static final String baseUrl = "https://api.github.com";
  static final String commithistoryUrl = "/repos/google/oboe/commits";


  static String getCommitsUrl() {
    return   "$baseUrl/$commithistoryUrl";
  }

}

