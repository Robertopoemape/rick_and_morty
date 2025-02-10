import 'package:equatable/equatable.dart';

class ErrorData extends Equatable {
  const ErrorData({
    required this.error,
  });

  final String error;

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}
