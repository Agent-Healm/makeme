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
OUTPUT_ROOT	:= ./output
TARGET 		:= $(OUTPUT_ROOT)/make_me


.PHONY: all clean



# CSOURCES 	:= $(wildcard *.c)
# CXXSRC 	:= $(wildcard /*.cpp)

CXXSRC 		:= $(shell find $(PROJECT_ROOT) -name "*.cpp")

# CXXOBJ		:= $(CXXSRC:.cpp=.o)
# CXXOBJ2		:= $(notdir $(CXXOBJ))
CXXOBJ := $(patsubst ./src/%.cpp, ./obj/%.o, $(CXXSRC))


all: final
	$(TARGET)

# final: main.o
# 		$(OBJECT_ROOT)/main.o
final: $(CXXOBJ)
	@mkdir -p $(OUTPUT_ROOT)
	$(CXX) $(CXXFLAGS) \
		$(CXXOBJ) \
		-o $(TARGET)

# %.o: $(PROJECT_ROOT)/%.cpp 
# 	$(CXX) $(CXXFLAGS) \
# 		-c $< \
# 		-o $(OBJECT_ROOT)/$@
$(OBJECT_ROOT)/%.o: ./$(PROJECT_ROOT)/%.cpp 
# 	@echo $< to $@ 
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) \
		-c $< \
		-o $@

clean:
	@echo clear
	@rm -rf \
		$(OUTPUT_ROOT)/* \
		$(OBJECT_ROOT)/*
