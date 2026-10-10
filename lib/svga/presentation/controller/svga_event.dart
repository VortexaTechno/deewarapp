part of 'svga_bloc.dart';

@immutable

abstract class SvgaEvent  extends Equatable {

  const SvgaEvent();

}


class ShowRoomEntryEvent extends SvgaEvent {

   UserModel user;

  ShowRoomEntryEvent({required this.user});
  @override
  List<Object?> get props => [user];
}