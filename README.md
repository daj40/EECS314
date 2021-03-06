# MIDI MIPS Player and Synthesizer

```
                                  |\
             __  __ __  __ ____   | |
            |  \/  |  \/  |  _ \  |/
            | |\/| | |\/| | |_) |/|_ 
            | |  | | |  | |  __///| \
            |_|  |_|_|  |_|_|  | \|_ |
			                    \_|_/
								  |
							     @'
    _______________________________________________________
   |:::::: o o o o . |..... . .. . | [45]  o o o o o ::::::|
   |:::::: o o o o   | ..  . ..... |       o o o o o ::::::|
   |::::::___________|__..._...__._|_________________::::::|
   | # # | # # # | # # | # # # | # # | # # # | # # | # # # |
   | # # | # # # | # # | # # # | # # | # # # | # # | # # # |
   | # # | # # # | # # | # # # | # # | # # # | # # | # # # |
   | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
   |_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|
```

## Console commands

- `play` - plays music added or loaded thus far
- `play n v d i` - plays a single note n, with velocity v, for duration n on instrument i
- `add n v d i` - adds a note n, with velocity v, and duration d, to the working track using instrument i
- `cat` - display a listing of notes in the track thus far
- `load f` - load a previously saved MIDI file from file location f.
- `save f` - save the working track to file location f
- `help` - display commands available


## Instruments:

**TBD based on patch availability**


## Midi stored internally as 6 byte sequences:

```
ss ss ii nn vv dd
```

- `s` - start time
- `ii` - instrument (channel, in reality)
- `n` - note
- `v` - velocity
- `d` - duration, in eight notes
