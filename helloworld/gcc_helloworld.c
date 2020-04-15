#include <stdio.h>

int main() {
	char* hw = "Hello World!";
	char* fs = "%s %d\n";
	int i = 42;
	printf(fs, hw, i);
	return 0;
}
