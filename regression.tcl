source lib/Scripts/StartUp.tcl

build lib/OsvvmLibraries/OsvvmLibraries.pro
      
variable OMIT_XILINX_FILES 1
      
if {$::osvvm::ToolName eq "GHDL"} {
    SetExtendedAnalyzeOptions {-frelaxed -Wno-specs}
    SetExtendedSimulateOptions {-frelaxed -Wno-specs -Wno-binding}
	SetExtendedRunOptions {--ieee-asserts=disable-at-0}
}
      
if {$::osvvm::ToolName eq "RiveraPRO"} {
    SetExtendedSimulationOptions {-unbounderror}
    LinkLibraryDirectory {temp/Riviera-PRO/VHDL_LIBS/*}
}

if {$::osvvm::ToolName eq "QuestaSim"} {
	SetVHDLVersion 2008
	vmap unisim "$PrecompiledVivadoIPCores/unisim"
	vmap xpm "$PrecompiledVivadoIPCores/xpm"
}


build src/passthrough.pro

build tb/TbStream.pro