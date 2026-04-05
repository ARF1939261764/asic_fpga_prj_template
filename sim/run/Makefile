.PHONY:vcs sim check cov wave clean verdi change

TESTNAME = smoke

export prj_dir=../../

TOP := tb_top
C_CODE_DIR := ${prj_dir}/firmware

#FILELIST
FILELIST += -F ../../design/rtl.lst
FILELIST += -F ../../sim//tb/tb.lst

DEFINE += +define+CLOCK_PERIOD=1
DEFINE += +define+PRINTF_COND=0

#VCS_FLAGS
VCS_FLAGS :=	\
  -full64 +v2k                     \
	-sverilog                                                                     \
	+notimingcheck                                                                \
	+nospecify                                                                    \
	-timescale=1ns/1ps                                                            \
	-P ${VERDI_HOME}/share/PLI/VCS/LINUXAMD64/novas.tab\
	${VERDI_HOME}/share/PLI/VCS/LINUXAMD64/pli.a       \
	+vcs+initreg+random                                                           \
	$(DEFINE)

all:vcs sim

gcc:
	${MAKE} -C ${C_CODE_DIR}
	cp ${C_CODE_DIR}/build . -rf
	hexdump -v -e'/8 "%016x\n"' ./build/$(TESTNAME)/main.bin > axi_sram_64.mif
	hexdump -v -e'/8 "%016x\n"' ./build/$(TESTNAME)/main.bin > axi_sram_64_60000000.mif
	#hexdump -v -e'/8 "%016x\n"' ./fw_jump.bin > axi_sram_64.mif
	echo "compile success!"

vcs:
	vcs ${VCS_FLAGS} ${FILELIST} -top ${TOP}

sim:gcc
	./simv -ucli -i run.tcl +vcs+initreg+0

verdi:
	verdi -sv ${FILELIST} -top ${TOP}

clean:
	@rm -rf  ./ucli.key *log *.vdb *.vpd verdi* novas* *.fsdb .* urg* ${C_CODE_DIR}/build ./build ./csrc ./simv* ./verdi* ./simv.daidir ./axi_sram_64.mif ./axi_sram_64_60000000.mif
