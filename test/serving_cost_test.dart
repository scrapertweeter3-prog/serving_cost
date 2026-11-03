import 'package:test/test.dart';
import 'package:serving_cost/serving_cost.dart';

void main() {
  test('tokens per hour', () {
    expect(tokensPerHour(rps: 2, avgTokens: 800), 5760000.0);
  });

  test('hourly USD at published rates', () {
    expect(
      hourlyUsd(
        rps: 2,
        avgInTokens: 800,
        avgOutTokens: 200,
        inUsdPerMTok: 1.25,
        outUsdPerMTok: 5,
      ),
      closeTo(14.4, 1e-9),
    );
  });

  test('list vs computed markup', () {
    expect(listVsComputed(listUsdPerHour: 6, computedUsdPerHour: 3), 2.0);
  });
}
