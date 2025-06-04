
# axi_stream_stage

This project demonstrates how to use **OSVVM** (Open Source VHDL Verification Methodology) to verify a simple AXI4-Stream pipeline stage. The design features a basic AXI4-Stream interface with standard VALID/READY handshaking and single-beat buffering.
The purpose of this project is to showcase how OSVVM can be effectively used to verify the functional behavior of the `axi_stream_stage` module. This includes examples of stimulus generation, transaction modeling, and functional checking through structured test benches.

---

## Project Structure

```
axi_stream_stage/
├── lib/               # OSVVM and external library dependencies
├── src/               # Source code for the AXI4-Stream pipeline stage
├── tb/                # Testbenches using OSVVM methodology
├── regression.tcl     # TCL script to automate simulation and regression runs
├── .gitmodules        # Git submodule references
└── README.md          # Project documentation
```

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
```

If you have already cloned the repository without submodules, initialize and update them by running:

```bash
cd axi_stream_stage
```

---

## Running Simulations

1. Open your preferred simulator (Riviera-PRO, GHDL, or QuestaSim).
2. Open the console or command line interface within the simulator.
3. Navigate to the project directory containing `regression.tcl`. For example:

```bash
cd /path/to/axi_stream_stage
```

4. Run the regression script to compile and execute tests:

```tcl
source regression.tcl
```

---

## Author

- **Dr.-Ing. Nambinina Rakotojaona**
