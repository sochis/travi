import 'package:travi/core/exceptions/network_exception.dart';
import 'package:travi/core/network/api_result.dart';
import 'package:travi/features/map/domain/repositories/flight/airport_information.dart';
import 'package:travi/features/map/presentation/presenters/flight_presenter.dart';
import 'package:travi/features/map/presentation/providers/flight_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'flight_presenter_mock.dart';

void main() {
  late MockFlightRepository mockRepository;

  setUp(() {
    mockRepository = MockFlightRepository();
  });

  test('AirportNotifier success case', () async {
    final testAirport = AirportInformation(
      id: 'urn:ucode:_00001C0000000000000100000327E7C0',
      type: 'odpt:Airport',
      context: 'http://vocab.odpt.org/context_odpt_Airport.jsonld',
      date: '2019-04-22T15:00:00+09:00',
      title: 'オークランド(AKL)',
      sameAs: 'odpt.Airport:AKL',
      airportTitle: {'en': 'Auckland', 'ja': 'オークランド(AKL)'},
    );

    when(
      () => mockRepository.fetchAirport(),
    ).thenAnswer((_) async => Success([testAirport]));

    final container = ProviderContainer(
      overrides: [
        airportProvider.overrideWith((ref) => AirportNotifier(mockRepository)),
      ],
    );

    // 実行前の状態（初期状態）
    final initialState = container.read(airportProvider);
    expect(initialState.data, isNull);
    expect(initialState.error, isNull);
    expect(initialState.isLoading, isFalse);

    // fetch 実行
    await container.read(airportProvider.notifier).fetch();

    final resultState = container.read(airportProvider);

    expect(resultState.data, [testAirport]);
    expect(resultState.error, isNull);
    expect(resultState.isLoading, isFalse);
  });

  test('AirportNotifier failure case', () async {
    when(() => mockRepository.fetchAirport()).thenAnswer(
      (_) async => Failure(NetworkException('Something went wrong', 500)),
    );

    final container = ProviderContainer(
      overrides: [
        airportProvider.overrideWith((ref) => AirportNotifier(mockRepository)),
      ],
    );

    await container.read(airportProvider.notifier).fetch();

    final resultState = container.read(airportProvider);

    expect(resultState.data, isNull);
    expect(resultState.error, contains('Something went wrong'));
    expect(resultState.isLoading, isFalse);
  });
}
