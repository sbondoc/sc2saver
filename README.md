# SC2Saver
Keyboard event interceptor for creating saved games via trigger in Starcraft II.
## Usage
**This repository is only for you if you'd like to build SC2Saver yourself from source.** If you don't know what that means/just want to use SC2Saver for your maps, please see the full usage and installation instructions on [SC2Mapster](https://sc2mapster.com/projects/sc2saver "Project page").
## Build
An installation of [MinGW](https://osdn.net/projects/mingw)/[MinGW-64](https://mingw-w64.org) should provide you with all the necessary build tools.
### Requirements 
* **[GNU Make](https://gnu.org/software/make)** - Required to run build script.
* **[GCC](https://gcc.gnu.org/install/binaries.html)** - Called by Makefile to compile and link source files.
* **`windres` (from MinGW/MinGW-64)** - Called by Makefile to compile icon resource.

Use Make from the command line in the repository root to build:
```
make
```
The output executable should be located at `bin/SC2Saver.exe`.
