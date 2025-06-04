source lib/OsvvmLibraries/Scripts/StartUp.tcl
variable OMIT_XILINX_FILES 0

build lib/OsvvmLibraries/OsvvmLibraries.pro
      
if {$::osvvm::ToolName eq "GHDL"} {
    set OMIT_XILINX_FILES 1
    SetExtendedAnalyzeOptions {-frelaxed -Wno-specs}
    SetExtendedSimulateOptions {-frelaxed -Wno-specs -Wno-binding}
    SetExtendedRunOptions {--ieee-asserts=disable-at-0}
}
      
if {$::osvvm::ToolName eq "RivieraPRO"} {
    set OMIT_XILINX_FILES 1
    SetExtendedSimulationOptions {-unbounderror}
    LinkLibraryDirectory {temp/Riviera-PRO/VHDL_LIBS/*}
}

if {$::osvvm::ToolName eq "QuestaSim"} {
        set OMIT_XILINX_FILES 0
	SetVHDLVersion 2008
	vmap unisim "$PrecompiledVivadoIPCores/unisim"
	vmap xpm "$PrecompiledVivadoIPCores/xpm"
}

build src/passthrough.pro

build tb/TbStream.pro
