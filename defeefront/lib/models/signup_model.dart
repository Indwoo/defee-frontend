class SignupModel {
  final String email;
  final String code;
  final String username;
  final String password;
  final String? blogUrl;

  SignupModel({
    required this.email,
    required this.code,
    required this.username,
    required this.password,
    this.blogUrl,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
        'username': username,
        'password': password,
        if (blogUrl != null) 'blogUrl': blogUrl,
      };

  // SignupModel.fromJson 함수는 json 데이터를 받아서 SignupModel 객체를 생성합니다.
  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json['email'],
        code: json['code'],
        username: json['username'],
        password: json['password'],
        blogUrl: json['blogUrl'],
      );
}
