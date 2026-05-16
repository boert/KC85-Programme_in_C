# PC-Programm

Mit diesem Programm können die Prüfsummen auf dem PC evaluiert werden (C++-Compiler erforderlich).

```
./fletcher
zero    Länge 8192    crc16 CF9F    Adler-16 A001    fletcher 255 0000    fletcher 256 0000    fletcher KC 0000    XOR8  00    sum16 0000
ones    Länge 8192    crc16 F9AF    Adler-16 EFA1    fletcher 255 1220    fletcher 256 0000    fletcher KC 0001    XOR8  00    sum16 2000
55h     Länge 8192    crc16 2FA1    Adler-16 622F    fletcher 255 00AA    fletcher 256 0000    fletcher KC 0055    XOR8  00    sum16 A000
FFs     Länge 8192    crc16 FFFC    Adler-16 E18B    fletcher 255 0000    fletcher 256 0000    fletcher KC 00FF    XOR8  00    sum16 E000
```
