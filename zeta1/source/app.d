import std.stdio;
import std.complex;

void main()
{
    auto 虚実 = complex(0.0L, 1.0L);
    writeln(虚実);
    writeln(虚実^^2.0L);

    auto 複実 = 1.0L + 虚実;
    writeln(複実);
    writeln(複実^^2.0L);
}
