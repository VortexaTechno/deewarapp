

import 'package:ahlachat/svga/data/datasource/svga_remote_data_source.dart';
import 'package:ahlachat/svga/domin/repository/base_Svga_repository.dart';

class SvgaRepository extends BaseSvgaRepository {
  final BaseSvgaRemoteDataSource baseSvgaRemoteDataSource;

  SvgaRepository(this.baseSvgaRemoteDataSource);


}
