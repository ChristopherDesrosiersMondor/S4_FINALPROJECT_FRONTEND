class Community {
  final int id;
  final String communityName;
  final String communityDescription;
  final String communityLogo;
  final String communityHeaderImage;
  final String communityCreatedOnDate;
  final int communityAmmountOfMembers;
  final int communityAmmountOfPosts;
  final int communityCreatorId;

  const Community(
      {required this.id,
      required this.communityName,
      required this.communityDescription,
      required this.communityLogo,
      required this.communityHeaderImage,
      required this.communityCreatedOnDate,
      required this.communityAmmountOfMembers,
      required this.communityAmmountOfPosts,
      required this.communityCreatorId});

  factory Community.fromJson(Map<String, dynamic> json) {
    if (json['communityLogo'] == null) {
      json['communityLogo'] = "";
    }
    if (json['communityHeaderImage'] == null) {
      json['communityHeaderImage'] = "";
    }
    if (json['communityAmmountOfMembers'] == null) {
      json['communityAmmountOfMembers'] = 0;
    }
    if (json['communityAmmountOfPosts'] == null) {
      json['communityAmmountOfPosts'] = 0;
    }
        if (json['communityCreatorId'] == null) {
      json['communityCreatorId'] = 0;
    }
    return Community(
        id: json['id'],
        communityName: json['communityName'],
        communityDescription: json['communityDescription'],
        communityLogo: json['communityLogo'],
        communityHeaderImage: json['communityHeaderImage'],
        communityCreatedOnDate: json['communityCreatedOnDate'],
        communityAmmountOfMembers: json['communityAmmountOfMembers'],
        communityAmmountOfPosts: json['communityAmmountOfPosts'],
        communityCreatorId: json['communityCreatorId']);
  }
}
