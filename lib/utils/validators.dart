/// Common form‑field validators.
class Validators {
  /// Returns an error message when the input is empty; otherwise `null`.
  static String? notEmpty(String? value, {String msg = 'Required'}) {
    return (value == null || value.trim().isEmpty) ? msg : null;
  }
}
