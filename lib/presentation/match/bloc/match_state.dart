// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'match_bloc.dart';

enum MatchStateEnum {
  initial,
  loading,
  success,
  error,
}

@immutable
class MatchState {
  final MatchStateEnum status;
  final List<AllMatchVo>? allMatchs;
  final List<LiveMatchVo>? liveMatchs;
  final List<AllMatchVo>? upcommingMatchs;
  final String? error;

  const MatchState({
    this.status = MatchStateEnum.initial,
    this.allMatchs,
    this.liveMatchs,
    this.upcommingMatchs,
    this.error,
  });

  MatchState copyWith({
    MatchStateEnum? status,
    List<AllMatchVo>? allMatchs,
    List<LiveMatchVo>? liveMatchs,
    List<AllMatchVo>? upcommingMatchs,
    String? error,
  }) {
    return MatchState(
      status: status ?? this.status,
      allMatchs: allMatchs ?? this.allMatchs,
      liveMatchs: liveMatchs ?? this.liveMatchs,
      upcommingMatchs: upcommingMatchs ?? this.upcommingMatchs,
      error: error ?? this.error,
    );
  }
}
