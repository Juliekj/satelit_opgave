PVector convert(float lat, float lon, float r)
{
  float theta = radians(lat);
  float phi = radians(lon) + PI;

  // fix: in OpenGL, y & z axes are flipped from math notation of spherical coordinates
  float x = r * cos(theta) * cos(phi);
  float y = -r * sin(theta);
  float z = -r * cos(theta) * sin(phi);

  return new PVector(x, y, z);
}
