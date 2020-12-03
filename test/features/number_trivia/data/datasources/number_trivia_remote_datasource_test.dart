import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:matcher/matcher.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
  }

  void setUpMockHttpFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Algo de errado não está certo', 404));
  }

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel.fromJson(
      json.decode(
        fixture('trivia.json'),
      ),
    );
    test(
      '''deve fazer uma requisição GET na URL com o número 
      sendo o endpoint e com o Header application/json''',
      () async {
        // arrange
        setUpMockHttpSuccess200();
        // act
        dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        verify(
          mockHttpClient.get(
            'http://numbersapi.com/$tNumber',
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );
      },
    );

    test(
      'deve retornar um NumberTrivia quando o código da resposta for 200',
      () async {
        // arrange
        setUpMockHttpSuccess200();
        // act
        final result = await dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'deve retornar uma ServerException quando o código da resposta for um erro',
      () async {
        // arrange
        setUpMockHttpFailure404();
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

  group('getConcreteNumberTrivia', () {
    final tNumberTriviaModel = NumberTriviaModel.fromJson(
      json.decode(
        fixture('trivia.json'),
      ),
    );
    test(
      '''deve fazer uma requisição GET na URL com o número 
      sendo o endpoint e com o Header application/json''',
      () async {
        // arrange
        setUpMockHttpSuccess200();
        // act
        dataSource.getRandomNumberTrivia();
        // assert
        verify(
          mockHttpClient.get(
            'http://numbersapi.com/random',
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );
      },
    );

    test(
      'deve retornar um NumberTrivia quando o código da resposta for 200',
      () async {
        // arrange
        setUpMockHttpSuccess200();
        // act
        final result = await dataSource.getRandomNumberTrivia();
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'deve retornar uma ServerException quando o código da resposta for um erro',
      () async {
        // arrange
        setUpMockHttpFailure404();
        // act
        final call = dataSource.getRandomNumberTrivia;
        // assert
        expect(() => call(), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
