class JWTPayload {
  String? type;
  String? token;
  String? refreshToken;

  JWTPayload({this.type, this.token, this.refreshToken});

  JWTPayload.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
