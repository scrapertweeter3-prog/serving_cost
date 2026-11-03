/// Serving-cost math for language models: tokens per hour, hourly USD
/// at published per-million-token rates, and list-versus-computed markups.
library;

/// Tokens served per hour at [rps] requests a second, [avgTokens] each.
double tokensPerHour({required double rps, required double avgTokens}) {
  return rps * avgTokens * 3600;
}

/// Hourly bill: in-tokens at [inUsdPerMTok] plus out-tokens at
/// [outUsdPerMTok], per million tokens.
double hourlyUsd({
  required double rps,
  required double avgInTokens,
  required double avgOutTokens,
  required double inUsdPerMTok,
  required double outUsdPerMTok})
{
  final mTokPerHour = tokensPerHour(rps: rps, avgTokens: 1) / 1000000;
  return mTokPerHour * (avgInTokens * inUsdPerMTok + avgOutTokens * outUsdPerMTok);
}

/// Markup multiple of a listed hourly price over the computed one.
double listVsComputed({
  required double listUsdPerHour,
  required double computedUsdPerHour})
{
  return listUsdPerHour / computedUsdPerHour;
}
