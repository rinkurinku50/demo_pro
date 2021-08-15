class LoginResponse {
  String? name;
  String? email;
  String? imageUrl;
  String? type;

  LoginResponse({this.name, this.email, this.imageUrl, this.type});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    imageUrl = json['image_url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['image_url'] = this.imageUrl;
    data['type'] = this.type;
    return data;
  }
}
