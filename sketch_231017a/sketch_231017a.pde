
void setup() {
    size(1000, 1000);
}

float c = 173.0;
float a = 173.0;

float distance = sqrt(pow(a,2)+pow(c,2));

float femore_l = c;
float tibia_l = a;


int offset_x = 200;
int offset_y = 200;

float tx = 100;
float ty = 100;


float[] angles = updateAngles(tx,ty);

float j1 = angles[0];
float j2 = angles[1];


float x2 = femore_l * cos(j1);
float y2 = femore_l * sin(j1);

float x3 = tibia_l * cos(j2 + j1);
float y3 = tibia_l * sin(j2 + j1);

x2 = offset_x + x2;
y2 = offset_y + y2;

x3 = x2 + x3;
y3 = y2 + y3;


strokeWeight(16);  
stroke(150,150,150);
line(offset_x,offset_y, x2, y2);
line(x2, y2, x3, y3); 

stroke(255,0,0);
point(offset_x,offset_y);
stroke(0,0,0);
point(x2, y2);
point(x3, y3);

float[] updateAngles(float x, float y) {
  float b =  sqrt(pow(tx,2) + pow(ty,2));
  
  float phi1 = acos(( pow(b,2) + pow(c,2) - pow(a,2) ) / (2*b*c));
  float phi2 = acos(( pow(a,2) + pow(c,2) - pow(b,2) ) / (2*a*c));
  float phi3 = atan(y/x);
  
  float[] angles;
  
  angles[0] = (phi3 - phi1);
  angles[1] =  (PI - phi2);
  
  return angles;
}
