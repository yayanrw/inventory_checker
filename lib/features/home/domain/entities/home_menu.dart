class HomeMenu {
  String title;
  String imagePath;
  String pathName;

  HomeMenu(
      {required this.title, required this.imagePath, required this.pathName});
}

List<HomeMenu> myHomeMenu = [
  HomeMenu(
      title: 'Check QR',
      imagePath: 'assets/images/404.svg',
      pathName: '/check-qr-page'),
  HomeMenu(
      title: 'Scan OUT',
      imagePath: 'assets/images/404.svg',
      pathName: '/scan-out-page'),
];
