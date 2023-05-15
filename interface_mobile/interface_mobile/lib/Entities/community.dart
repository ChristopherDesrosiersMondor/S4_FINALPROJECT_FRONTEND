class Community {
  final int id;
  final String communityName;
  final String communityDescription;
  final String communityLogo;
  final String communityHeaderImage;
  final DateTime communityCreatedOnDate;
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
}