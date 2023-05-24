import 'dart:ffi';

class Post {
  final int id;
  final String postTitle;
  final String postContent;
  final String postSource;
  final String postDate;
  final int postUpVote;
  final int postDownVote;
  final int postIdUser;
  final int postIdCom;
  String username = "";

  Post(
      {required this.id,
      required this.postTitle,
      required this.postContent,
      required this.postSource,
      required this.postDate,
      required this.postUpVote,
      required this.postDownVote,
      required this.postIdUser,
      required this.postIdCom});

  factory Post.fromJson(Map<String, dynamic> json) {
    if (json['postUpVote'] == null) {
      json['postUpVote'] = 0;
    }
    if (json['postDownVote'] == null) {
      json['postDownVote'] = 0;
    }
    return Post(
        id: json['id'] as int,
        postTitle: json['postTitle'] as String,
        postContent: json['postContent'] as String,
        postSource: json['postSource'] as String,
        postDate: json['postDate'] as String,
        postUpVote: json['postUpVote'] as int,
        postDownVote: json['postDownVote'] as int,
        postIdUser: json['postIdUser'] as int,
        postIdCom: json['postIdCom'] as int);
  }
}
