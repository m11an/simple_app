enum Env { dev, stagging, prod }

class Constants {
  static const Env environment = Env.dev;
  static const String baseUrlDev = 'https://jsonplaceholder.typicode.com';
  static const String baseUrlStagging = 'https://jsonplaceholder.typicode.com';
  static const String baseUrlProd = 'https://jsonplaceholder.typicode.com';

  static const String tableCommentsName = 'comments';
}
