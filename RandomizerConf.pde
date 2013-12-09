class RandomizerConf {

  int active;

  int min;
  int max;

  RandomizerConf(String s) {
    String[] values = s.split("\\|");
    //println("New conf ", values[0], values[1], values[2]);
    this.min = Integer.parseInt(values[0]);
    this.max = Integer.parseInt(values[1]);
    this.active = Integer.parseInt(values[2]);
  }

  RandomizerConf(int min, int max, int active) {
    this.min = min;
    this.max = max;
    this.active = (active == 0 || active == 1) ? active : 1;
  } 

  void setRange(int min, int max) {
    this.min = min;
    this.max = max;
  }

  void setActive(int val) {
    this.active = (val == 0 || val == 1) ? val : 1;
  }
  
  boolean isActive() {
   return active == 1; 
  }
    
  int getRandom() {
    return (int) random(min, max+1);
  }
}
