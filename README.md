# GestVM

## Introduction

GestVM implements a so-called "gesture synthesizer",
sequenced and controlled via the Uxn Virtual machine.

A Gesture Synthesizer is an audio-rate control signal
generator whose timing is managed by another audio-rate
control signal generator, called a conductor.

Conceptually, a Gesture can be thought of as something
between an automation curve and breakpoint line generator.

## Overview of System

An instance of an Uxn VM is created inside of
sndkit, and a ROM is loaded. One more signal generators,
called nodes, are then created, which can concurrently
evaluate the Uxn VM with different starting memory
positions. Each node implements a gesture synthesizer, whose
state can be controlled via an Uxn virtual output device.
For input, a node takes in a "conductor" signal, which is
periodic rising ramp signal commonly referred as a phasor.

The synthesized gesture signal produced by nodes can then
be used to modulate parameters in other sndkit nodes. A
common parameter is the pitch of an oscillator.

## Compilation

To use GestVM, first compile and install sndkit.
Sndkit can be found on [github](https://github.com/paulbatchelor/sndkit)
or [sourcehut](https://git.sr.ht/~pbatch/sndkit).

Running `make` will build the `gestvm` binary (the sndkit
LIL interpreter with added gestvm words), as well
as a modified version of the `uxnasm` utility used to
assemble Uxn ROMs.

## Running Examples

Examples can be found in the "examples" folder. Running
the script `./render.sh` will compile the Uxn
programs and then render sndkit program which
loads the ROM and generates the WAV files.

Each example comes with a Uxn program (".tal" extension)
and a sndkit patch (".lil" extension). From these
a ROM file (".rom") and WAV audio file (".wav") are
generated.

`sequence` is a program which produces a sequence that
gets proportionally faster every time it repeats. It
starts with eigth notes, then triplets, then sixteenths,
etc. Eventually it will hit a limit and start slowing
down again.

`skew` is a program which tests out a concept called
*temporal skewing*, a process which allows tempo to be
locally warped without adding or subtracting time overall.
This example has a phrase which uses an exponential
temporal skewing curve to perform an accelerando over
9 beats.

`weight` is a program which tests out a concept called
*temporal weight*, a process which gives the notes themselves
to warp global tempo. This program produces a lyrical
melody that uses weight to programatically
shape the phrasing.
