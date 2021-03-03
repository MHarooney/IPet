import 'package:ipet/data/in_memory_products.dart';
import 'package:ipet/domain/exception/auth_exception.dart';
import 'package:ipet/domain/model/product.dart';
import 'package:ipet/domain/model/user.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/domain/request/login_request.dart';
import 'package:ipet/domain/response/login_response.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
        name: 'Mahmoud AlHaroon',
        username: 'mahmoudalharoon',
        image: 'assets/images/harooney.jpeg',
      );
    } else if (token == 'AA222') {
      return User(
        name: 'Elon Musk',
        username: 'elonmusk',
        image: 'assets/delivery/users/elonmusk.jpeg',
      );
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'mahmoud' && login.password == 'alharoon') {
      return LoginResponse(
        'AA111',
        User(
          name: 'Mahmoud AlHaroon',
          username: 'mahmoudalharoon',
          image: 'assets/images/harooney.jpeg',
        ),
      );
    }
    if (login.username == 'elon' && login.password == 'musk') {
      return LoginResponse(
        'AA222',
        User(
          name: 'Elon Musk',
          username: 'elonmusk',
          image: 'assets/delivery/users/elonmusk.jpeg',
        ),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server :$token');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
