
import 'package:ahlachat/core/network/succes_message_gifts_model.dart';
import 'package:ahlachat/core/network/succes_message_leaderboard_model.dart';
import 'package:ahlachat/core/network/succes_message_level_model.dart';
import 'package:ahlachat/core/network/succes_message_medal_model.dart';
import 'package:ahlachat/core/network/succes_message_model.dart';
import 'package:ahlachat/core/network/succes_message_users_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseleaderboardRepository {
 Future<Either<SuccesMessageleaderboardModel, SuccesMessageleaderboardModel>> GetDaileleaderboard();
 Future<Either<SuccesMessageleaderboardModel, SuccesMessageleaderboardModel>> GetWeaklyleaderboard();


}
