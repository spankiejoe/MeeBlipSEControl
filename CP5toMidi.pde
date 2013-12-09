class CP5toMidi {

  MidiOutput output = null;
  MidiOutputDevice[] outputDevices;
  MeeBlip meeblip;
  int outputId = 0;

  CP5toMidi(MeeBlip meeblip) {
    outputDevices = RWMidi.getOutputDevices();
    loadConfig();
    setOutput(outputId);
    this.meeblip = meeblip;
  }

  void loadConfig() {
    Properties prop = new Properties();

    try {
      //prop.load(new FileInputStream(sketchPath("data")+"/midi.properties"));
      prop.load(new FileInputStream(dataPath("").replaceAll("MeeBlipSEControl.app/Contents/Java/", "")+"/midi.properties"));

      outputId = Integer.parseInt(prop.getProperty("midioutput", "0"));
    } 
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }

  void saveConfig() {
    Properties prop = new Properties();

    try {
      //FileOutputStream fos = new FileOutputStream(sketchPath("data")+"/midi.properties");
      FileOutputStream fos = new FileOutputStream(dataPath("").replaceAll("MeeBlipSEControl.app/Contents/Java/", "")+"/midi.properties");

      prop.put("midioutput", ""+outputId);
      prop.store(fos, "Midi properties");
      fos.flush();
    }
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }

  void setOutput(int index) {
    if (index >= 0 && index < outputDevices.length) {
      this.output = null;
      this.output = outputDevices[index].createOutput();
      outputId = index;
      saveConfig();
      println( outputDevices[index] + " will now be used as MIDI output");
    }
  }

  void event(String controller, int val) {

    if (controller.equals("oscillatorAWave")) {
      int cmd = oscillatorAWaveCC;
      sendController(cmd, val == 1 ? 0 : 64); // Values are inverted
      meeblip.set(cmd, val == 1 ? 0 : 1);
    }

    else if (controller.equals("oscillatorBWave")) {
      int cmd = oscillatorBWaveCC;
      sendController(cmd, val == 1 ? 0 : 64); // Values are inverted
      meeblip.set(cmd, val == 1 ? 0 : 1);
    }

    else if (controller.equals("pwmSweep")) {
      int cmd = pwmSweepCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val == 0 ? 0 : 1);
    }

    else if (controller.equals("oscillatorBEnable")) {
      int cmd = oscillatorBEnableCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val == 0 ? 0 : 1);
    }

    else if (controller.equals("oscillatorANoise")) {
      int cmd = oscillatorANoiseCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("oscillatorBOctave")) {
      int cmd = oscillatorBOctaveCC;
      sendController(cmd, val == 1 ? 0 : 64); // Values are inverted
      meeblip.set(cmd, val == 1 ? 0 : 1);
    }


    else if (controller.equals("envelopeSustain")) {
      int cmd = envelopeSustainCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("antiAlias")) {
      int cmd = antiAliasCC;
      sendController(cmd, val == 1 ? 0 : 64); // Values are inverted
      meeblip.set(cmd, val == 1 ? 1 : 0);
    }

    else if (controller.equals("lfoDestination")) {
      int cmd = lfoDestinationCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val == 0 ? 1 : 0);
    }

    else if (controller.equals("lfoWave")) {
      int cmd = lfoWaveCC;
      sendController(cmd, val == 1 ? 0 : 64); // Values are inverted
      meeblip.set(cmd, val);
    }

    else if (controller.equals("lfoEnable")) {
      int cmd = lfoEnableCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val == 0 ? 0 : 1);
    }

    else if (controller.equals("lfoRandom")) {
      int cmd = lfoRandomCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val == 0 ? 0 : 1);
    }

    else if (controller.equals("distortion")) {
      int cmd = distortionCC;
      sendController(cmd, val == 1 ? 0 : 64); // Values are inverted
      meeblip.set(cmd, val == 1 ? 1 : 0);
    }

    else if (controller.equals("oscillatorFm")) {
      int cmd = oscillatorFmCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("filterMode")) {
      int cmd = filterModeCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("knobShift")) {
      int cmd = knobShiftCC;
      sendController(cmd, val == 0 ? 0 : 64);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("oscillatorDetune")) {
      int cmd = oscillatorDetuneCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("pwmRate")) {
      int cmd = pwmRateCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("portamento")) {
      int cmd = portamentoCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("filterEnvelopeAmount")) {
      int cmd = filterEnvelopeAmountCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("lfoLevel")) {
      int cmd = lfoLevelCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("lfoFrequency")) {
      int cmd = lfoFrequencyCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("filterCutoff")) {
      int cmd = filterCutoffCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("filterResonance")) {
      int cmd = filterResonanceCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("amplitudeAttack")) {
      int cmd = amplitudeAttackCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("amplitudeDecay")) {
      int cmd = amplitudeDecayCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("filterAttack")) {
      int cmd = filterAttackCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }

    else if (controller.equals("filterDecay")) {
      int cmd = filterDecayCC;
      sendController(cmd, val);
      meeblip.set(cmd, val);
    }
  }

  void sendController(int cc, int value) {
    if (null != output) {
      output.sendController(0, cc, value);
    }
  }

  void sendNoteOn(int channel, int pitch, int velocity) {
    if (null != output) {
      output.sendNoteOn(channel, pitch, velocity);
    }
  }
}
