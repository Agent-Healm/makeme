# 
CC		:= g++
CFLAGS		:= -Wall -Wextra

OBJECT_ROOT	:= ./obj
PROJECT_ROOT	:= ./src

TARGET 		:= ./output/make_me

.PHONY: all clean




all: final
	$(TARGET)

final: main.o
	$(CC) $(CFLAGS) \
		$(OBJECT_ROOT)/main.o \
		-o $(TARGET)

%.o: $(PROJECT_ROOT)/%.cpp
	$(CC) $(CFLAGS) \
		-c $< \
		-o $(OBJECT_ROOT)/$@

clean:
	@echo clear
	rm -rf \
		$(TARGET) \
		$(OBJECT_ROOT)/*
