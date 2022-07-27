/* "main.c" - Argument processing. */
#define PATH_MAX 256
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "loop.h"
int main(int argc, char *argv[])
{
	char path[PATH_MAX];
	if (1 < argc)
	{
		snprintf(path, sizeof(path), "%s", argv[1]);
	}
	else
	{
		if (!getcwd(path, sizeof(path)))
		{
			fprintf(stderr, "Error retrieving current working directory.\n");
			return EXIT_FAILURE;
		}
		snprintf(path, sizeof(path), "%s\\SC2Saver.SC2Bank", path);
	}
	listen_bank(path);
	return EXIT_SUCCESS;
}
