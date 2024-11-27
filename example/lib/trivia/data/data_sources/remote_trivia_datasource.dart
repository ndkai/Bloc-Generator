import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/exceptions.dart';
import '../models/network_trivia.dart';

abstract class RemoteTriviaDatasource{
  Future<NetworkTrivia> getTrivia(int number);
}

@Injectable(as: RemoteTriviaDatasource)
class RemoteTriviaDatasourceImpl implements RemoteTriviaDatasource{

  @FactoryMethod(preResolve: true)
  @override
  Future<NetworkTrivia> getTrivia(@factoryParam int number) async {
      try{
        final response = await Dio().get("https://opentdb.com/api.php?amount=${number}");
        return NetworkTrivia.fromJson(response.data);
      } catch(e){
        throw ServerException();
      }
  }

}