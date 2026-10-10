import 'package:ahlachat/core/network/succes_message_room_model.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';

class GetRoomConstUseCase{
  final BaseRoomRepository basereroomRepository;
  GetRoomConstUseCase(this.basereroomRepository);
  Future<Either<SuccesMessageRoomModel, SuccesMessageRoomModel>>  GetRoomConst()async{
    return await basereroomRepository.GetRoomConst();
  }
}