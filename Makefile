TARGET_EXEC ?= andromeda.exe

ARCH := $(shell getconf LONG_BIT)

BIN_DIR ?= ./Bin/Release/x$(ARCH)
BUILD_DIR ?= ./Build

.PHONY: clean

run:
	$(BIN_DIR)/$(TARGET_EXEC)

clean:
	find $(BIN_DIR) \! -name "*.dll" -type f -delete
	$(RM) -r $(BUILD_DIR)