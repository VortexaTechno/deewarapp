part of 'shop_bloc.dart';

@immutable

abstract class ShopEvent   extends Equatable {
  const ShopEvent();
}

class  GetShopPackageEvent extends ShopEvent {
  GetShopPackageEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class  GetMinePackageEvent extends ShopEvent {
  GetMinePackageEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class  SelectItemEvent extends ShopEvent {
  ItemsModel Item;
  SelectItemEvent({required this.Item});
  @override
  // TODO: implement props
  List<Object?> get props => [Item];
}


class  ByeItemEvent extends ShopEvent {
  ByeItemEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  SendItemEvent extends ShopEvent {
  final id;
  SendItemEvent({this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class  WearItemEvent extends ShopEvent {
  SalesModel sales;
  WearItemEvent({required this.sales});
  @override
  // TODO: implement props
  List<Object?> get props => [sales];
}
class  UnWearItemEvent extends ShopEvent {
  SalesModel sales;
  UnWearItemEvent({required this.sales});
  @override
  // TODO: implement props
  List<Object?> get props => [sales];
}
