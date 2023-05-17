import 'dart:ffi';

class Post {
  final Long id;
  final String postTitle;
  final String postContent;
  final String postSource;
  final DateTime postDate;
  final int postUpVote;
  final int postDownVote;
  final Long postIdUser;
  final int postIdCom;

  const Post(
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
    return Post(
        id: json['id'],
        postTitle: json['postTitle'],
        postContent: json['postContent'],
        postSource: json['postSource'],
        postDate: json['postDate'],
        postUpVote: json['postUpVote'],
        postDownVote: json['postDownVote'],
        postIdUser: json['postIdUser'],
        postIdCom: json['postIdCom']);
  }
}
