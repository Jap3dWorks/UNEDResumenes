GHDL=ghdl
GHDLFLAGS=--std=08

# en mi equipo uso GTKwave para visualizar las ondas de los circuitos.
GTKWAVE=flatpak run io.github.gtkwave.GTKWave

RESULTS=TST

all: run

analyze: test_transporte.vhdl
	$(GHDL) -a $(GHDLFLAGS) test_transporte.vhdl

elaborate: analyze
	$(GHDL) -e -v $(GHDLFLAGS) TST

run: elaborate
	$(GHDL) -r TST --stop-time=80ns

wave: elaborate
	$(GHDL) -r TST --stop-time=80ns --vcd=TST_wave.vcd

clean:
	rm -f *.o *.vcd work-obj*.cf $RESULTS

help:
	@echo "Opciones disponibles:"
	@echo "  make			- Ejecuta la simulación (default)"
	@echo "  make run		- Ejecuta la simulación"
	@echo "  make wave		- Ejecuta la simulación y genera archivos vcd"
	@echo "  make analyze	- Analiza los archivos"
	@echo "  make clean		- Borra los archivos generados"
	@echo "  make help		- Muestra este mensaje de ayuda"

.PHONY: all analyze elaborate run wave clean help

