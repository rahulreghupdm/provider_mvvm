class Welcome {
  int? id;
  String? nickname;
  String? gravatarId;
  String? githubProfile;
  String? twitterProfile;
  int? contributionsCount;
  List<Organisations>? organisations;
  String? link;
  List<PullRequests>? pullRequests;

  Welcome(
      {this.id,
      this.nickname,
      this.gravatarId,
      this.githubProfile,
      this.twitterProfile,
      this.contributionsCount,
      this.organisations,
      this.link,
      this.pullRequests});

  Welcome.fromJson(dynamic json) {
    id = json['id'];
    nickname = json['nickname'];
    gravatarId = json['gravatar_id'];
    githubProfile = json['github_profile'];
    twitterProfile = json['twitter_profile'];
    contributionsCount = json['contributions_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['gravatar_id'] = this.gravatarId;
    data['github_profile'] = this.githubProfile;
    data['twitter_profile'] = this.twitterProfile;
    data['contributions_count'] = this.contributionsCount;
    if (this.organisations != null) {
      data['organisations'] =
          this.organisations?.map((v) => v.toJson()).toList();
    }
    data['link'] = this.link;
    if (this.pullRequests != null) {
      data['pull_requests'] =
          this.pullRequests?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organisations {
  String? login;
  String? avatarUrl;
  String? link;

  Organisations({this.login, this.avatarUrl, this.link});

  Organisations.fromJson(dynamic json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['link'] = this.link;
    return data;
  }
}

class PullRequests {
  String? title;
  String? issueUrl;
  String? repoName;
  String? body;
  String? createdAt;

  PullRequests(
      {this.title, this.issueUrl, this.repoName, this.body, this.createdAt});

  PullRequests.fromJson(dynamic json) {
    title = json['title'];
    issueUrl = json['issue_url'];
    repoName = json['repo_name'];
    body = json['body'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['issue_url'] = this.issueUrl;
    data['repo_name'] = this.repoName;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    return data;
  }
}
