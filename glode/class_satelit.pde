class Satelite {


  void setup() {

    JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=5TTEBX-LD68B8-6NCTUN-4SR7");
    JSONArray positionsJson = j.getJSONArray("positions");

    JSONObject pos1 = positionsJson.getJSONObject(0);
    JSONObject pos2 = positionsJson.getJSONObject(1);

    float sat1Lon = pos1.getFloat("satlongitude");
    float sat1Lat = pos1.getFloat("satlatitude");
    float sat1Tid = pos1.getFloat("timestamp");

    float sat2Lon = pos2.getFloat("satlongitude");
    float sat2Lat = pos2.getFloat("satlatitude");
    float sat2Tid = pos2.getFloat("timestamp");


    pos1V = convert(sat1Lon, sat1Lat, 150);
    pos2V = convert(sat2Lon, sat2Lat, 150);

    PVector.cross(pos1V, pos2V, rotationVec);

    rSatelit = sqrt(pow(pos1V.x, 2) + pow(pos1V.y, 2) + pow(pos1V.z, 2));
    println(rSatelit);
    posAfstand = sqrt( pow(pos1V.x - pos2V.x, 2 ) + pow(pos1V.y - pos2V.y, 2 ) + pow(pos1V.z - pos2V.z, 2 ));
    println(posAfstand);
    posAngle = 2 * asin(posAfstand/(2*rSatelit));
    println(posAngle);
    rotationsTrin = 20.0 * posAngle;///abs(sat1Tid-sat2Tid);
    println(sat1Tid + "  " + sat2Tid);
  }


  void tegnsSelite() {
    //rotation+=0.04;
    rotation+= rotationsTrin;
    // println(rotationsTrin);

    //latt
    pushMatrix();
    translate(width*0.5, height*0.5);
    // rotate(rotation, zAxis.x, zAxis.y, zAxis.z);
    //rotate(rotation, yAxis.x, yAxis.y,yAxis.z);
    rotate(rotation, rotationVec.x, rotationVec.y, rotationVec.z);
    //println(rotationVec.x + "  " + rotationVec.y + " " + rotationVec.z);
    translate(pos1V.x, pos1V.y, pos1V.z);
    // println(pos1V.x + " " + pos1V.y + " " + pos1V.z);
    box(10);
    popMatrix();
  }
}
