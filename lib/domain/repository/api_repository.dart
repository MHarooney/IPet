import 'package:ipet/domain/model/product.dart';
import 'package:ipet/domain/model/user.dart';
import 'package:ipet/domain/request/login_request.dart';
import 'package:ipet/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
