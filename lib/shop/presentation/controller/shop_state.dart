part of 'shop_bloc.dart';

@immutable

class ShopState extends Equatable{
  final List<PackageModel> ShopPackages;
  final List<SalesPackageModel> MinePackages;


  final ItemsModel ?SelectedItem;
  final RequestState GetShopState;
  final RequestState GetMineState;
  final RequestState BuyItemState;
  final RequestState WearMineState;
  ShopState({
    this.ShopPackages=const [],
    this.MinePackages=const [],
    this.SelectedItem,
    this.GetShopState=RequestState.loaded,
    this.BuyItemState=RequestState.loaded,
    this.GetMineState=RequestState.loaded,
    this.WearMineState=RequestState.loaded
  });
  ShopState copyWith({
    List<PackageModel>? ShopPackages,
    List<SalesPackageModel>? MinePackages,

    ItemsModel ?SelectedItem,
    RequestState ?GetShopState,
    RequestState ?BuyItemState,
    RequestState ?GetMineState,

    RequestState ? WearMineState

  }) {
    return ShopState(
      ShopPackages:ShopPackages??this.ShopPackages,
      SelectedItem:  SelectedItem??this.SelectedItem,
      GetShopState: GetShopState??this.GetShopState,
      BuyItemState: BuyItemState??this.BuyItemState,
      MinePackages: MinePackages??this.MinePackages,
      GetMineState: GetMineState??this.GetMineState,
      WearMineState: WearMineState??this.WearMineState

    );
  }


  List<Object?> get props => [
    ShopPackages,
    SelectedItem,
    GetShopState,
    BuyItemState,
    GetMineState,
    MinePackages ,
    WearMineState
  ];
}

