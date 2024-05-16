import 'package:arosa_je/core/data/repositories/auth/login/login_repository.dart';
import 'package:arosa_je/core/data/repositories/auth/register/register_repository.dart';
import 'package:arosa_je/core/data/sources/remote/advices/api_advices.dart';
import 'package:arosa_je/core/data/sources/remote/plants/api_plants.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

class MockResponse extends Mock implements Response {}

class MockSessionManager extends Mock implements SessionManager {}

class MockApiAdvices extends Mock implements ApiAdvices {}

class MockApiAddPlants extends Mock implements ApiPlants {}

class MockLoginRepository extends Mock implements LoginRepository {}

class MockRegisterRepository extends Mock implements RegisterRepository {}
