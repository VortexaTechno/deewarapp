part of 'roomchat_bloc.dart';


@immutable




class RoomchatState extends Equatable {
  final RequestState SendChatState;
  final RequestState GetInboxState;
  final List<ChatModel> ChatList;
  final List<InboxRoomModel> InboxRoomMs;


  const RoomchatState({
    this.ChatList=const [],
    this.InboxRoomMs=const [],

    this.SendChatState = RequestState.loaded,
    this.GetInboxState= RequestState.loaded,

  });

  RoomchatState copyWith({
    RequestState? SendChatState,
    RequestState?  GetInboxState,
    List<ChatModel>? ChatList,
    List<InboxRoomModel>? InboxRoomMs,


  }) {
    return RoomchatState(
        ChatList: ChatList??this.ChatList,
      InboxRoomMs:    InboxRoomMs??this.InboxRoomMs,
      SendChatState: SendChatState??this.SendChatState,
        GetInboxState: GetInboxState??this.GetInboxState
    );
  }

  @override
  List<Object?> get props => [
    SendChatState,
    ChatList,
    GetInboxState,InboxRoomMs

  ];
}
