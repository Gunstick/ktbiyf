sampack
=======
This is Gunstick's lossy 8bit to 4bit sound compressor.
It can handle raw 8bit files, signed or unsigned.
Adds some hiss to the sound. This is usually unnoticeable
on a noisy STF playback.

some more infos in the forum
http://www.atari-forum.com/viewtopic.php?p=31956#p31956

### compressing:

usage: `sampack -k infile.dat outfile.dmn`

### decompressing:

usage: `sampack -d infile.dmn outfile.dat`

This was probably used as-is to create the *.xsd files of KTBIYF

So uncompress with: `sampack -d theme.xsd theme.snd`

verify: `sox -t raw -e signed -b8 -c1 -r16000  theme.snd -t wav - | aplay`

Quality test (for linux users):

    sox test.wav -t raw -e unsigned -b 8 -c 1 input.dat   # convert to raw
    sox -t raw -e unsigned -b8 -c1 -r16000 input.dat input.wav  # back to wav
    make sampack         # compile tool
    ./sampack -k input.dat input.dmn     # create domino kompressed file
    ./sampack -d input.dmn output.dat  # decompress file again
    sox -t raw -e unsigned -b8 -c1 -r16000  output.dat output.wav # convert to wav
    aplay input.wav # play original
    aplay output.wav # play kompressed
    sox -m -v 1 input.wav -v -1 output.wav sound-difference.wav
    aplay sound-difference.wav # play the difference caused by compression
    rm input.dat input.dmn input.wav output.dat output.wav sound-difference.wav # cleanup


