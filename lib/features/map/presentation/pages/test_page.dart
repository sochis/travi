import 'package:flutter/material.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_arrival_information.dart';
import 'package:flutter_base/features/map/presentation/providers/flight_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flightArrivalProvider);
    final notifier = ref.read(flightArrivalProvider.notifier);
    final List<FlightArrivalInformation> flights = state.data ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Flight Arrivals')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
          ? Center(child: Text('Error: ${state.error}'))
          : ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                return ListTile(
                  title: Text(flight.flightNumber[0]),
                  subtitle: Text(
                    'From ${flight.originAirport} at ${flight.actualArrivalTime}',
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.fetch,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
