// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_bloc.dart';

enum NewStateEnum {
  initial,
  loading,
  success,
  error,
}

@immutable
class NewState {
  final NewStateEnum status;
  final List<NewVo>? newlist;
  final String? message;

  const NewState({
    this.status = NewStateEnum.initial,
    this.newlist,
    this.message,
  });

  NewState copyWith({
    NewStateEnum? status,
    List<NewVo>? newlist,
    String? message,
  }) {
    return NewState(
      status: status ?? this.status,
      newlist: newlist ?? this.newlist,
      message: message ?? this.message,
    );
  }
}
