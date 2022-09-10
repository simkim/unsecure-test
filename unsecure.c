#include "sys/types.h"
#include "unistd.h"

int main(int argc, char *argv[]) {
	setreuid(40000, 40000);
	execvp("id", argv);
}
