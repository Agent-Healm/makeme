# 
CXX		:= g++
CXXFLAGS	:= -Wall -Iinclude
# -Wextra

OBJECT_ROOT	:= ./obj
PROJECT_ROOT	:= ./src
INCLUDE_ROOT	:= ./include

TARGET 		:= ./output/make_me

.PHONY: all clean




all: final
	$(TARGET)

final: main.o
	$(CXX) $(CXXFLAGS) \
		$(OBJECT_ROOT)/main.o \
		-o $(TARGET)

%.o: $(PROJECT_ROOT)/%.cpp include/func.hpp
	$(CXX) $(CXXFLAGS) \
		-c $< \
		-o $(OBJECT_ROOT)/$@

clean:
	@echo clear
	rm -rf \
		$(TARGET) \
		$(OBJECT_ROOT)/*
