#include "../libes/string.h"

int strlen(const char *s1) {
	int i = 0;
	while (*s1) {
		++i;
		++s1;
	}
}

int strcmp(const char *s1, const char *s2) {
	int i = 0;
	for (; s1[i]; ++i) {
		if (s1[i] != s2[i]) break;
	}
	return s1[i] - s2[i];
}

int strcpy(char *src, char *dest) {

	return 0;
}