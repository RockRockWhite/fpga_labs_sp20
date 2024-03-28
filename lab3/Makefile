SIM = ./sim
SRC = ./src
LIB = ../lib
DISPLAY = :1.0

.PHONY: sim
sim: $(SIM)/$(NAME).v
	@echo "Building and running simulation..."
	iverilog -g2012 -o $(SIM)/$(NAME).vvp -s $(NAME) $(SIM)/$(NAME).v -I $(SRC) -I $(LIB)
	cd $(SIM) && vvp $(NAME).vvp
	@echo "Done!"
	@echo "open gtkwave to display waveform..."
	export DISPLAY=$(DISPLAY) && gtkwave $(SIM)/$(NAME).vcd

.PHONY: clean
clean:
	rm -f $(SIM)/*.vvp $(SIM)/*.vcd