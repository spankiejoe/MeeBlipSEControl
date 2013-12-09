/*
  The knobs start at CC 48:
 CC 48: Filter Resonance
 CC 49: Filter Cutoff
 CC 50: LFO Frequency
 CC 51: LFO Level
 CC 52: Filter Envelope Amount
 CC 53: Portamento
 CC 54: Pulse Width/PWM Rate
 CC 55: Oscillator Detune
 CC 58: Filter Decay
 CC 59: Filter Attack
 CC 60: Amplitude Decay
 CC 61: Amplitude Attack
 The switches start at CC 64:
 CC 64: Knob Shift
 CC 65: FM off/on
 CC 66: LFO Random (off/on)
 CC 67: LFO Wave (Triangle/Square)
 CC 68: Filter Mode (Low/High)
 CC 69: Distortion (off/on)
 CC 70: LFO Enable (off/on)
 CC 71: LFO Destination (Filter/Oscillator)
 CC 72: Anti Alias (off/on)
 CC 73: Oscillator B Octave (Normal/Up)
 CC 74: Oscillator B Enable
 CC 75: Oscillator B Wave (Triangle/Square)
 CC 76: Envelope Sustain (off/on)
 CC 77: Oscillator A Noise (off/on)
 CC 78: PWM Sweep (Pulse/PWM)
 CC 79: Oscillator A Wave (Sawtooth/PWM)
 */

class MeeBlip {

  HashMap<Integer, Integer> states = new HashMap<Integer, Integer>();
  int deviceOutputPort = 0;

  MeeBlip() {
    setDefaultValues();
  }

  void setDefaultValues() {
    // Knobs default values
    for (int cc=48; cc<56; cc++) {
      states.put(cc, 0);
    }
    for (int cc=58; cc<62; cc++) {
      states.put(cc, 0);
    }
    // Switches default values
    for (int cc=64; cc<80; cc++) {
      states.put(cc, 0);
    }
  }


  void set(int cc, int value) {
    states.put(cc, value);
    //setValue
    //    states.get(cc);
  }

  int get(int cc) {
    //println(cc, states.get(cc));
    return states.get(cc);
  }

  void loadConfig(int bank) {

    Properties prop = new Properties();

    try {
      //load a properties file
      //prop.load(new FileInputStream(sketchPath("data")+"/bank"+bank+".properties"));
      prop.load(new FileInputStream(dataPath("").replaceAll("MeeBlipSEControl.app/Contents/Java/", "")+"/bank"+bank+".properties"));

      // Knobs values with default values to 0
      for (int cc=48; cc<62; cc++) {
        if (cc != 56 && cc != 57) {
          states.put(cc, Integer.parseInt(prop.getProperty(""+cc, "64")));
        }
      }
      // Knobs values with default values to 0
      for (int cc=64; cc<80; cc++) {
        states.put(cc, Integer.parseInt(prop.getProperty(""+cc, "0")));
      }
    } 
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }


  void saveConfig(int bank) {
    Properties prop = new Properties();

    try {
      //FileOutputStream fos = new FileOutputStream(sketchPath("data")+"/bank"+bank+".properties");
      FileOutputStream fos = new FileOutputStream(dataPath("").replaceAll("MeeBlipSEControl.app/Contents/Java/", "")+"/bank"+bank+".properties");

      for (Integer key : states.keySet()) {
        //println("Key " + key +" = "+states.get(key));
        prop.put(""+key, ""+states.get(key));
      }

      prop.store(fos, "Bank "+bank+" properties");
      fos.flush();
    }
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }



  int getCode(String cc) {


    if (cc == "filterResonance") return filterResonanceCC;
    if (cc ==  "filterCutoff") return filterCutoffCC;
    if (cc ==  "lfoFrequency") return lfoFrequencyCC;
    if (cc ==  "lfoLevel") return lfoLevelCC;
    if (cc ==  "filterEnvelopeAmount") return filterEnvelopeAmountCC;
    if (cc ==  "portamento") return portamentoCC;
    if (cc ==  "pwmRate") return pwmRateCC;
    if (cc ==  "oscillatorDetune") return oscillatorDetuneCC;
    if (cc ==  "filterDecay") return filterDecayCC;
    if (cc ==  "filterAttack") return filterAttackCC;
    if (cc ==  "amplitudeDecay") return amplitudeDecayCC;
    if (cc ==  "amplitudeAttack") return amplitudeAttackCC;
    if (cc ==  "knobShift") return knobShiftCC;
    if (cc ==  "lfoRandom") return lfoRandomCC;
    if (cc ==  "lfoWave") return lfoWaveCC;
    if (cc ==  "filterMode") return filterModeCC;
    if (cc ==  "oscillatorFm") return oscillatorFmCC;
    if (cc ==  "distortion") return distortionCC;
    if (cc ==  "lfoEnable") return lfoEnableCC;
    if (cc ==  "lfoDestination") return lfoDestinationCC;
    if (cc ==  "antiAlias") return antiAliasCC;
    if (cc ==  "oscillatorBOctave") return oscillatorBOctaveCC;
    if (cc ==  "oscillatorBEnable") return oscillatorBEnableCC;
    if (cc ==  "oscillatorBWave") return oscillatorBWaveCC;
    if (cc ==  "envelopeSustain") return envelopeSustainCC;
    if (cc ==  "oscillatorANoise") return oscillatorANoiseCC;
    if (cc ==  "pwmSweep") return pwmSweepCC;
    if (cc ==  "oscillatorAWave") return oscillatorAWaveCC;
    return 0;
  } 


  void shuffle(Randomizer randomizer) {
    for (Integer key : states.keySet()) {
      if (randomizer.config.get(key).isActive()) {
        states.put(key, randomizer.config.get(key).getRandom());
      }
    }
  }
}

