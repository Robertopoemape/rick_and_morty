class Formatters {
  static String formatGender(String gender) {
    switch (gender.toLowerCase()) {
      case "male":
        return "Masculino";
      case "female":
        return "Femenino";
      case "genderless":
        return "Sin género";
      default:
        return "Desconocido";
    }
  }

  static String formatStatus(String status) {
    switch (status.toLowerCase()) {
      case "alive":
        return "🟢 Vivo";
      case "dead":
        return "🔴 Fallecido";
      case "unknown":
        return "⚪ Desconocido";
      default:
        return status;
    }
  }
}
