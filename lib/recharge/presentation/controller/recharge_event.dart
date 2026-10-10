part of 'recharge_bloc.dart';

@immutable
abstract class RechargeEvent   extends Equatable {

  const RechargeEvent();

}

class  ChangeInputEvent extends RechargeEvent {
  int value;
  ChangeInputEvent({required this.value});
  @override
  // TODO: implement props
  List<Object?> get props => [value];
}

class  ExchangeDiamondEvent extends RechargeEvent {

  ExchangeDiamondEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  SelectDateSearch extends RechargeEvent {

  SelectDateSearch();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  SearchRecharge extends RechargeEvent {

  SearchRecharge();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class  SearchExchange extends RechargeEvent {

  SearchExchange();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}