bool isLocationInArea(double latitude, double longitude) {

  double areaLatitude = 22.56008058963318; //This one is University's actual coordinates
  double areaLongitude = 88.4900667024951; //This one is University's actual coordinates

  // double threshold = 0.00099964005; //This one is University's actual threshold
  double threshold = 20; //Modified threshold for testing

  // Check if the current location is within the area
  return (latitude >= areaLatitude - threshold &&
      latitude <= areaLatitude + threshold &&
      longitude >= areaLongitude - threshold &&
      longitude <= areaLongitude + threshold);
}
