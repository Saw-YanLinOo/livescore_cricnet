part of 'match_bloc.dart';

@immutable
sealed class MatchEvent {}

class GetAllMatchEvent extends MatchEvent {}
class GetLiveMatchEvent extends MatchEvent {}

class GetUpCommingMatchEvent extends MatchEvent {}
