
# axi_stream_stage

This project demonstrates how to use **OSVVM** (Open Source VHDL Verification Methodology) to verify a simple AXI4-Stream pipeline stage. The design features a basic AXI4-Stream interface with standard VALID/READY handshaking and single-beat buffering.

The purpose of this project is to showcase how OSVVM can be applied to verify the functional behavior of the `axi_stream_stage` module. It provides examples of stimulus generation and functional checking.

---

## Getting Started

### Prerequisites

- Git
- One of the supported simulators:
  - Riviera-PRO
  - GHDL
  - QuestaSim

### Clone the Repository

Since this project uses submodules, clone it recursively:

```bash
git clone --recursive https://github.com/nambhine1/axi_stream_stage.git

cd axi_stream_stage
git submodule update --init --recursive
```

If you have already cloned the repository without submodules, initialize and update them by running:

```bash
cd axi_stream_stage
git submodule update --init --recursive
```

### Running Simulations

1. Open your preferred simulator (Riviera-PRO, GHDL, or QuestaSim).
2. Open the console or command line interface within the simulator.
3. Navigate to the project directory containing `regression.tcl`. For example:

```bash
cd /path/to/axi_stream_stage
```

4. Run the regression script to compile and run tests:

```tcl
source regression.tcl
```
