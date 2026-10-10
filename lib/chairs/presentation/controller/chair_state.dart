part of 'chair_bloc.dart';

@immutable

class ChairState extends Equatable {
  final RequestState ChangeChairStatus;
  final RequestState GetEmojeStatus;
  final RequestState JoinChairStatus;
  final List<Emojemodel> EmojeList;

  final List<UserModel> ChairhHosts;
  final  List<EmojeAssetModel> EmojeAsset;
  final RequestState EmojeStatus;
  const ChairState({
    this.ChangeChairStatus =RequestState.loaded,
    this.JoinChairStatus=RequestState.loaded,
    this.EmojeStatus=RequestState.loaded,
    this.GetEmojeStatus=RequestState.loaded,
    this.EmojeList=const [],
    this.EmojeAsset=const [],
   this.ChairhHosts=const []


  });

  ChairState copyWith({

    RequestState ?ChangeChairStatus,
    RequestState ?JoinChairStatus,
    RequestState ?EmojeStatus,
    List<Emojemodel>? EmojeList ,
    RequestState ?GetEmojeStatus,
    List<EmojeAssetModel>?  EmojeAsset,
    List<UserModel> ? ChairhHosts

  }) {
    return ChairState(
        ChangeChairStatus:  ChangeChairStatus??this.ChangeChairStatus,
      JoinChairStatus: JoinChairStatus??this.JoinChairStatus,
        EmojeStatus: EmojeStatus??this.EmojeStatus,
      EmojeList: EmojeList??this.EmojeList,
      EmojeAsset: EmojeAsset??this.EmojeAsset,
      GetEmojeStatus: GetEmojeStatus??this.GetEmojeStatus,
      ChairhHosts: ChairhHosts??this.ChairhHosts
    );
  }

  @override
  List<Object?> get props => [
    ChangeChairStatus,
    JoinChairStatus,
    EmojeStatus,
    EmojeList,
    EmojeAsset,
    GetEmojeStatus,ChairhHosts

  ];
}
