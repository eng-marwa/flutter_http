class QuoteResponse {
  List<Result> results = [];
  int? statusCode;
  String? statusMessage;

  QuoteResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      json['results'].forEach((e) => results.add(Result.fromJson(e)));
    }
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }
}

class Result {
  String author = '';
  String content = '';

  Result.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
  }
}
