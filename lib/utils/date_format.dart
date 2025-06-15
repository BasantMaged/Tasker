/// Very small helper for yyyy‑MM‑dd strings.
/// Extend or replace with intl if you need i18n.
String formatDate(DateTime dt) =>
    '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
