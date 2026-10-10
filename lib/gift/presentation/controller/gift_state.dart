part of 'gift_bloc.dart';

@immutable

class GiftState extends Equatable {

  final RequestState GetGiftsState;
  final RequestState SendGiftsState;
  final List<GiftCategoryModel> Gifts;
  final GiftModel? SelectedGift;
  final UserModel? SelectedUser;
  final String? SelectedNum;
  const GiftState({
    this.GetGiftsState=RequestState.loaded,
    this.SendGiftsState=RequestState.loaded,
    this.Gifts=const [],
    this.SelectedGift=null,
    this.SelectedUser=null,
    this.SelectedNum='1',

  });

  GiftState copyWith({
    RequestState ?GetGiftsState,
    RequestState ?SendGiftsState,
    List<GiftCategoryModel>? Gifts,
    GiftModel? SelectedGift,
    UserModel ?SelectedUser,
    String?SelectedNum,
  }) {
    return GiftState(
        GetGiftsState: GetGiftsState??this.GetGiftsState,
        Gifts: Gifts??this.Gifts,
        SelectedGift: SelectedGift??this.SelectedGift,
      SelectedUser: SelectedUser??this.SelectedUser,
      SelectedNum: SelectedNum??this.SelectedNum,
      SendGiftsState: SendGiftsState??this.SendGiftsState
    );
  }

  @override
  List<Object?> get props => [

    GetGiftsState,
    Gifts,
    SelectedGift,
    SelectedUser,
    SelectedNum,
    SendGiftsState

  ];
}