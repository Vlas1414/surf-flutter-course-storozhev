import 'package:places/constants/assets_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/domain/sight.dart';

final List<Sight> mocksSights = [
  Sight(
    id: 1,
    name: 'Технический музей "Машины времени"',
    details:
        'Классический музей с автомобилями, мотоциклами и велосипедами советской эпохи, а также необычным кафе.',
    type: mocksTypeOfSight[4],
    url: 'https://dv-gazeta.info/wp-content/uploads/2018/02/17.jpg',
    lat: 48.4470182,
    lon: 35.0614178,
  ),
  Sight(
    id: 2,
    name: 'Днепропетровский национальный исторический музей',
    details:
        'археологические находки, произведения искусства, фарфор, мебель и оружие.',
    type: mocksTypeOfSight[4],
    url:
        'https://ua.igotoworld.com/frontend/webcontent/websites/1/images/attractions/histmuseum/4384_800x600_mus3.jpg',
    lat: 48.4570098,
    lon: 35.0581895,
  ),
  Sight(
    id: 3,
    name: 'Шар желаний',
    details: 'Стеклянный шар на набережной.',
    type: mocksTypeOfSight[2],
    url:
        'https://dnepr.com/wp-content/uploads/2019/02/1447241552_0_102637_71e1cb99_xxxl.jpg',
    lat: 48.4625024,
    lon: 35.0653134,
  ),
];

final List<TypeOfSight> mocksTypeOfSight = [
  TypeOfSight(
    text: StringsApp.filterHotel,
    icon: AssetsApp.hotelIcon,
  ),
  TypeOfSight(
    text: StringsApp.filterRestaurant,
    icon: AssetsApp.restaurantIcon,
  ),
  TypeOfSight(
    text: StringsApp.filterParticularPlace,
    icon: AssetsApp.particularPlaceIcon,
  ),
  TypeOfSight(
    text: StringsApp.filterPark,
    icon: AssetsApp.parkIcon,
  ),
  TypeOfSight(
    text: StringsApp.filterMuseum,
    icon: AssetsApp.museumIcon,
  ),
  TypeOfSight(
    text: StringsApp.filterCafe,
    icon: AssetsApp.cafeIcon,
  ),
];
