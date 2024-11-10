# See LICENSE for details
# makefile for tdc

.PHONY: all clean dist install uninstall
.DEFAULT: all

include config.mk

SRC_DIR = src
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin
DIST_DIR = $(BUILD_DIR)/dist
DIST_BASE_DIR = tdc-$(VERSION)

HDR = $(wildcard *.h)
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o, $(SRC))
BIN = $(BIN_DIR)/tdc

PKGFILES = \
	CPPLINT.cfg\
	LICENSE\
	Makefile\
	README.md\
	config.mk\
	doc\
	man\
	${SRC}\
	${HDR}

all: $(BIN)
	@echo "tdc built"

clean:
	@echo cleaning
	@rm -rf $(BUILD_DIR)

lint:
	@cppcheck --check-level=exhaustive $(SRC_DIR) include
	@cpplint --recursive $(SRC_DIR) include

options:
	@echo "tdc compilation flags"
	@echo "VERSION    = $(VERSION)"
	@echo "CC         = $(CC)"
	@echo "CFLAGS     = $(CFLAGS)"
	@echo "CPPFLAGS   = $(CPPFLAGS)"
	@echo "LDFLAGS    = $(LDFLAGS)"
	@echo "SRC        = $(SRC)"
	@echo "OBJ        = $(OBJ)"
	@echo "BIN        = $(BIN)"


dist:
	mkdir -p $(DIST_DIR)/$(DIST_BASE_DIR)
	cp -r $(PKGFILES) $(DIST_DIR)/$(DIST_BASE_DIR)
	cd $(DIST_DIR); \
	tar -cz  -f $(DIST_BASE_DIR).tar.gz $(DIST_BASE_DIR); \
	zip -r $(DIST_BASE_DIR).zip $(DIST_BASE_DIR)

install: tdc
	@echo installing executable file to $(PREFIX)/bin
	@mkdir -p $(PREFIX)/bin
	@cp -f $(BIN) $(PREFIX)/bin
	@chmod 755 $(PREFIX)/bin/tdc

uninstall:
	@echo removing executable file from $(PREFIX)/bin
	@rm -f $(PREFIX)/bin/tdc

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BIN): $(OBJ) | $(BIN_DIR)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
