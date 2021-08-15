class UnSplashResposne {
 String? id;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  Links? links;
  int? likes;
  bool? likedByUser;
  Sponsorship? sponsorship;
  Sponsor? user;

  UnSplashResposne(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.promotedAt,
      this.width,
      this.height,
      this.color,
      this.blurHash,
      this.description,
      this.altDescription,
      this.urls,
      this.links,
      this.likes,
      this.likedByUser,
      this.sponsorship,
      this.user});

  UnSplashResposne.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    sponsorship = json['sponsorship'] != null
        ? new Sponsorship.fromJson(json['sponsorship'])
        : null;
    user = json['user'] != null ? new Sponsor.fromJson(json['user']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promoted_at'] = this.promotedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls?.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links?.toJson();
    }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    if (this.sponsorship != null) {
      data['sponsorship'] = this.sponsorship?.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String?, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  Links.fromJson(Map<String?, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['download'] = this.download;
    data['download_location'] = this.downloadLocation;
    return data;
  }
}

class Sponsorship {
  String? tagline;
  String? taglineUrl;
  Sponsor? sponsor;

  Sponsorship({this.tagline, this.taglineUrl, this.sponsor});

  Sponsorship.fromJson(Map<String?, dynamic> json) {
    tagline = json['tagline'];
    taglineUrl = json['tagline_url'];
    sponsor =
        json['sponsor'] != null ? new Sponsor.fromJson(json['sponsor']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['tagline'] = this.tagline;
    data['tagline_url'] = this.taglineUrl;
    if (this.sponsor != null) {
      data['sponsor'] = this.sponsor?.toJson();
    }
    return data;
  }
}

class Sponsor {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  Links? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  Sponsor(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.links,
      this.profileImage,
      this.instagramUsername,
      this.totalCollections,
      this.totalLikes,
      this.totalPhotos,
      this.acceptedTos,
      this.forHire,
      this.social});

  Sponsor.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    if (this.links != null) {
      data['links'] = this.links?.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage?.toJson();
    }
    data['instagram_username'] = this.instagramUsername;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['accepted_tos'] = this.acceptedTos;
    data['for_hire'] = this.forHire;
    if (this.social != null) {
      data['social'] = this.social?.toJson();
    }
    return data;
  }
}


class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String?, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  String? paypalEmail;

  Social(
      {this.instagramUsername,
      this.portfolioUrl,
      this.twitterUsername,
      this.paypalEmail});

  Social.fromJson(Map<String?, dynamic> json) {
    instagramUsername = json['instagram_username'];
    portfolioUrl = json['portfolio_url'];
    twitterUsername = json['twitter_username'];
    paypalEmail = json['paypal_email'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['instagram_username'] = this.instagramUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['twitter_username'] = this.twitterUsername;
    data['paypal_email'] = this.paypalEmail;
    return data;
  }
}
