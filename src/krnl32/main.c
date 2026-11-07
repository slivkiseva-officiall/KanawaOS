#include "libes/ports.h"

extern kprint(const char *);
extern kputs(const char *);
extern vga_init(void);

void load() {
	vga_init();
	
	__asm__("jmp kmain\n");
}

void kmain(void) {
	kprint("loaded.");
}
