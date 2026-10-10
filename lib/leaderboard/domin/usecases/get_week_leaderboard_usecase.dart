
import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_leaderboard_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:ahlachat/gift/domin/repository/base_gift_repository.dart';
import 'package:ahlachat/leaderboard/domin/repository/base_leaderboard_repository.dart';
import 'package:ahlachat/profile/domin/repository/base_my_profile_repository.dart';
import 'package:dartz/dartz.dart';

class  GetweekleaderboardUseCase{
  final BaseleaderboardRepository baseMyProfileRepository;
  GetweekleaderboardUseCase(this.baseMyProfileRepository);
  Future<Either<SuccesMessageleaderboardModel,SuccesMessageleaderboardModel>> GetWeekleaderboard() async{
    return await baseMyProfileRepository.GetWeaklyleaderboard();
  }
}