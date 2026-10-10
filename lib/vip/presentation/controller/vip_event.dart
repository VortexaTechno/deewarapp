part of 'vip_bloc.dart';

@immutable

abstract class VipEvent  extends Equatable {

  const VipEvent();

}

class  GetVipShopEvent extends VipEvent {
  GetVipShopEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  BuyVipEvent extends VipEvent {
  VipModel vip;
  BuyVipEvent({required this.vip});
  @override
  // TODO: implement props
  List<Object?> get props => [vip];
}

class  UseVipEvent extends VipEvent {
  VipSalesModel Sales;
  UseVipEvent({required this.Sales});
  @override
  // TODO: implement props
  List<Object?> get props => [Sales];
}

class  RemoveVipEvent extends VipEvent {
  VipSalesModel Sales;
  RemoveVipEvent({required this.Sales});
  @override
  // TODO: implement props
  List<Object?> get props => [Sales];
}