/* import 'package:arosa_je/core/data/sources/remote/advices/api_advices.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../common/mocked_classes.dart';

void main() {
  late ApiAdvices sut;

  late MockClient innerClient;
  late MockSessionManager sessionManager;
  late MockResponse response;

  late String endpoint;
  late String fakeBaseurl;
  late Uri uri;

  setUpAll(() {});

  setUp(() {
    innerClient = MockClient();
    sessionManager = MockSessionManager();
    response = MockResponse();

    fakeBaseurl = 'https://www.fake_url.com';

    sut = ApiAdvices(
      innerClient: innerClient,
      sessionManager: sessionManager,
    );
  });

  tearDown(() {});

/*   group('getAllAdvices methode tests', () {
    test('is get called', () async {
      endpoint = '/api/Advices';
      uri = Uri.parse('$fakeBaseurl$endpoint');
      when(() => response.statusCode).thenReturn(HttpStatus.ok);
      when(() => response.body).thenReturn(getJson(Jsons.advicesResponse));
      when(() => innerClient.get(uri))
          .thenAnswer((invocation) => Future(() => response));

      await sut.getAllAdvices();

      verify(() => innerClient.get(uri)).called(1);
    });

    test('is right instance returned', () async {
      endpoint = '/api/Advices';
      uri = Uri.parse('$fakeBaseurl$endpoint');
      String idUser = "admin";
      String name = "name";
      when(() => response.statusCode).thenReturn(HttpStatus.ok);
      when(() => response.body).thenReturn(getJson(Jsons.advicesResponse));
      when(() => innerClient.get(uri))
          .thenAnswer((invocation) => Future(() => response));

      final result = await sut.getAllAdvices();

      expect(result!.totalItems, 3);
      expect(result.advices![0].id, idUser);
      expect(result.advices![0].name, name);
    });
  }); */
}
 */