part of 'recharge_bloc.dart';

@immutable


class RechargeState extends Equatable{
 final int  InputValue;
 final RequestState ExchangeStatus;
 final String? SelectedDate;
 final List<RechargeModel> RechargeHistory;
 final List<ExchangeModel> ExchangeHistory;
 final RequestState RechargeHistoryStatus;
 final RequestState ExchangeHistoryStatus;
 RechargeState({
    this.InputValue=0,
   this.ExchangeStatus=RequestState.loaded,
   this.RechargeHistoryStatus=RequestState.loaded,
   this.ExchangeHistoryStatus=RequestState.loaded,
   this.SelectedDate=null,
   this.RechargeHistory=const [],
   this.ExchangeHistory=const []

  });
 RechargeState copyWith({
    int ? InputValue,
   RequestState ? ExchangeStatus,
   RequestState ? RechargeHistoryStatus,
   RequestState ? ExchangeHistoryStatus,
   String? SelectedDate,
   List<RechargeModel> ?RechargeHistory,
   List<ExchangeModel> ?ExchangeHistory,


  }) {
    return RechargeState(
   InputValue: InputValue??this.InputValue,
   ExchangeStatus: ExchangeStatus??this.ExchangeStatus,
   SelectedDate: SelectedDate??this.SelectedDate,
   RechargeHistory: RechargeHistory??this.RechargeHistory,
   RechargeHistoryStatus :RechargeHistoryStatus??this.RechargeHistoryStatus,
    ExchangeHistoryStatus: ExchangeHistoryStatus??this.ExchangeHistoryStatus,
      ExchangeHistory: ExchangeHistory??this.ExchangeHistory
    );
  }


  List<Object?> get props => [
    InputValue,
    ExchangeStatus,
    SelectedDate,
    RechargeHistory,
    ExchangeHistoryStatus,
    RechargeHistoryStatus,
    ExchangeHistory



  ];
}

