# Compiler flags
CXX		:= g++
CXXFLAGS	:= -Wall -Iinclude
# -Wextra

# Dependency flags
# DEPFLAGS	:= -MMD -MP

# Directories
OBJECT_ROOT	:= ./obj
PROJECT_ROOT	:= ./src
INCLUDE_ROOT	:= ./include
TARGET 		:= ./output/make_me


.PHONY: all clean



# CSOURCES 	:= $(wildcard *.c)
# CXXSRC 	:= $(wildcard /*.cpp)

CXXSRC 		:= $(shell find $(PROJECT_ROOT) -name "*.cpp")
CXXOBJ		:= $(CXXSRC:.cpp=.o)
# CXXOBJ2		:= $(notdir $(CXXOBJ))

# all: final
# 	$(TARGET)

# final: main.o
# 	$(CXX) $(CXXFLAGS) \
# 		$(OBJECT_ROOT)/main.o \
# 		-o $(TARGET)

# %.o: $(PROJECT_ROOT)/%.cpp 
# 	$(CXX) $(CXXFLAGS) \
# 		-c $< \
# 		-o $(OBJECT_ROOT)/$@

# show:
# 	@echo sources: $(CXXSRC)
# 	@echo objects: $(CXXOBJ)
# 	@echo objects: $(CXXOBJ)

# c: main.o addint.o subint.o

CXXOBJ2 := $(patsubst ./src/%.cpp, ./obj/%.o, $(CXXSRC))

# test: 
# 	@echo $(CXXOBJ)
# 	@echo $(CXXOBJ2)

# all: $(CXXOBJ)
all: $(CXXOBJ2)

$(OBJECT_ROOT)/%.o: ./$(PROJECT_ROOT)/%.cpp 
# 	@echo $< to $@ 
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) \
		-c $< \
		-o $@

clean:
	@echo clear
	rm -rf \
		$(TARGET) \
		$(OBJECT_ROOT)/*
