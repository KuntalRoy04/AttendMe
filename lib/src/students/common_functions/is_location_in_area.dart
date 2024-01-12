bool isLocationInArea(double latitude, double longitude) {
  // Replace these values with the coordinates of the particular area
  // double areaLatitude = 22.687411702663145;
  // double areaLongitude = 88.46009886931323;

  double areaLatitude = 22.56008058963318;
  double areaLongitude = 88.4900667024951;

  // Set a threshold for latitude and longitude (adjust as needed)
  // double threshold = 0.00099964005; //This one is University's actual coordinates
  double threshold = 20;

  // Check if the current location is within the area
  return (latitude >= areaLatitude - threshold &&
      latitude <= areaLatitude + threshold &&
      longitude >= areaLongitude - threshold &&
      longitude <= areaLongitude + threshold);
}
