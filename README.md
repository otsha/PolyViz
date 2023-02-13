# Polyrythm Visualizer

Visualizing polyrythms with [Processing](https://processing.org/) (4.0.1) and the [Processing Sound library](https://processing.org/reference/libraries/sound/index.html).

Does not feature much in terms of user interface, all parameters have to be adjusted manually in code. See below.

## Usage

### Running the Sketch

- Clone the repository
- Open the folder in the Processing Development Environment (PDE)
- Run
- Press the **left** arrow key to start the clock. You should now see and hear the different sequencers in action.

### Sequencing

#### Relevant Components Explained

`Clock.pde` is at the heart of the application. A clock controls a list of sequencers (essentially one clock should be enough unless you want to do some *really wacky* stuff).
- You can adjust the tempo (beats per minute; BPM) in `shapesynth.pde`. The default is 120.
- Each beat is divided into 128 ticks - meaning that the shortest note the application can play is a 1/512th note.
- The clock adjusts for drift as a 32-tick moving average (see `update()` and `driftAdjustment()` in `Clock.pde`.

`Sequencer.pde` is the instrument unit within the application. It determines the oscillator type, time signature and sequence of an instrument, in addition to the size and shape of the polygon visualizing it.
- The first parameter of the `Sequencer` class is the Processing applet itself. This is to allow using the audio library to play sounds from elsewhere in the application.
- Four oscillator types are currently defined in the `OscType` enum. These are `SAW`, `TRI`, `SQR` and `SIN` from the sound library.

`Sequence.pde` is a list of steps (`Step.pde`) that are played in order.
`Step.pde` contains note frequency information (abstracted in the `Note.pde` enum) in addition to the envelope attack, sustain and release parameters for a given sequencer step.
`Scale.pde` is currently unused, but could be used for generative sequencing in the future (playing random notes from a scale). Alternatively this could just be done wit the existing `Sequencer` class.

#### Creating a Sequence

To play a sequence, we need a `Clock`, a `Sequencer` and a `Sequence`.

```Java
Clock clock;
Sequencer seq;
Sequence steps;
```

Then, we need to define the steps in the `Sequence`.

```Java
steps = new Sequence();
Step[] stepInfo = {
    new Step(Note.C, 4, 0.05, 0.0, 1.0),
    new Step(Note.E, 4, 0.05, 0.0, 1.0),
    new Step(Note.G, 4), // The A/S/R parameters can be left out.
};
steps.addAll(stepInfo);
```

Now, we need to initialize a `Sequencer` with our sequence.

```Java
seq = new Sequencer(this, OscType.SQR, steps, 75, 4, 1.0/4.0); // Visualizer shape is a square (4-point polygon) and time signature 1/4
```

Finally, the clock needs to be initialized:

```Java
Sequencer[] allSequencers = { seq };
clock = new Clock(millis(), 120.0, allSequencers);
```

## Thoughts & Future Development Potential

As the sequencing example shows, the system is still quite convoluted with a high number of steps. To actually work as a visualizer tool rather than a programming demo / toy, a sequencing GUI is needed.
