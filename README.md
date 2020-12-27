rs97-commander-sdl2

Modify based on https://github.com/glebm/rs97-commander

supports Odroid Go Advance devices and clones using ArkOS

Build instructions (Works best in 32 bit Arm environment)
==================

package requirements: SDL2 SDL2_image SDL2_gfx SDL2_ttf SDL2-dev SDL2_image-dev SDL2_gfx-dev SDL2_ttf-dev

git clone https://github.com/christianhaitian/rs97-commander-sdl2.git \
cd rs97-commander-sdl2 \
make (or use make -j2 or -j3 if you have the additional core and memory to handle this to speed up the build)

**Notes** 
- The res folder will need to be copied to /opt/dingux folder.  You can change this location in Makefile
- Font size can be changed in Makefile
- will read and assign keys from /home/ark/.config/retroarch32/retroarch.cfg.  This can be changed in the window.cpp starting at line 51
