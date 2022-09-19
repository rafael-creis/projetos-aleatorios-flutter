class GetFormattedDate {
  static String execute(String date) {
    return date.substring(0, date.indexOf("T")).split('-').reversed.join('-');
  }
}
