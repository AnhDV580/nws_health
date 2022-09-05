import 'package:equatable/equatable.dart';

class ArrayResponse<T> extends Equatable {
  final int page;
  final int pageSize;
  final int totalPages;
  final String returnCode;
  final List<T> data;

  bool get isSuccess {
    return returnCode == "10000";
  }

  ArrayResponse({
    this.page,
    this.pageSize,
    this.totalPages,
    this.returnCode,
    this.data,
  });

  ArrayResponse<T> copyWith({
    int page,
    int pageSize,
    int total,
    int totalPages,
    String returnCode,
    List<T> data,
  }) =>
      ArrayResponse<T>(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        totalPages: totalPages ?? this.totalPages,
        returnCode: returnCode ?? this.returnCode,
        data: data ?? this.data,
      );

  factory ArrayResponse.fromJson(Map<String, dynamic> json) {
    ArrayResponse<T> resultGeneric = ArrayResponse<T>(
      page: json['page'] as int ?? 1,
      pageSize: json['page_size'] as int ?? 1,
      totalPages: json['total_pages'] as int ?? 1,
      returnCode: json['returnCode'] as String ?? '',
    );
    if (json['data'] != null) {
      if (json['data'] is String) {
        return resultGeneric.copyWith(
          data: null,
        );
      } else if (json['data'] is List) {
        return resultGeneric.copyWith(
          data:
              (json['data'] as List)?.map((e) => _objectToFrom<T>(e))?.toList(),
        );
      }
    }
    return resultGeneric;
  }

  static T _objectToFrom<T>(json) {
    switch (T.toString()) {
      default:
        return json as T;
    }
  }

  @override
  List<Object> get props => [
        page,
        pageSize,
        totalPages,
        returnCode,
        data,
      ];
}
