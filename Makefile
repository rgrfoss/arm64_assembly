
assemble:
	as $(INPUT).s -o $(OUTPUT).o

linking:
	ld $(INPUT).o -o $(OUTPUT) -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

run:
	make assemble INPUT=$(INPUT) OUTPUT=$(OUTPUT) && make linking INPUT=$(INPUT) OUTPUT=$(OUTPUT) && ./$(OUTPUT)

