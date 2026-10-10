import 'package:ahlachat/core/network/succes_message_get_kicked_members_model.dart';
import 'package:ahlachat/core/network/succes_message_get_room_members_model.dart';
import 'package:ahlachat/core/network/succes_message_get_room_model.dart';
import 'package:ahlachat/core/network/succes_message_join_room_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_room_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/room/data/datasource/room_remote_data_source.dart';
import 'package:ahlachat/room/domin/repository/base_room_repository.dart';
import 'package:dartz/dartz.dart';
class RoomRepository extends BaseRoomRepository {
  final BaseRoomRemoteDataSource baseRoomRemoteDataSource;

  RoomRepository(this.baseRoomRemoteDataSource);

  @override
  Future<Either<SuccesMessageRoomModel, SuccesMessageRoomModel>> GetRoomConst()async {
    final result = await baseRoomRemoteDataSource.GetRoomConst();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageRoomsModel, SuccesMessageRoomsModel>> GetRooms() async{
    final result = await baseRoomRemoteDataSource.GetRooms();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> CheckVoiceRoom()async {
    final result = await baseRoomRemoteDataSource.CheckVoiceRoom();

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> JoinVoiceRoom({id}) async{
    final result = await baseRoomRemoteDataSource.JoinVoiceRoom(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageJoinRoomModel, SuccesMessageJoinRoomModel>> EnterVoiceRoomPassword({id, password})async {
    final result = await baseRoomRemoteDataSource.EnterPasswordVoiceRoom(id: id,Password: password);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> FollowRoom({id})async {
    final result = await baseRoomRemoteDataSource.FollowRoom(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnFollowRoom({id})async {
    final result = await baseRoomRemoteDataSource.UnFollowRoom(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> InviteToRoom({id,roomId})async {
    final result = await baseRoomRemoteDataSource.InviteToRoom(id: id,roomId:roomId );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdateRoomImage({required image})async {
    final result = await baseRoomRemoteDataSource.UpdateRoomImage( image:image );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdatebackgroundRoomImage({required image}) async{
    final result = await baseRoomRemoteDataSource.UpdatebackgroundRoomImage( image:image );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdateRoomName({required name}) async{
    final result = await baseRoomRemoteDataSource.Updateroomname( name:name );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UpdateRoomdescripe({required name})async {
    final result = await baseRoomRemoteDataSource.Updateroomdescripe( name:name );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> LeaveVoiceRoom({id}) async{
    final result = await baseRoomRemoteDataSource.LeaveVoiceRoom( id: id );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageRoomsMembersModel, SuccesMessageRoomsMembersModel>> GetMemberRooms() async{
    final result = await baseRoomRemoteDataSource.GetMemberRooms( );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageUsersModel, SuccesMessageUsersModel>> SearchMemberRooms({title}) async{
    final result = await baseRoomRemoteDataSource.SearchMemberRooms(title:  title);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> KickUserRooms({id}) async{
    final result = await baseRoomRemoteDataSource.KickUserRooms(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }


  @override
  Future<Either<SuccesMessageModel, SuccesMessageModel>> UnkickUserRooms({id})async {
    final result = await baseRoomRemoteDataSource.UnKickUserRooms(id: id);

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  @override
  Future<Either<SuccesMessageKickedMembersModel, SuccesMessageKickedMembersModel>> GetKickRooms() async{
    final result = await baseRoomRemoteDataSource.GetKickedUser( );

    if(result.statusCode==true){

      return Right(result);
    }
    else{
      return Left(result);
    }
  }

  }











