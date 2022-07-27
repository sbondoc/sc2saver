/* "loop.c" - Implementation for main loop. */
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include "system.h"
/* Watch bank file for changes. */
void listen_bank(char *path)
{
	FILE *fp;
	/* Touch bank file. */
	if (!(fp = fopen(path, "a+")))
	{
		fprintf(stderr, "Error opening bank file.");
		exit(EXIT_FAILURE);
	}
	fclose(fp);
	/* Display status message. */
	fprintf(stdout, "SC2Saver is currently listening to bank file at:\n%s\n", path);
	fflush(stdout);
	/* Init bank file stat. */
	struct stat attr;
	stat(path, &attr);
	time_t old = attr.st_mtime, new;
	/* Main loop. */
	while (true)
	{
		stat(path, &attr);
		new = attr.st_mtime;
		/* Simulate F10 + V + Enter keystrokes if bank change detected. */
		if (new != old)
		{
			press_key(0x79);
			press_key(0x56);
			press_key(0x0D);
		}
		old = new;
	}
}
