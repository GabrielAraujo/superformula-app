import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:superformula/core/errors/exceptions.dart';
import 'package:superformula/features/generate/data/datasources/seed_remote_data_source.dart';
import 'package:superformula/features/generate/data/models/seed_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  SeedRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('seed.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = SeedRemoteDataSourceImpl(client: mockHttpClient);
  });

  group(
    'getSeed',
    () {
      final tSeedModel = SeedModel.fromJson(json.decode(fixture('seed.json')));
      test(
        'should preform a GET request on a URL with number being the endpoint and with application/json header',
        () {
          //arrange
          setUpMockHttpClientSuccess200();
          // act
          dataSource.getSeed();
          // assert
          verify(mockHttpClient.get(
            'https://1sf9yp4tea.execute-api.us-east-1.amazonaws.com/dev/seed',
            headers: {'Content-Type': 'application/json'},
          ));
        },
      );

      test(
        'should return Seed when the response code is 200 (success)',
        () async {
          // arrange
          setUpMockHttpClientSuccess200();
          // act
          final result = await dataSource.getSeed();
          // assert
          expect(result, equals(tSeedModel));
        },
      );

      test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
          // arrange
          setUpMockHttpClientFailure404();
          // act
          final call = dataSource.getSeed;
          // assert
          expect(() => call(), throwsA(isA<ServerException>()));
        },
      );
    },
  );
}