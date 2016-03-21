import std.stdio;
import std.complex : abs, complex;

import zeta : ZEROS, ζ;

void main() {
    foreach(t; ZEROS) {
        writefln("%1$g %1$a", abs(ζ(complex(0.5L, t[0]))));
    }
}
