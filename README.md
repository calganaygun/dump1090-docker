# Dump1090 Docker

This is a Docker image for [antirez's dump1090](https://github.com/antirez/dump1090).

Normal usage
---

To capture traffic directly from your RTL device and show the captured traffic
on standard output, just run the program without options at all:

    docker run -it --device=/dev/bus/usb --rm calganaygun/dump1090 

To just output hexadecimal messages:

    docker run -it --device=/dev/bus/usb --rm calganaygun/dump1090 --raw

To run the program in interactive mode:

    docker run -it --device=/dev/bus/usb --rm calganaygun/dump1090 --interactive

To run the program in interactive mode, with networking support, and connect
with your browser to http://localhost:8080 to see live traffic:

    docker run -it --device=/dev/bus/usb --rm -p 8080:8080 calganaygun/dump1090 --interactive --net

In interactive mode it is possible to have a less information dense but more
"arcade style" output, where the screen is refreshed every second displaying
all the recently seen aircrafts with some additional information such as
altitude and flight number, extracted from the received Mode S packets.

Additional options
---

Dump1090 can be called with other command line options to set a different
gain, frequency, and so forth. For a list of options use:

    docker run -it --device=/dev/bus/usb --rm calganaygun/dump1090 --help

Everything is not documented here should be obvious, and for most users calling
it without arguments at all is the best thing to do.