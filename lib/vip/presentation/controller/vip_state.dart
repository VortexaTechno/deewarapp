part of 'vip_bloc.dart';
@immutable
class VipState extends Equatable{
  final List<VipModel> VipShopPackages;
  final List<VipSalesModel> VipSales;

  final RequestState GetVipShopState;
  final RequestState ByeVipState;
  final RequestState UseVipStatus;
  final RequestState RemoveVipStatus;
  VipState({
    this.VipShopPackages=const [],
    this.VipSales=const [],
      this.UseVipStatus=RequestState.loaded,
    this.ByeVipState=RequestState.loaded,
    this.GetVipShopState=RequestState.loaded,
    this.RemoveVipStatus=RequestState.loaded,
  });
  VipState copyWith({
    List<VipSalesModel>? VipSales,
    List<VipModel>? VipShopPackages,
    RequestState ? GetVipShopState,
    RequestState ? ByeVipState,
    RequestState ? UseVipStatus,
    RequestState ?  RemoveVipStatus
  }) {
    return VipState(
      VipShopPackages: VipShopPackages??this.VipShopPackages,
        GetVipShopState:GetVipShopState??this.GetVipShopState,
      ByeVipState: ByeVipState??this.ByeVipState,
      VipSales: VipSales??this.VipSales,
      UseVipStatus: UseVipStatus??this.UseVipStatus,
      RemoveVipStatus: RemoveVipStatus??this.RemoveVipStatus,

    );
  }


  List<Object?> get props => [
    GetVipShopState,
    VipShopPackages,
    ByeVipState,
    VipSales,
    UseVipStatus,
    RemoveVipStatus


  ];
}

