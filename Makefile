# Variables
CC = gcc
CFLAGS= -g -Wall -std=gnu99
TARGET = ex1
CHILD_EXEC = child
INCLUDES = inc

# Build the parent process and child exec program
all: $(TARGET) $(CHILD_EXEC)

# Rule to compile the main program (ex1)
$(TARGET): src/ex1.c src/errExit.c
	$(CC) -I $(INCLUDES) $(CFLAGS) -o $(TARGET) src/ex1.c

# Rule to compile the child exec program
$(CHILD_EXEC): src/child.c src/errExit.c
	$(CC) -I $(INCLUDES) $(CFLAGS) -o $(CHILD_EXEC) src/child.c

# Clean up the generated files
clean:
	rm -f $(TARGET) $(CHILD_EXEC) src/*.o

# Phony targets
.PHONY: all clean run

