import 'package:catatan/app/helper/local_db.dart';
import 'package:catatan/app/helper/user_model.dart';
import 'package:get/get.dart';

class RegisterRepository extends GetConnect {
  final DatabaseService _databaseService = DatabaseService();
  Future<bool> register(
      {required String email, required String password}) async {
    final newUser = {
      'username': email,
      'password': password,
    };

    final response =
        await _databaseService.insertUser(UserModel.fromJson(newUser));
    print("res : " + response.toString());

    if (response == 0) {
      return false;
    } else {
      return true;
    }
  }

  // Future<List<MovieModel>?> searchMovie({required String query}) async {
  //   final response = await get(ApiConstants.supplierList +
  //       '?api_key=${ApiConstants.apiKey}&query=$query');
  //   log('RES SEARCH: ${response.body["results"]}');

  //   if (response.status.hasError) {
  //     return null;
  //   } else {
  //     final data = <MovieModel>[];
  //     for (var i = 0; i < response.body['results'].length; i++) {
  //       // log('data : ${response.body['results'][i]}');
  //       data.add(MovieModel.fromJson(response.body['results'][i]));
  //     }

  //     return data;
  //   }
  // }
}
