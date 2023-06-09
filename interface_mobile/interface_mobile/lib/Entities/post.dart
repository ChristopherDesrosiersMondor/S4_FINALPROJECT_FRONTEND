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
    if (json['postUpvote'] == null) {
      json['postUpvote'] = 0;
    }
    if (json['postDownvote'] == null) {
      json['postDownvote'] = 0;
    }
        if (json['postIdCom'] == null) {
      json['postIdCom'] = 0;
    }
    return Post(
        id: json['id'] as int,
        postTitle: json['postTitle'] as String,
        postContent: json['postContent'] as String,
        postSource: json['postSource'] as String,
        postDate: json['postDate'] as String,
        postUpVote: json['postUpvote'] as int,
        postDownVote: json['postDownvote'] as int,
        postIdUser: json['postIdUser'] as int,
        postIdCom: json['postIdCom'] as int);
  }
}
