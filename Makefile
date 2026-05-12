# 
CC	:= g++
# CFLAGS	:= -Wall -Wextra

TARGET 	:= make_me

.PHONY: all clean

all: final
	@echo all
	./$(TARGET)

final: main.o
	@echo final
	$(CC) main.cpp -o $(TARGET)

main.o: main.cpp
	@echo compiling main.cpp
	$(CC) main.cpp -o main.o

clean:
	@echo clear
	rm -rf *.o $(TARGET)
