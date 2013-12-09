class Randomizer {

  HashMap<Integer, RandomizerConf> config = new HashMap<Integer, RandomizerConf>();

  Randomizer() {
    setDefaultValues();
  }

  void setDefaultValues() {
    // Knobs default values
    for (int cc=48; cc<56; cc++) {
      RandomizerConf conf = new RandomizerConf(0, 127, 1);
      config.put(cc, conf); // Range
    }
    for (int cc=58; cc<62; cc++) {
      RandomizerConf conf = new RandomizerConf(0, 127, 1);
      config.put(cc, conf); // Range
    }
    // Switches default values
    for (int cc=64; cc<80; cc++) {
      RandomizerConf conf = new RandomizerConf(0, 1, 1);
      config.put(cc, conf); // ON/OFF
    }
  }

  void setMinMax(int cc, int min, int max) {
    config.get(cc).setRange(min, max);
  }

  void setActive(int cc, int i) {
    config.get(cc).setActive(i);
  }

  void uncheckAll() {
    for (Integer key : config.keySet()) {
      config.get(key).setActive(0);
    }
  }

  void checkAll() {
    for (Integer key : config.keySet()) {
      config.get(key).setActive(1);
    }
  }

  void defaultRange() {
    for (Integer key : config.keySet()) {
      if (key <= 61) {
        config.get(key).setRange(0, 127);
      }
    }
  }

  void saveConfig() {
    Properties prop = new Properties();

    try {
      //FileOutputStream fos = new FileOutputStream(sketchPath("data")+"/random.properties");
      FileOutputStream fos = new FileOutputStream(dataPath("").replaceAll("MeeBlipSEControl.app/Contents/Java/", "")+"/random.properties");

      for (Integer key : config.keySet()) {
        String conf = ""+config.get(key).min+"|"+config.get(key).max+"|"+config.get(key).active;
        prop.put(""+key, ""+conf);
      }

      prop.store(fos, "Random properties");
      fos.flush();
    }
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }

  void loadConfig() {
    Properties prop = new Properties();

    try {
      //prop.load(new FileInputStream(sketchPath("data")+"/random.properties"));
      prop.load(new FileInputStream(dataPath("").replaceAll("MeeBlipSEControl.app/Contents/Java/", "")+"/random.properties"));


      // Knobs with default values to 1 min 0 max 127
      for (int cc=48; cc<62; cc++) {
        if (cc != 56 || cc != 57) {
          config.put(cc, new RandomizerConf(prop.getProperty(""+cc, "0|127|1")));
        }
      }
      // Switches with default values to 1 min 0 max 1
      for (int cc=64; cc<80; cc++) {
        config.put(cc, new RandomizerConf(prop.getProperty(""+cc, "0|1|1")));
      }
    } 
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }


  void event(String controller, int value) {

    // Toggles
    if (controller.equals("filterResonanceRandomToggle")) {
      config.get(48).setActive(value);
    }
    else if (controller.equals("filterCutoffRandomToggle")) {
      config.get(49).setActive(value);
    }
    else if (controller.equals("lfoFrequencyRandomToggle")) {
      config.get(50).setActive(value);
    }
    else if (controller.equals("lfoLevelRandomToggle")) {
      config.get(51).setActive(value);
    }
    else if (controller.equals("filterEnvelopeAmountRandomToggle")) {
      config.get(52).setActive(value);
    }
    else if (controller.equals("portamentoRandomToggle")) {
      config.get(53).setActive(value);
    }
    else if (controller.equals("pwmRateRandomToggle")) {
      config.get(54).setActive(value);
    }
    else if (controller.equals("oscillatorDetuneRandomToggle")) {
      config.get(55).setActive(value);
    }
    else if (controller.equals("filterDecayRandomToggle")) {
      config.get(58).setActive(value);
    }
    else if (controller.equals("filterAttackRandomToggle")) {
      config.get(59).setActive(value);
    }
    else if (controller.equals("amplitudeDecayRandomToggle")) {
      config.get(60).setActive(value);
    }
    else if (controller.equals("amplitudeAttackRandomToggle")) {
      config.get(61).setActive(value);
    }
    else if (controller.equals("knobShiftRandomToggle")) {
      config.get(64).setActive(value);
    }
    else if (controller.equals("lfoRandomRandomToggle")) {
      config.get(65).setActive(value);
    }
    else if (controller.equals("lfoWaveRandomToggle")) {
      config.get(66).setActive(value);
    }
    else if (controller.equals("filterModeRandomToggle")) {
      config.get(67).setActive(value);
    }
    else if (controller.equals("oscillatorFmRandomToggle")) {
      config.get(68).setActive(value);
    }
    else if (controller.equals("distortionRandomToggle")) {
      config.get(69).setActive(value);
    }
    else if (controller.equals("lfoEnableRandomToggle")) {
      config.get(70).setActive(value);
    }
    else if (controller.equals("lfoDestinationRandomToggle")) {
      config.get(71).setActive(value);
    }
    else if (controller.equals("antiAliasRandomToggle")) {
      config.get(72).setActive(value);
    }
    else if (controller.equals("oscillatorBOctaveRandomToggle")) {
      config.get(73).setActive(value);
    }
    else if (controller.equals("oscillatorBEnableRandomToggle")) {
      config.get(74).setActive(value);
    }
    else if (controller.equals("oscillatorBWaveRandomToggle")) {
      config.get(75).setActive(value);
    }
    else if (controller.equals("envelopeSustainRandomToggle")) {
      config.get(76).setActive(value);
    }
    else if (controller.equals("oscillatorANoiseRandomToggle")) {
      config.get(77).setActive(value);
    }
    else if (controller.equals("pwmSweepRandomToggle")) {
      config.get(78).setActive(value);
    }
    else if (controller.equals("oscillatorAWaveRandomToggle")) {
      config.get(79).setActive(value);
    }
  }

  void event(String controller, int min, int max) {

    // Range
    if (controller.equals("filterResonanceRandom")) {
      config.get(48).setRange(min, max);
    }
    else if (controller.equals("filterCutoffRandom")) {
      config.get(49).setRange(min, max);
    }
    else if (controller.equals("lfoFrequencyRandom")) {
      config.get(50).setRange(min, max);
    }
    else if (controller.equals("lfoLevelRandom")) {
      config.get(51).setRange(min, max);
    }
    else if (controller.equals("filterEnvelopeAmountRandom")) {
      config.get(52).setRange(min, max);
    }
    else if (controller.equals("portamentoRandom")) {
      config.get(53).setRange(min, max);
    }
    else if (controller.equals("pwmRateRandom")) {
      config.get(54).setRange(min, max);
    }
    else if (controller.equals("oscillatorDetuneRandom")) {
      config.get(55).setRange(min, max);
    }
    else if (controller.equals("filterDecayRandom")) {
      config.get(58).setRange(min, max);
    }
    else if (controller.equals("filterAttackRandom")) {
      config.get(59).setRange(min, max);
    }
    else if (controller.equals("amplitudeDecayRandom")) {
      config.get(60).setRange(min, max);
    }
    else if (controller.equals("amplitudeAttackRandom")) {
      config.get(61).setRange(min, max);
    }
  }
}

