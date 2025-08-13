# Non-Overlapping 101 Sequence Detector

## Overview
This project implements a **Non-Overlapping 101 Sequence Detector** in Verilog.  
The detector identifies the binary sequence `101` in a serial input stream. Once a sequence is detected, the detector **resets** to detect the next sequence.  
The design has been verified using **Vivado Simulator**.

---

## Elaborated Design

### **Design Concept**
The 101 sequence detector uses a **Finite State Machine (FSM)** to track the input bit stream and generate an output signal whenever the sequence `101` is detected.  
Non-overlapping detection ensures that consecutive sequences are detected without overlapping bits.

### **FSM States**
| State | Description | Next State Logic | Output |
|-------|------------|----------------|--------|
| **S0** | Waiting for first `1` | If input=1 → S1, else stay in S0 | 0 |
| **S1** | First `1` detected | If input=0 → S2, else stay in S1 | 0 |
| **S2** | Sequence `10` detected, waiting for final `1` | If input=1 → S0 (sequence detected), else S0 | 1 if sequence detected, else 0 |


### **Detection Process**
1. Start in **S0**, wait for first `1`.  
2. Move to **S1** when the first `1` is detected.  
3. On detecting `0` in **S1**, move to **S2**.  
4. In **S2**, if the next bit is `1`, the sequence `101` is detected, and the output goes high for **one clock cycle**.  
5. FSM transitions back to **S1** to start detecting the next sequence (non-overlapping behavior).

---

### **Elaborated Design Image**

![Elaborated Design](images/sequence_detector_non_overlapping.png)  
*Figure: Elaborated design showing input, FSM states, and output logic.*

---

### **Simulation / Waveform**

![Simulation Waveform](images/SEQUENCE_DETECTOR_NON_OVERLAPPING_101 (2).png)
*Figure: Output waveform showing detection of the 101 sequence.*

**Observations:**
- Output goes high only when the exact sequence `101` appears.  
- Non-overlapping detection ensures consecutive sequences are detected correctly without overlap.

---

## How to Simulate in Vivado
1. Open **Vivado** and create a **new project**.  
2. Copy your RTL and testbench code into separate files in the project.  
3. Set your **testbench as the top module for simulation**.  
4. Run **Simulation > Run Behavioral Simulation**.  
5. Observe the waveform and verify the output `dout` for correct detection.

---

## Author
- **Your Name**

---

## License
This project is licensed under the MIT License.
