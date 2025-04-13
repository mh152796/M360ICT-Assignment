class AssetsPath{
  static String obscureEye = 'obscure_eye'.svg;

 }

extension on String {
  String get svg => 'assets/icons/$this.svg';
  String get png => 'assets/icons/$this.png';


}