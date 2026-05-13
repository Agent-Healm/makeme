# Compiler flags
CXX		:= g++
CXXFLAGS	:= -Wall -Iinclude -Wextra

# Dependency flags
# DEPFLAGS	:= -MMD -MP

# Directories
OBJECT_ROOT	:= ./obj
PROJECT_ROOT	:= ./src
# INCLUDE_ROOT	:= ./include
OUTPUT_ROOT	:= ./output
TARGET 		:= $(OUTPUT_ROOT)/make_me

# CPP files
CXXSRC 		:= $(shell find $(PROJECT_ROOT) -name "*.cpp")
CXXOBJ		:= $(patsubst ./src/%.cpp, ./obj/%.o, $(CXXSRC))

.PHONY: all clean





all: final
	$(TARGET)

final: $(CXXOBJ)
	@mkdir -p $(OUTPUT_ROOT)
	$(CXX) $(CXXFLAGS) \
		$(CXXOBJ) \
		-o $(TARGET)

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
