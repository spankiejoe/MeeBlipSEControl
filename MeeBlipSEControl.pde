import controlP5.*;
import rwmidi.*;
import java.io.*;

import java.util.Properties;

final int filterResonanceCC = 48;
final int filterCutoffCC = 49;
final int lfoFrequencyCC = 50;
final int lfoLevelCC = 51;
final int filterEnvelopeAmountCC = 52;
final int portamentoCC = 53;
final int pwmRateCC = 54;
final int oscillatorDetuneCC = 55;
final int filterDecayCC = 58;
final int filterAttackCC = 59;
final int amplitudeDecayCC = 60;
final int amplitudeAttackCC = 61;

final int knobShiftCC = 64;
final int oscillatorFmCC = 65;
final int lfoRandomCC = 66;
final int lfoWaveCC = 67;
final int filterModeCC = 68; // Buggy // Patch bank
final int distortionCC = 69;
final int lfoEnableCC = 70;
final int lfoDestinationCC = 71;
final int antiAliasCC = 72;
final int oscillatorBOctaveCC = 73;
final int oscillatorBEnableCC = 74;
final int oscillatorBWaveCC = 75;
final int envelopeSustainCC = 76;
final int oscillatorANoiseCC = 77;
final int pwmSweepCC = 78;
final int oscillatorAWaveCC = 79;


ControlP5 cp5;
CP5Layout layout;
ListBox outputDeviceList;

CP5toMidi ctrl;
MeeBlip meeblip;

Randomizer randomizer;


int currentTab = 1;

void setup() {
  size(1024, 768);

  cp5 = new ControlP5(this);

  meeblip = new MeeBlip();
  randomizer = new Randomizer();

  ctrl = new CP5toMidi(meeblip);

  layout = new CP5Layout(cp5, meeblip);
}


void draw() {
  background(100);
}

void keyPressed() {
  if (key == ' ') {
    ctrl.sendNoteOn(0, 20, 127);
  }
  else if (key == 'r') {
    meeblip.shuffle(randomizer);
    layout.update(meeblip);
  }
  else if (key =='t') {
    randomizer.event("", 1);
  }
}

void controlEvent(ControlEvent event) {

  String name = event.name();

  if (event.isTab()) {
    currentTab = event.getTab().getId();
    println("Tab Switch to "+currentTab);
  } 

  else {
    if (currentTab == 1) {
      if (name.length() >= 4 && name.substring(0, 4).equals("load")) {
        int n = Character.isDigit(name.charAt(name.length()-2)) ? 2 : 1;
        int bank = Integer.parseInt(name.substring(name.length()-n));
        println("Load bank "+bank);
        meeblip.loadConfig(bank);
        layout.update(meeblip);
      }

      else if (name.length() >= 4 && name.substring(0, 4).equals("save")) {
        int n = Character.isDigit(name.charAt(name.length()-2)) ? 2 : 1;
        int bank = Integer.parseInt(name.substring(name.length()-n));
        println("Save bank "+bank);
        meeblip.saveConfig(bank);
      }

      else if (name.equals("randomBang")) {
        meeblip.shuffle(randomizer);
        layout.update(meeblip);
      }
      else {
        String cc = event.name();
        int value = (int) event.value();
        ctrl.event(cc, value);
        //int code = 0;//layout.getCode(cc);
      }
    }
    else if (currentTab == 2) {
      String cc = event.name();
      
      if (cc.contains("UncheckAll")) {
         randomizer.uncheckAll();
         layout.updateRandom(randomizer);
      }
      else if (cc.contains("CheckAll")) {
        randomizer.checkAll();
        layout.updateRandom(randomizer);
      }
      else if (cc.contains("Default")) {
        randomizer.defaultRange();
        layout.updateRandom(randomizer);
      }
      else if (cc.contains("Save")) {
         randomizer.saveConfig();
      }
      else if (cc.contains("Load")) {
        randomizer.loadConfig();
        layout.updateRandom(randomizer);
      }
      else if (event.isGroup() && event.name().equals("output devices")) {
        int deviceIndex = (int) event.group().value();
        println("Will change device to: "+deviceIndex);
        ctrl.setOutput(deviceIndex);
      }

      else if (cc.contains("Toggle")) {
        int value = (int) event.value();
        println(cc, value);
        randomizer.event(cc, value);
      }
      else {
        randomizer.event(cc, (int) event.getArrayValue()[0], (int) event.getArrayValue()[1]);
      }
    }
  }
}

