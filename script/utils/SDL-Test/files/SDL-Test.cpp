#include <stdio.h>
#include <stdlib.h>
#include "SDL.h"

bool stop = false;

#define GETHATCODE(event) ((event.jhat.which+1)<<12)|(event.jhat.hat<<2)|\
  (event.jhat.value & SDL_HAT_UP ? 0 : event.jhat.value & SDL_HAT_DOWN ? 1 : event.jhat.value & SDL_HAT_RIGHT ? 2 : event.jhat.value & SDL_HAT_LEFT ? 3 : 0)

#define GETBUTTONCODE(event) ((event.jbutton.which+1)<<12)|(event.jbutton.button+0x80)

#define GETAXISCODE(event) ((event.jaxis.which+1)<<12)|(event.jaxis.axis<<1)|(event.jaxis.value > 16384 ? 1 : event.jaxis.value < -16384 ? 0 : 0)

void poll()
{
  SDL_Event event;
  while(SDL_PollEvent(&event)) {
    switch(event.type) {
    case SDL_JOYHATMOTION:
      printf("JOY HAT code: %04x\n", GETHATCODE(event));
      break;
    case SDL_JOYBUTTONDOWN:
      printf("JOY BUTTON code: %04x\n", GETBUTTONCODE(event));
      break;
    case SDL_JOYAXISMOTION:
      printf("JOY AXIS code: %04x\n", GETAXISCODE(event));
      break;
    case SDL_KEYDOWN:
      printf("KEY code: %04x\n", event.key.keysym.sym);
      break;
    case SDL_KEYUP:
      if(event.key.keysym.sym == SDLK_ESCAPE)
        stop = true;
      break;
    }
  }
}

int main(int argc, char **argv)
{
  if(SDL_Init(SDL_INIT_TIMER|SDL_INIT_VIDEO|SDL_INIT_NOPARACHUTE)) {
    printf("Failed to init SDL: %d\n", SDL_GetError());
    exit(-1);
  }

  if(SDL_InitSubSystem(SDL_INIT_JOYSTICK)) {
    printf("Failed to init joystick: %d\n", SDL_GetError());
  }

  SDL_Surface *surface = SDL_SetVideoMode(100,100, 16,
                                          SDL_ANYFORMAT);
  int numJoy = SDL_NumJoysticks();
  
  for(int i = 0; i < numJoy; i++) {
    SDL_JoystickOpen(i);
  }
  SDL_JoystickEventState(SDL_ENABLE);

  while(!stop) {
    poll();
    SDL_Delay(100);
  }
  SDL_Quit();
  return 0;
}
