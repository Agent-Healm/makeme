# 
CC		:= g++
CFLAGS		:= -Wall -Wextra

OBJECT_ROOT	:= ./obj
PROJECT_ROOT	:= ./src

TARGET 		:= ./output/make_me


.PHONY: all clean

all: final
	./$(TARGET)

final: main.o
	$(CC) \
		$(PROJECT_ROOT)/main.cpp \
		-o $(TARGET)

main.o: $(PROJECT_ROOT)/main.cpp
	$(CC) $(CFLAGS) \
		$(PROJECT_ROOT)/main.cpp \
		-o $(OBJECT_ROOT)/main.o

clean:
	@echo clear
	rm -rf \
		$(TARGET) \
		$(OBJECT_ROOT)/*
