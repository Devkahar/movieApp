class RequestTokenModel {
  final bool success;
  final String requestToken;
  final String expireAt;

  RequestTokenModel({
    required this.success,
    required this.requestToken,
    required this.expireAt,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      success: json['success'],
      requestToken: json['request_token'],
      expireAt: json['expire_at']??'',
    );
  }

  Map<String,dynamic> toJson()=>{
    'request_token': requestToken
  };
}
