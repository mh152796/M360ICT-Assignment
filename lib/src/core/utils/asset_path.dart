class AssetsPath{
  static String obscureEye = 'obscure_eye'.svg;
  static String googleIcon = 'google_icon'.png;
  static String facebookIcon = 'facebook_icon'.png;
  static String microsoftIcon = 'microsoft_icon'.png;
  static String homeIcon = 'home_icon'.png;
  static String backArrow = 'back_arrow'.png;
  static String appleIcon = 'apple_icon'.png;

 }

extension on String {
  String get svg => 'assets/icons/$this.svg';
  String get png => 'assets/icons/$this.png';


}