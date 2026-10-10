part of 'svga_bloc.dart';

@immutable

class SvgaState extends Equatable {

  final RequestState GeGiftsState;
  final List<UserModel> Entries;
  const SvgaState({
    this.GeGiftsState=RequestState.loaded,
    this.Entries=const []

  });

  SvgaState copyWith({
    RequestState ?GeGiftsState,
    List<UserModel>? Entries,
  }) {
    return SvgaState(
      GeGiftsState: GeGiftsState??this.GeGiftsState,
      Entries: Entries??this.Entries
    );
  }

  @override
  List<Object?> get props => [

    GeGiftsState,
    Entries

  ];
}