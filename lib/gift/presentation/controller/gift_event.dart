part of 'gift_bloc.dart';

@immutable

abstract class GiftEvent  extends Equatable {

  const GiftEvent();

}


class GetGiftsEvent extends GiftEvent {



  GetGiftsEvent( );
  @override
  List<Object?> get props => [];
}

class SelectGiftEvent extends GiftEvent {

GiftModel Gift;

SelectGiftEvent({required this.Gift} );
  @override
  List<Object?> get props => [Gift];
}

class SelectUserEvent extends GiftEvent {

  UserModel User;

  SelectUserEvent({required this.User} );
  @override
  List<Object?> get props => [User];
}

class SelectNumEvent extends GiftEvent {

  String Num;

  SelectNumEvent({required this.Num} );
  @override
  List<Object?> get props => [Num];
}

class SendGiftEvent extends GiftEvent {



  SendGiftEvent(  );
  @override
  List<Object?> get props => [ ];
}