# 🚦 Smart Traffic Management System (STMS)

### FSM-Based Adaptive Traffic Signal Controller with Emergency Vehicle Priority and Pedestrian Assistance

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![FSM](https://img.shields.io/badge/Architecture-FSM-green)
![RTL](https://img.shields.io/badge/Design-RTL-orange)
![Vivado](https://img.shields.io/badge/Tool-Xilinx%20Vivado-red)

---

## 📌 Project Overview

Smart Traffic Management System (STMS) is an intelligent traffic control solution developed using Verilog HDL and Finite State Machine (FSM) architecture. The system dynamically manages traffic signals by considering real-time traffic density, pedestrian crossing requests, emergency vehicle prioritization, and night-mode operation.

Unlike conventional fixed-time traffic controllers, STMS adapts signal timing based on road conditions, improving traffic flow efficiency, reducing congestion, and enhancing road safety.

The project demonstrates practical applications of RTL design, digital control systems, and FPGA-based intelligent transportation solutions.

---

## 🎯 Project Objectives

| Objective               | Description                                          |
| ----------------------- | ---------------------------------------------------- |
| Traffic Optimization    | Improve vehicle flow through adaptive signal timing  |
| Road Safety             | Support safe pedestrian crossings                    |
| Emergency Response      | Prioritize emergency vehicles during transit         |
| Intelligent Control     | Dynamically adjust signal durations                  |
| Hardware Implementation | Develop a synthesizable RTL-based traffic controller |

---

## ✨ Key Features

| Feature                       | Description                                        |
| ----------------------------- | -------------------------------------------------- |
| 🚗 Vehicle Detection System   | Adjusts signal timing based on traffic conditions  |
| 🚶 Pedestrian Assistance      | Dedicated pedestrian crossing mode                 |
| 🚑 Emergency Vehicle Priority | Immediate signal adaptation for emergency vehicles |
| 🌙 Night Mode Operation       | Blinking yellow signal during low-traffic hours    |
| ⏳ Countdown Timer             | Displays remaining time for active signals         |
| 🧠 FSM-Based Controller       | Structured state transitions and traffic control   |
| 🔄 Dynamic Timing Control     | Adaptive signal duration management                |
| 🎯 FPGA Ready                 | Synthesizable RTL implementation                   |

---

## 🏗️ System Architecture

```text
Vehicle Sensor ─────┐
                    │
Pedestrian Request ─┼──► FSM Controller ───► Traffic Signals
                    │
Emergency Vehicle ──┤
                    │
Night Mode ─────────┘

Outputs:
Red Signal
Yellow Signal
Green Signal
Countdown Timer
```

The FSM Controller continuously monitors traffic conditions and determines the appropriate signal state based on system priorities.

---

## 🚦 Traffic Signal States

| State | Name                | Function                      |
| ----- | ------------------- | ----------------------------- |
| S0    | Red                 | Stops vehicle movement        |
| S1    | Red + Yellow        | Transition state before green |
| S2    | Green               | Allows vehicle movement       |
| S3    | Yellow              | Warning before signal change  |
| S4    | Pedestrian Crossing | Safe pedestrian passage       |
| S5    | Night Mode          | Blinking yellow operation     |

---

## 🔄 State Transition Flow

### Normal Traffic Cycle

```text
Red → Red+Yellow → Green → Yellow → Red
```

### Adaptive Traffic Operation

* Green signal duration changes dynamically.
* Traffic sensor input influences signal timing.
* High traffic receives extended green duration.

### Priority Handling

```text
Emergency Vehicle
        ↓
Highest Priority
        ↓
Immediate Green Signal

Pedestrian Request
        ↓
Safe Transition
        ↓
Pedestrian Crossing State
```

---

## 📥 Inputs

| Signal     | Width | Description                 |
| ---------- | ----- | --------------------------- |
| clk        | 1-bit | System Clock                |
| rst        | 1-bit | Asynchronous Reset          |
| sensor     | 1-bit | Vehicle Detection Sensor    |
| pedestrian | 1-bit | Pedestrian Crossing Request |
| emergency  | 1-bit | Emergency Vehicle Detection |
| nightmode  | 1-bit | Night Mode Enable           |

---

## 📤 Outputs

| Signal     | Width | Description               |
| ---------- | ----- | ------------------------- |
| red        | 1-bit | Red Traffic Signal        |
| yellow     | 1-bit | Yellow Traffic Signal     |
| green      | 1-bit | Green Traffic Signal      |
| timer[3:0] | 4-bit | Remaining Countdown Timer |

---

## ⚙️ Operating Logic

### 🚗 Traffic Detection Mode

| Condition           | Green Signal Duration |
| ------------------- | --------------------- |
| Vehicle Detected    | Up to 8 Clock Cycles  |
| No Vehicle Detected | 5 Clock Cycles        |

The controller intelligently extends the green signal when traffic is present to reduce congestion.

---

### 🚶 Pedestrian Mode

* Activated when a pedestrian request is detected.
* Traffic flow transitions safely to the pedestrian state.
* Red signal is maintained for vehicle traffic.
* Dedicated crossing period is provided.

---

### 🚑 Emergency Mode

* Highest-priority operating mode.
* Immediately overrides normal traffic operation.
* Forces traffic clearance by prioritizing green signal transitions.

---

### 🌙 Night Mode

* Activated through the `nightmode` input.
* Controller enters blinking yellow mode.
* Used during low-traffic conditions to conserve operational cycles.
* Returns to normal operation when disabled.

---

## ⏳ Countdown Timer

The integrated timer displays the remaining duration of the active signal.

| State                    | Timer Duration |
| ------------------------ | -------------- |
| Red                      | 5 Cycles       |
| Red + Yellow             | 2 Cycles       |
| Green (Normal)           | 5 Cycles       |
| Green (Traffic Detected) | 8 Cycles       |
| Yellow                   | 2 Cycles       |
| Pedestrian               | 5 Cycles       |

---

## 🧪 Functional Verification

The design was verified through simulation using Xilinx Vivado.

### Test Scenarios

| Scenario                      | Status |
| ----------------------------- | ------ |
| Normal Traffic Operation      | Passed |
| Vehicle Detection Logic       | Passed |
| Adaptive Green Timing         | Passed |
| Pedestrian Requests           | Passed |
| Emergency Vehicle Priority    | Passed |
| Night Mode Operation          | Passed |
| Countdown Timer Functionality | Passed |
| FSM State Transitions         | Passed |

---

## 📊 Applications

| Application Area       | Use Case                       |
| ---------------------- | ------------------------------ |
| Smart Cities           | Intelligent traffic management |
| Transportation Systems | Adaptive signal control        |
| Embedded Systems       | Real-time control applications |
| FPGA Development       | RTL implementation projects    |
| Academic Research      | FSM and digital system studies |

---

## 🛠️ Technologies Used

| Category           | Tool / Technology                  |
| ------------------ | ---------------------------------- |
| HDL                | Verilog HDL                        |
| Design Methodology | Finite State Machines (FSM)        |
| Design Style       | RTL Design                         |
| Simulation         | Xilinx Vivado                      |
| Domain             | Intelligent Transportation Systems |

---

## 📈 Skills Demonstrated

* RTL Design and Verification
* Finite State Machine (FSM) Design
* Traffic Control Algorithms
* Priority-Based Control Systems
* Sequential and Combinational Logic Design
* Real-Time Decision Making
* Embedded Control System Development
* FPGA-Oriented Hardware Design

---

## 🚀 Future Enhancements

| Enhancement                    | Benefit                        |
| ------------------------------ | ------------------------------ |
| Traffic Density Sensors        | More accurate traffic control  |
| Multiple Road Junction Support | Scalable deployment            |
| AI-Based Traffic Prediction    | Smarter signal optimization    |
| IoT Integration                | Remote monitoring and control  |
| FPGA Hardware Deployment       | Real-world implementation      |
| Smart City Dashboard           | Centralized traffic management |

---

## 🎓 Learning Outcomes

This project provided practical experience in:

✔ FSM-Based Digital System Design

✔ Adaptive Traffic Control Algorithms

✔ Verilog HDL Development

✔ Sequential and Combinational Logic Design

✔ Priority-Based State Machines

✔ Hardware Verification and Debugging

✔ Real-Time Embedded Control Systems

✔ FPGA-Oriented Design Methodology

---

## 👩‍💻 Author

**Patta Snehita**
| B.Tech, Electrical Engineering
| National Institute of Technology Durgapur

📌 Interests: RTL Design • FPGA Development • Digital Systems • VLSI Design • Verilog HDL
