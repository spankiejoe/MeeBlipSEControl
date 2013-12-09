class CP5Layout {

  ControlP5 cp5;

  Knob filterResonance;
  Knob filterCutoff;
  Knob lfoFrequency;
  Knob lfoLevel;
  Knob filterEnvelopeAmount;
  Knob portamento;
  Knob pwmRate;
  Knob oscillatorDetune;
  Knob filterDecay;
  Knob filterAttack;
  Knob amplitudeDecay;
  Knob amplitudeAttack;

  Toggle knobShift;
  Toggle lfoRandom;
  RadioButton lfoWave;
  Toggle filterMode;
  Toggle oscillatorFm;
  Toggle distortion;
  Toggle lfoEnable;
  RadioButton lfoDestination;
  Toggle antiAlias;
  RadioButton oscillatorBOctave;
  Toggle oscillatorBEnable;
  RadioButton oscillatorBWave;
  Toggle envelopeSustain;
  Toggle oscillatorANoise;
  Toggle pwmSweep;
  RadioButton oscillatorAWave;

  Range filterResonanceRandom;
  Range filterCutoffRandom;
  Range lfoFrequencyRandom;
  Range lfoLevelRandom;
  Range filterEnvelopeAmountRandom;
  Range portamentoRandom;
  Range pwmRateRandom;
  Range oscillatorDetuneRandom;
  Range filterDecayRandom;
  Range filterAttackRandom;
  Range amplitudeDecayRandom;
  Range amplitudeAttackRandom;

  Toggle filterResonanceRandomToggle;
  Toggle filterCutoffRandomToggle;
  Toggle lfoFrequencyRandomToggle;
  Toggle lfoLevelRandomToggle;
  Toggle filterEnvelopeAmountRandomToggle;
  Toggle portamentoRandomToggle;
  Toggle pwmRateRandomToggle;
  Toggle oscillatorDetuneRandomToggle;
  Toggle filterDecayRandomToggle;
  Toggle filterAttackRandomToggle;
  Toggle amplitudeDecayRandomToggle;
  Toggle amplitudeAttackRandomToggle;

  Toggle knobShiftRandomToggle;
  Toggle lfoRandomRandomToggle;
  Toggle lfoWaveRandomToggle;
  Toggle filterModeRandomToggle;
  Toggle oscillatorFmRandomToggle;
  Toggle distortionRandomToggle;
  Toggle lfoEnableRandomToggle;
  Toggle lfoDestinationRandomToggle;
  Toggle antiAliasRandomToggle;
  Toggle oscillatorBOctaveRandomToggle;
  Toggle oscillatorBEnableRandomToggle;
  Toggle oscillatorBWaveRandomToggle;
  Toggle envelopeSustainRandomToggle;
  Toggle oscillatorANoiseRandomToggle;
  Toggle pwmSweepRandomToggle;
  Toggle oscillatorAWaveRandomToggle;

  Bang saveRandomConfig;
  Bang loadRandomConfig;

  Textarea aboutTextArea;

  CP5Layout(ControlP5 cp5, MeeBlip meeblip) {

    this.cp5 = cp5;
    addTabs();

    addKnobs2(320, 80, meeblip);
    addKnobs1(120, 200, meeblip);
    addSwithes(120, 350, meeblip);
    addBanks(120, 550);

    addMidiOutput(width-300, 120);

    addRandomTrigger(120, 80);
    addKnobsRandomToggle(100, 100);
    addKnobsRandomRange(200, 100);
    addSwitchesRandomToggle(500, 100);

    addRandomControls(width-320, height-70);

    addAboutInfo(20, 50);
  }

  void addRandomTrigger(int x, int y) {
    cp5.addBang("randomBang")
      .setPosition(x, y)
        .setSize(150, 80)
          .setLabel("random");
  }

  void addRandomControls(int x, int y) {
    cp5.addBang("CheckAll")
      .setPosition(x, y)
        .setSize(50, 50)
          .setLabel("Check all");    
    cp5.getController("CheckAll").moveTo("Settings");

    cp5.addBang("UncheckAll")
      .setPosition(x+=60, y)
        .setSize(50, 50)
          .setLabel("Uncheck all");
    cp5.getController("UncheckAll").moveTo("Settings");


    cp5.addBang("DefaultRange")
      .setPosition(x+=60, y)
        .setSize(50, 50)
          .setLabel("Default range");
    cp5.getController("DefaultRange").moveTo("Settings");


    cp5.addBang("Save")
      .setPosition(x+=80, y)
        .setSize(50, 50)
          .setLabel("Save config");    
    cp5.getController("Save").moveTo("Settings");

    cp5.addBang("Load")
      .setPosition(x+= 60, y)
        .setSize(50, 50)
          .setLabel("Load config");
    cp5.getController("Load").moveTo("Settings");
  }


  void addTabs() {
    this.cp5 = cp5;
    cp5.getTab("default")
      .activateEvent(true)
        .setLabel("MeeBlip")
          .setHeight(40)
            .setWidth(width/3)
              .setId(1);

    cp5.addTab("Settings")
      .setHeight(40)
        .setWidth(width/3)
          .activateEvent(true)
            .setId(2);

    cp5.addTab("About")
      .setHeight(40)
        .setWidth(width/3)
          .activateEvent(true)
            .setId(3);
  }


  void addAboutInfo(int x, int y) {
    aboutTextArea = cp5.addTextarea("texte")
      .setPosition(x, y)
        .setSize(width-40, height-100)
          .setFont(createFont("arial", 12))
            .setLineHeight(14)
              .setColorBackground(color(128))
                ;

    aboutTextArea.setText("MEEBLIP SE CONTROL\r\n"
      +"A project by Jerome Saint-Clair\r\n"
      +"-------------------------------------\r\n"
      +"For the MeeBlip SE community\r\n"
      +"-------------------------------------\r\n"
      +"Created with Processing\r\n"
      +"Using the Ruin & Wesen MIDI library and ControlP5 by Andreas Schlegel\r\n"
      +"-------------------------------------\r\n"
      +"About the MeeBlip SE\r\n"
      +"The MeeBlip is an open source and hackable synthesizer developped by James Grahame and Create Digital Music\r\n"
      +"-------------------------------------\r\n"
      +"About this software\r\n"
      +"This software can be used to remotely control a MeeBlip SE through MIDI\r\n"
      +"All the physical knobs and switches are reproduced in this interface\r\n"
      +"You can save and reload up to 32 sounds\r\n"
      +"It also allows you to explore sounds through the RANDOM function that you can tune according to your need:\r\n"
      +"- You can choose on which parameters the random will apply\r\n"
      +"- You can set the range of the random values (for knobs)\r\n"
      );

    aboutTextArea.moveTo("About");
  }

  void addKnobsRandomToggle(int x, int y) {

    int vSpace = 50;

    oscillatorDetuneRandomToggle = cp5.addToggle("oscillatorDetuneRandomToggle")
      .setPosition(x, y)
        .setSize(40, 25)
          .setCaptionLabel("osc detune")
            .setValue(1);
    cp5.getController("oscillatorDetuneRandomToggle").moveTo("Settings");

    pwmRateRandomToggle = cp5.addToggle("pwmRateRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("pwm")
            .setValue(1);
    cp5.getController("pwmRateRandomToggle").moveTo("Settings");

    portamentoRandomToggle = cp5.addToggle("portamentoRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("glide")
            .setValue(1);
    cp5.getController("portamentoRandomToggle").moveTo("Settings");

    filterEnvelopeAmountRandomToggle = cp5.addToggle("filterEnvelopeAmountRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("filter env amount")
            .setValue(1);
    cp5.getController("filterEnvelopeAmountRandomToggle").moveTo("Settings");

    lfoLevelRandomToggle = cp5.addToggle("lfoLevelRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("lfo depth")
            .setValue(1);
    cp5.getController("lfoLevelRandomToggle").moveTo("Settings");

    lfoFrequencyRandomToggle = cp5.addToggle("lfoFrequencyRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("lfo rate")
            .setValue(1);
    cp5.getController("lfoFrequencyRandomToggle").moveTo("Settings");

    filterCutoffRandomToggle = cp5.addToggle("filterCutoffRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("lfo cutoffe")
            .setValue(1);
    cp5.getController("filterCutoffRandomToggle").moveTo("Settings");

    filterResonanceRandomToggle = cp5.addToggle("filterResonanceRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("filter resonance")
            .setValue(1);
    cp5.getController("filterResonanceRandomToggle").moveTo("Settings");

    amplitudeAttackRandomToggle = cp5.addToggle("amplitudeAttackRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("amp attack")
            .setValue(1);
    cp5.getController("amplitudeAttackRandomToggle").moveTo("Settings");

    amplitudeDecayRandomToggle = cp5.addToggle("amplitudeDecayRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("amp decay")
            .setValue(1);
    cp5.getController("amplitudeDecayRandomToggle").moveTo("Settings");

    filterAttackRandomToggle = cp5.addToggle("filterAttackRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("filter attack")
            .setValue(1);
    cp5.getController("filterAttackRandomToggle").moveTo("Settings");

    filterDecayRandomToggle = cp5.addToggle("filterDecayRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, 25)
          .setCaptionLabel("filter decay")
            .setValue(1);
    cp5.getController("filterDecayRandomToggle").moveTo("Settings");
  }

  void addSwitchesRandomToggle(int x, int y) {

    int vSpace = 77;
    int h = 35;

    oscillatorAWaveRandomToggle = cp5.addToggle("oscillatorAWaveRandomToggle")
      .setPosition(x, y)
        .setSize(40, h)
          .setCaptionLabel("osc a wave")
            .setValue(1);
    cp5.getController("oscillatorAWaveRandomToggle").moveTo("Settings");

    pwmSweepRandomToggle = cp5.addToggle("pwmSweepRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("pwm sweep")
            .setValue(1);
    cp5.getController("pwmSweepRandomToggle").moveTo("Settings");

    oscillatorANoiseRandomToggle = cp5.addToggle("oscillatorANoiseRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc a noise")
            .setValue(1);
    cp5.getController("oscillatorANoiseRandomToggle").moveTo("Settings");

    envelopeSustainRandomToggle = cp5.addToggle("envelopeSustainRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("amp env sustain")
            .setValue(1);
    cp5.getController("envelopeSustainRandomToggle").moveTo("Settings");

    lfoDestinationRandomToggle = cp5.addToggle("lfoDestinationRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("lfo destination")
            .setValue(1);
    cp5.getController("lfoDestinationRandomToggle").moveTo("Settings");

    lfoEnableRandomToggle = cp5.addToggle("lfoEnableRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("lfo enable")
            .setValue(1);
    cp5.getController("lfoEnableRandomToggle").moveTo("Settings");

    distortionRandomToggle = cp5.addToggle("distortionRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("distortion")
            .setValue(1);
    cp5.getController("distortionRandomToggle").moveTo("Settings");

    filterModeRandomToggle = cp5.addToggle("filterModeRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc detune")
            .setValue(1);
    cp5.getController("filterModeRandomToggle").moveTo("Settings");

    x+= 100;
    y = y-8*vSpace;

    oscillatorBWaveRandomToggle = cp5.addToggle("oscillatorBWaveRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc b wave")
            .setValue(1);
    cp5.getController("oscillatorBWaveRandomToggle").moveTo("Settings");

    oscillatorBEnableRandomToggle = cp5.addToggle("oscillatorBEnableRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc b enable")
            .setValue(1);
    cp5.getController("oscillatorBEnableRandomToggle").moveTo("Settings");

    oscillatorBOctaveRandomToggle = cp5.addToggle("oscillatorBOctaveRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc b octave")
            .setValue(1);
    cp5.getController("oscillatorBOctaveRandomToggle").moveTo("Settings");

    antiAliasRandomToggle = cp5.addToggle("antiAliasRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("anti-alias")
            .setValue(1);
    cp5.getController("antiAliasRandomToggle").moveTo("Settings");

    lfoWaveRandomToggle = cp5.addToggle("lfoWaveRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("lfo wave")
            .setValue(1);
    cp5.getController("lfoWaveRandomToggle").moveTo("Settings");

    lfoRandomRandomToggle = cp5.addToggle("lfoRandomRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("lfo random")
            .setValue(1);
    cp5.getController("lfoRandomRandomToggle").moveTo("Settings");


    knobShiftRandomToggle = cp5.addToggle("knobShiftRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc detune")
            .setValue(1);
    cp5.getController("knobShiftRandomToggle").moveTo("Settings");

    oscillatorFmRandomToggle = cp5.addToggle("oscillatorFmRandomToggle")
      .setPosition(x, y+=vSpace)
        .setSize(40, h)
          .setCaptionLabel("osc fm")
            .setValue(1);
    cp5.getController("oscillatorFmRandomToggle").moveTo("Settings");
  }

  void addKnobsRandomRange(int x, int y) {

    int vSpace = 50;

    oscillatorDetuneRandom = cp5.addRange("oscillatorDetuneRandom")
      .setPosition(x, y)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("oscillatorDetuneRandom").moveTo("Settings");

    pwmRateRandom = cp5.addRange("pwmRateRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("pwmRateRandom").moveTo("Settings");

    portamentoRandom = cp5.addRange("portamentoRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("portamentoRandom").moveTo("Settings");

    filterEnvelopeAmountRandom = cp5.addRange("filterEnvelopeAmountRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("filterEnvelopeAmountRandom").moveTo("Settings");

    lfoLevelRandom = cp5.addRange("lfoLevelRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("lfoLevelRandom").moveTo("Settings");

    lfoFrequencyRandom = cp5.addRange("lfoFrequencyRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("lfoFrequencyRandom").moveTo("Settings");

    filterCutoffRandom = cp5.addRange("filterCutoffRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("filterCutoffRandom").moveTo("Settings");

    filterResonanceRandom = cp5.addRange("filterResonanceRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("filterResonanceRandom").moveTo("Settings");

    amplitudeAttackRandom = cp5.addRange("amplitudeAttackRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("amplitudeAttackRandom").moveTo("Settings");

    amplitudeDecayRandom = cp5.addRange("amplitudeDecayRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("amplitudeDecayRandom").moveTo("Settings");

    filterAttackRandom = cp5.addRange("filterAttackRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("filterAttackRandom").moveTo("Settings");

    filterDecayRandom = cp5.addRange("filterDecayRandom")
      .setPosition(x, y+=vSpace)
        .setSize(200, 25)
          .setHandleSize(10)
            .setRange(0, 127)
              .setRangeValues(0, 127)
                .setCaptionLabel("");
    cp5.getController("filterDecayRandom").moveTo("Settings");
  }

  void addMidiOutput(int x, int y) {
    outputDeviceList = cp5.addListBox("output devices")
      .setPosition(x, y)
        .setSize(250, 120)
          .setItemHeight(15)
            .setBarHeight(20);

    outputDeviceList.captionLabel().style().marginTop = 3;
    outputDeviceList.valueLabel().style().marginTop = 3;


    MidiOutputDevice[] outputDevices = RWMidi.getOutputDevices();
    int i=0;
    for (MidiOutputDevice s: outputDevices) {
      String label = s.toString();
      if (label.length() > 100) {
        label = label.substring(0, 100)+" [...]";
      }
      ListBoxItem lbi = outputDeviceList.addItem(label, i++);
      lbi.setColorBackground(color(0, 100, 255));
    }

    outputDeviceList.moveTo("Settings");
  }

  void addKnobs1(int x, int y, MeeBlip meeblip) {
    int vSpace = 80;
    int hSpace = 100;


    oscillatorDetune = cp5.addKnob("oscillatorDetune")
      .setRange(0, 127)
        .setValue(meeblip.get(oscillatorDetuneCC))
          .setPosition(x, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("osc detune")
                  ;

    pwmRate = cp5.addKnob("pwmRate")
      .setRange(0, 127)
        .setValue(meeblip.get(pwmRateCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("pwm")
                  ;

    portamento = cp5.addKnob("portamento")
      .setRange(0, 127)
        .setValue(meeblip.get(portamentoCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("glide")
                  ;

    filterEnvelopeAmount = cp5.addKnob("filterEnvelopeAmount")
      .setRange(0, 127)
        .setValue(meeblip.get(filterEnvelopeAmountCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("filter env amount")
                  ;

    lfoLevel = cp5.addKnob("lfoLevel")
      .setRange(0, 127)
        .setValue(meeblip.get(lfoLevelCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("lfo depth")
                  ;

    lfoFrequency = cp5.addKnob("lfoFrequency")
      .setRange(0, 127)
        .setValue(meeblip.get(lfoFrequencyCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("lfo rate")
                  ;

    filterCutoff = cp5.addKnob("filterCutoff")
      .setRange(0, 127)
        .setValue(meeblip.get(filterCutoffCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("lfo cutoff")
                  ;

    filterResonance = cp5.addKnob("filterResonance")
      .setRange(0, 127)
        .setValue(meeblip.get(filterResonanceCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("filter resonance")
                  ;
  }

  void addKnobs2(int x, int y, MeeBlip meeblip) {
    int vSpace = 80;
    int hSpace = 100;


    amplitudeAttack = cp5.addKnob("amplitudeAttack")
      .setRange(0, 127)
        .setValue(meeblip.get(amplitudeAttackCC))
          .setPosition(x, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("amp attack")
                  ;

    amplitudeDecay = cp5.addKnob("amplitudeDecay")
      .setRange(0, 127)
        .setValue(meeblip.get(amplitudeDecayCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("amp decay")
                  ;

    filterAttack = cp5.addKnob("filterAttack")
      .setRange(0, 127)
        .setValue(meeblip.get(filterAttackCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("filter attack")
                  ;

    filterDecay = cp5.addKnob("filterDecay")
      .setRange(0, 127)
        .setValue(meeblip.get(filterDecayCC))
          .setPosition(x+=hSpace, y)
            .setRadius(40)
              .setDragDirection(Knob.VERTICAL)
                .setCaptionLabel("filter decay")
                  ;
  }

  void addSwithes(int x, int y, MeeBlip meeblip) {

    int vSpace = 90;
    int hSpace = 105;

    oscillatorAWave = cp5.addRadioButton("oscillatorAWave")
      .setPosition(x, y)
        .setSize(20, 20)
          .setCaptionLabel("ee")
            .addItem("PWM", 0)
              .addItem("Sawtooth", 1)
                .activate(abs(meeblip.get(oscillatorAWaveCC)-1));

    cp5.addTextlabel("oscAWave")
      .setText("OSC A WAVE")
        .setPosition(x-4, y+43)
          .setFont(5);

    oscillatorBWave = cp5.addRadioButton("oscillatorBWave")
      .setPosition(x, y+vSpace)
        .setSize(20, 20)
          .addItem("oscillatorBWaveSquare", 0)
            .addItem("oscillatorBWaveTriangle", 1)
              .activate(abs(meeblip.get(oscillatorBWaveCC)-1));

    cp5.addTextlabel("oscBWave")
      .setText("OSC B WAVE")
        .setPosition(x-4, y+vSpace+43)
          .setFont(5);

    oscillatorBWave.getItem(0).setCaptionLabel("Square");
    oscillatorBWave.getItem(1).setCaptionLabel("Triangle");

    x += hSpace;

    pwmSweep = cp5.addToggle("pwmSweep")
      .setPosition(x, y)
        .setSize(40, 40)
          .setCaptionLabel("pwm sweep")
            .setValue((meeblip.get(pwmSweepCC) == 1));

    oscillatorBEnable = cp5.addToggle("oscillatorBEnable")
      .setPosition(x, y+vSpace)
        .setSize(40, 40)
          .setCaptionLabel("osc b enable")
            .setValue((meeblip.get(oscillatorBEnableCC) == 1));

    x+= hSpace;

    oscillatorANoise = cp5.addToggle("oscillatorANoise")
      .setPosition(x, y)
        .setSize(40, 40)
          .setCaptionLabel("osc a noise")
            .setValue((meeblip.get(oscillatorANoiseCC) == 1));

    oscillatorBOctave = cp5.addRadioButton("oscillatorBOctave")
      .setPosition(x, y+vSpace)
        .setSize(20, 20)
          .addItem("up", 0)
            .addItem("normal", 1)
              .activate(abs(meeblip.get(oscillatorBOctaveCC)-1));

    cp5.addTextlabel("oscBOctave")
      .setText("OSC B OCTAVE")
        .setPosition(x-4, y+vSpace+43)
          .setFont(5);

    x+= hSpace;

    envelopeSustain = cp5.addToggle("envelopeSustain")
      .setPosition(x, y)
        .setSize(40, 40)
          .setCaptionLabel("amp env sustain")
            .setValue((meeblip.get(envelopeSustainCC) == 1));

    antiAlias = cp5.addToggle("antiAlias")
      .setPosition(x, y+vSpace)
        .setSize(40, 40)
          .setCaptionLabel("anti-alias")
            .setValue((meeblip.get(antiAliasCC) == 1));

    x += hSpace;

    lfoDestination = cp5.addRadioButton("lfoDestination")
      .setPosition(x, y)
        .setSize(20, 20)
          .addItem("osc", 0)
            .addItem("filter", 1)
              .activate(abs(meeblip.get(lfoDestinationCC)-1));

    cp5.addTextlabel("lfoDest")
      .setText("LFO DESTINATION")
        .setPosition(x-4, y+43)
          .setFont(5);

    lfoWave = cp5.addRadioButton("lfoWave")
      .setPosition(x, y+vSpace)
        .setSize(20, 20)
          .addItem("lfoWaveSquare", 1)
            .addItem("lfoWaveTriangle", 0)
              .activate(abs(meeblip.get(lfoWaveCC)-1));

    cp5.addTextlabel("lfoWav")
      .setText("LFO WAVE")
        .setPosition(x-4, y+vSpace+43)
          .setFont(5);

    lfoWave.getItem(0).setCaptionLabel("Square");
    lfoWave.getItem(1).setCaptionLabel("Triangle");

    x += hSpace;

    lfoEnable = cp5.addToggle("lfoEnable")
      .setPosition(x, y)
        .setSize(40, 40)
          .setCaptionLabel("lfo Enable")
            .setValue((meeblip.get(lfoEnableCC) == 1));

    lfoRandom = cp5.addToggle("lfoRandom")
      .setPosition(x, y+vSpace)
        .setSize(40, 40)
          .setCaptionLabel("lfo Random")
            .setValue((meeblip.get(lfoRandomCC) == 1));

    x += hSpace;

    distortion = cp5.addToggle("distortion")
      .setPosition(x, y)
        .setSize(40, 40)
          .setCaptionLabel("distortion")
            .setValue((meeblip.get(distortionCC) == 1));

    oscillatorFm = cp5.addToggle("oscillatorFm")
      .setPosition(x, y+vSpace)
        .setSize(40, 40)
          .setCaptionLabel("oscillator FM")
            .setValue((meeblip.get(oscillatorFmCC) == 1));


    x += hSpace;

    filterMode = cp5.addToggle("filterMode")
      .setPosition(x, y)
        .setSize(40, 40)
          .setCaptionLabel("filter mode")
            .setValue((meeblip.get(filterModeCC) == 1));

    knobShift = cp5.addToggle("knobShift")
      .setPosition(x, y+vSpace)
        .setSize(40, 40)
          .setCaptionLabel("knob shift")
            .setValue((meeblip.get(knobShiftCC) == 1));
  }

  void addBanks(int x, int y) {

    int vSpace = 50;
    int hSpace = 50;

    for (int i=0; i<32; i++) {
      cp5.addBang("loadbank"+i)
        .setPosition(x+(i < 16 ? i : i-16) *hSpace, y+(i < 16 ? 0 : vSpace*2))
          .setSize(40, 40)
            .setCaptionLabel("");
    }

    y+= vSpace;

    for (int i=0; i<32; i++) {
      cp5.addBang("savebank"+i)
        .setPosition(x+(i < 16 ? i : i-16) *hSpace, y+(i < 16 ? 0 : vSpace*2))
          .setSize(40, 20)
            .setCaptionLabel(""+(i+1));
    }
  }


  void update(MeeBlip meeblip) {

    oscillatorDetune.setValue(meeblip.get(oscillatorDetuneCC));

    pwmRate.setValue(meeblip.get(pwmRateCC));

    portamento.setValue(meeblip.get(portamentoCC));

    filterEnvelopeAmount.setValue(meeblip.get(filterEnvelopeAmountCC));

    lfoLevel.setValue(meeblip.get(lfoLevelCC));

    lfoFrequency.setValue(meeblip.get(lfoFrequencyCC));

    filterCutoff.setValue(meeblip.get(filterCutoffCC));

    filterResonance.setValue(meeblip.get(filterResonanceCC));

    amplitudeAttack.setValue(meeblip.get(amplitudeAttackCC));

    amplitudeDecay.setValue(meeblip.get(amplitudeDecayCC));

    filterAttack.setValue(meeblip.get(filterAttackCC));

    filterDecay.setValue(meeblip.get(filterDecayCC));

    oscillatorAWave.activate(abs(meeblip.get(oscillatorAWaveCC)-1));

    oscillatorBWave.activate(abs(meeblip.get(oscillatorBWaveCC)-1));

    pwmSweep.setValue((meeblip.get(pwmSweepCC) == 1));

    oscillatorBEnable.setValue((meeblip.get(oscillatorBEnableCC) == 1));

    oscillatorANoise.setValue((meeblip.get(oscillatorANoiseCC) == 1));

    oscillatorBOctave.activate(abs(meeblip.get(oscillatorBOctaveCC)-1));

    envelopeSustain.setValue((meeblip.get(envelopeSustainCC) == 1));

    antiAlias.setValue((meeblip.get(antiAliasCC) == 1));

    lfoDestination.activate(abs(meeblip.get(lfoDestinationCC)-1));

    lfoWave.activate(abs(meeblip.get(lfoWaveCC)-1));

    lfoEnable.setValue((meeblip.get(lfoEnableCC) == 1));

    lfoRandom.setValue((meeblip.get(lfoRandomCC) == 1));

    distortion.setValue((meeblip.get(distortionCC) == 1));

    oscillatorFm.setValue((meeblip.get(oscillatorFmCC) == 1));

    filterMode.setValue((meeblip.get(filterModeCC) == 1));

    knobShift.setValue((meeblip.get(knobShiftCC) == 1));
  }

  int get(int cc) {

    int val = (int) 0;

    switch(cc) {
    case filterResonanceCC:
      val = (int) filterResonance.getValue();
      break;
    case filterCutoffCC :
      val = (int) filterCutoff.getValue();
      break;
    case lfoFrequencyCC :
      val = (int) lfoFrequency.getValue();
      break;
    case lfoLevelCC :
      val = (int) lfoLevel.getValue();
      break;
    case filterEnvelopeAmountCC :
      val = (int) filterEnvelopeAmount.getValue();
      break;
    case portamentoCC :
      val = (int) portamento.getValue();
      break;
    case pwmRateCC :
      val = (int) pwmRate.getValue();
      break;
    case oscillatorDetuneCC :
      val = (int) oscillatorDetune.getValue();
      break;
    case filterDecayCC :
      val = (int) filterDecay.getValue();
      break;
    case filterAttackCC :
      val = (int) filterAttack.getValue();
      break;
    case amplitudeDecayCC :
      val = (int) amplitudeDecay.getValue();
      break;
    case amplitudeAttackCC :
      val = (int) amplitudeAttack.getValue();
      break;
    case oscillatorFmCC :
      val = (int) oscillatorFm.getValue();
      break;
    case lfoRandomCC:
      val = (int) lfoRandom.getValue();
      break;
    case lfoWaveCC :
      val = (int) lfoWave.getValue();
      break;
    case filterModeCC :
      val = (int) filterMode.getValue();
      break;
    case distortionCC :
      val = (int) distortion.getValue();
      break;
    case lfoEnableCC :
      val = (int) lfoEnable.getValue();
      break;
    case lfoDestinationCC :
      val = (int) lfoDestination.getValue();
      break;
    case antiAliasCC :
      val = (int) antiAlias.getValue();
      break;
    case oscillatorBOctaveCC :
      val = (int) oscillatorBOctave.getValue();
      break;
    case oscillatorBEnableCC :
      val = (int) oscillatorBEnable.getValue();
      break;
    case oscillatorBWaveCC :
      val = (int) oscillatorBWave.getValue();
      break;
    case envelopeSustainCC :
      val = (int) envelopeSustain.getValue();
      break;
    case oscillatorANoiseCC :
      val = (int) oscillatorANoise.getValue();
      break;
    case pwmSweepCC :
      val = (int) pwmSweep.getValue();
      break;
    case oscillatorAWaveCC :
      val = (int) oscillatorAWave.getValue();
      break;
    }

    return val;
  }

  void updateRandom(Randomizer randomizer) {
    for (Integer key : randomizer.config.keySet()) { 
      println("Setting component value for :"+ key);
      switch (key) {
      case 48:
        filterResonanceRandomToggle.setValue(randomizer.config.get(key).active);
        filterResonanceRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 49:
        filterCutoffRandomToggle.setValue(randomizer.config.get(key).active);
        filterCutoffRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 50:
        lfoFrequencyRandomToggle.setValue(randomizer.config.get(key).active);
        lfoFrequencyRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 51:
        lfoLevelRandomToggle.setValue(randomizer.config.get(key).active);
        lfoLevelRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 52:
        filterEnvelopeAmountRandomToggle.setValue(randomizer.config.get(key).active);
        filterEnvelopeAmountRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 53:
        portamentoRandomToggle.setValue(randomizer.config.get(key).active);
        portamentoRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 54:
        pwmRateRandomToggle.setValue(randomizer.config.get(key).active);
        pwmRateRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 55:
        oscillatorDetuneRandomToggle.setValue(randomizer.config.get(key).active);
        oscillatorDetuneRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 58:
        filterDecayRandomToggle.setValue(randomizer.config.get(key).active);
        filterDecayRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 59:
        filterAttackRandomToggle.setValue(randomizer.config.get(key).active);
        filterAttackRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 60:
        amplitudeDecayRandomToggle.setValue(randomizer.config.get(key).active);
        amplitudeDecayRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 61:
        amplitudeAttackRandomToggle.setValue(randomizer.config.get(key).active);
        amplitudeAttackRandom.setRangeValues(randomizer.config.get(key).min, randomizer.config.get(key).max);
        break;
      case 64:
        knobShiftRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 65:
        lfoRandomRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 66:
        lfoWaveRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 67:
        filterModeRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 68:
        oscillatorFmRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 69:
        distortionRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 70:
        lfoEnableRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 71:
        lfoDestinationRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 72:
        antiAliasRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 73:
        oscillatorBOctaveRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 74:
        oscillatorBEnableRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 75:
        oscillatorBWaveRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 76:
        envelopeSustainRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 77:
        oscillatorANoiseRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 78:
        pwmSweepRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      case 79:
        oscillatorAWaveRandomToggle.setValue(randomizer.config.get(key).active);
        break;
      }
    }
  }
}

