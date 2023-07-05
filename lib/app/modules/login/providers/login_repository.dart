import 'package:catatan/app/helper/local_db.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository extends GetConnect {
  final DatabaseService _databaseService = DatabaseService();

  Future<bool> login({required String email, required String password}) async {
    final pref = await SharedPreferences.getInstance();
    final response = await _databaseService.login(email, password);
    print('RES : ${response}');

    if (response == null) {
      return false;
    } else {
      pref.setString('TOKEN', '1');

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
