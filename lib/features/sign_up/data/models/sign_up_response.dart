import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  @JsonKey(name: 'status')
  String? Nstatus;

  SignupResponse({this.message,  this.Nstatus});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}





