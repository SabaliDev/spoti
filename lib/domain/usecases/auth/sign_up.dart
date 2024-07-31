import 'package:dartz/dartz.dart';
import 'package:spoti/core/usecase/usecase.dart';
import 'package:spoti/data/models/auth/create_user_req.dart';
import 'package:spoti/domain/repository/auth/auth.dart';
import 'package:spoti/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
