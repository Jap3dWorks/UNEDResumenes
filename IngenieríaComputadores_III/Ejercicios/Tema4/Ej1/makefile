# Makefile for VHDL project
# GHDL configuration
GHDL = ghdl
GHDLFLAGS = --std=08  # Use VHDL-2008 (adjust based on your needs)

# Default target (what runs when you just type 'make')
all: run

# Analyze all VHDL files
analyze: codificador_4_2_prioridad.vhdl bp_codificador_4_2.vhdl
	$(GHDL) -a $(GHDLFLAGS) codificador_4_2_prioridad.vhdl
	$(GHDL) -a $(GHDLFLAGS) bp_codificador_4_2.vhdl

# Elaborate the testbench
elaborate: analyze
	$(GHDL) -e $(GHDLFLAGS) bp_codificador_4_2

# Run simulation
run: elaborate
	$(GHDL) -r bp_codificador_4_2

# Run and generate waveform
wave: elaborate
	$(GHDL) -r bp_codificador_4_2 --vcd=wave.vcd
	flatpak run io.github.gtkwave.GTKWave wave.vcd

# Clean up generated files
clean:
	rm -f *.o *.cf *.vcd work-obj*.cf bp_codificador_4_2

# Show all targets
help:
	@echo "Available targets:"
	@echo "  make        - Run simulation (default)"
	@echo "  make run    - Same as default"
	@echo "  make wave   - Run and show waveform"
	@echo "  make analyze - Just analyze files"
	@echo "  make clean  - Remove generated files"
	@echo "  make help   - Show this help"

.PHONY: all analyze elaborate run wave clean help
