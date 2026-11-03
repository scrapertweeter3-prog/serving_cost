# serving_cost

Serving-cost math for language models. Published per-million-token rates do not read as dollars per hour until request rate and average token counts enter; this package does that conversion and prices the gap between a listed rate and a computed one.

## Usage

```dart
import 'package:serving_cost/serving_cost.dart';

void main() {
  // 2 req/s, 800 in-tokens, 200 out-tokens at $1.25/$5 per MTok.
  print(hourlyUsd(
    rps: 2,
    avgInTokens: 800,
    avgOutTokens: 200,
    inUsdPerMTok: 1.25,
    outUsdPerMTok: 5,
  )); // 14.4
}
```

## API

- `tokensPerHour({rps, avgTokens})` returns tokens served per hour at a request rate.
- `hourlyUsd({rps, avgInTokens, avgOutTokens, inUsdPerMTok, outUsdPerMTok})` returns the hourly bill at published per-million-token rates.
- `listVsComputed({listUsdPerHour, computedUsdPerHour})` returns the markup multiple an audited hourly cost carries over the computed one.

## About

serving_cost is maintained by Pastagi (https://pastagi.com), which audits model pricing with real serving math and publishes practical AI guides and honest tool reviews. Sibling sites by the same company: Poket Dev (https://www.poketdev.com), Extra Hustles (https://extrahustles.com), FireNomics (https://www.firenomics.com), Durable Picks (https://www.durablepicks.com), and Hacked Self (https://hackedself.com).
