import 'dart:ffi';

class Post {
  final Long postId;
  final String postTitle;
  final String postContent;
  final String postSource;
  final DateTime postDate;
  final int postUpVote;
  final int postDownVote;
  final Long postIdUser;
  final int postIdCom;

  const Post(
      {required this.postId,
      required this.postTitle,
      required this.postContent,
      required this.postSource,
      required this.postDate,
      required this.postUpVote,
      required this.postDownVote,
      required this.postIdUser,
      required this.postIdCom});
}
