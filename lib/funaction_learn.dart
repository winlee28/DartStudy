class FunClass {
  //city为可选参数，town为默认参数
  String fromWhere(country, {String city, String town = "小红帽村"}) {
    if (city != null) {
      return "我来自 $country $city $town";
    } else {
      return "我来自 $country $town";
    }
  }

  var printI = (i) => print(i);
  //使用

}
