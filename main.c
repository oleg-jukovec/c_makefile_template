#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char * argv[])
{
  int i;
	int *nonfree = malloc(sizeof(int));
	*nonfree = i;

	printf("Hello, World!");
	return 0;
}
