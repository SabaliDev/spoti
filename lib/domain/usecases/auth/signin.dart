import 'package:dartz/dartz.dart';
import 'package:spoti/core/usecase/usecase.dart';
import 'package:spoti/data/models/auth/signin_user_req.dart';

import 'package:spoti/domain/repository/auth/auth.dart';
import 'package:spoti/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
