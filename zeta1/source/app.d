import std.stdio;

void main()
{
    ireal 虚実 = 1.0i;
    writeln(虚実);
    writeln(虚実^^2.0);

    creal 複実 = 1.0 + 虚実;
    writeln(複実);
    writeln(複実^^2.0);
}
