# Compiler flags
CXX		:= g++
CXXFLAGS	:= -Wall -Iinclude -Wextra

# Automatic dependency flags
DEPFLAGS	:= -MMD -MP -MF

# Directories
OBJECT_ROOT	:= ./obj
PROJECT_ROOT	:= ./src
# INCLUDE_ROOT	:= ./include
DEP_ROOT	:= ./deps
OUTPUT_ROOT	:= ./output
TARGET 		:= $(OUTPUT_ROOT)/make_me

# CPP files
CXXSRC 		:= $(shell find $(PROJECT_ROOT) -name "*.cpp")
CXXOBJ		:= $(patsubst $(PROJECT_ROOT)/%.cpp, $(OBJECT_ROOT)/%.o, $(CXXSRC))

# .d files
DEPS		:= $(patsubst $(PROJECT_ROOT)/%.cpp, $(DEP_ROOT)/%.d, $(CXXSRC))

# these targets don't output a new file, mark them as phony
# without these, a file named "clean" would block the makefile target from ever executing
.PHONY: all clean show find





all: final
	@$(TARGET)

final: $(CXXOBJ)
	@mkdir -p $(OUTPUT_ROOT)
	$(CXX) $(CXXFLAGS) \
		$(CXXOBJ) \
		-o $(TARGET)

$(OBJECT_ROOT)/%.o: $(PROJECT_ROOT)/%.cpp
# 	@echo $< to $@
# 	@echo file: $* 
# 	@echo preq: $^
	@mkdir -p $(dir $@)
	@mkdir -p $(dir $(DEP_ROOT)/$*)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) \
		$(DEP_ROOT)/$*.d \
		-c $< \
		-o $@

clean:
	@echo clean
	@rm -rf \
		$(OUTPUT_ROOT)/* \
		$(OBJECT_ROOT)/* \
		$(DEP_ROOT)

show:
	@echo sources: $(CXXSRC)
	@echo object: $(CXXOBJ)

find:
	@find $(PROJECT_ROOT) -name "*.cpp"

remake: clean all





-include $(DEPS)