# Smart Traffic Management System (STMS): FSM-Based Adaptive Signal Controller with Emergency Vehicle Priority and Pedestrian Assistance

## Overview

This project implements a Smart Traffic Light Controller using Verilog HDL and Finite State Machine (FSM) design principles. The controller manages traffic flow dynamically by incorporating vehicle detection, pedestrian crossing requests, emergency vehicle priority handling, and night-mode operation.

Unlike conventional fixed-time traffic systems, this design adapts signal timing based on traffic conditions and special operating scenarios, making it suitable for FPGA-based intelligent transportation applications.

---

## Features

### Adaptive Traffic Control

* Dynamically adjusts green light duration based on vehicle sensor input.
* Extends green signal when traffic is detected.

### Pedestrian Crossing Support

* Handles pedestrian crossing requests safely.
* Provides dedicated pedestrian crossing state.

### Emergency Vehicle Priority

* Immediately prioritizes emergency vehicles.
* Forces traffic flow to green for rapid clearance.

### Night Mode Operation

* Switches system into blinking yellow mode.
* Simulates low-traffic nighttime operation.

### Countdown Timer

* Displays remaining time for the active signal state.
* Improves visibility of state transitions.

### FSM-Based Architecture

* Modular finite state machine implementation.
* Clear state transitions and timing control.

---

## State Diagram

| State | Description                  |
| ----- | ---------------------------- |
| S0    | Red Light                    |
| S1    | Red + Yellow                 |
| S2    | Green Light                  |
| S3    | Yellow Light                 |
| S4    | Pedestrian Crossing          |
| S5    | Night Mode (Blinking Yellow) |

---

## Inputs

| Signal     | Description                 |
| ---------- | --------------------------- |
| clk        | System Clock                |
| rst        | Asynchronous Reset          |
| sensor     | Vehicle Detection Sensor    |
| pedestrian | Pedestrian Crossing Request |
| emergency  | Emergency Vehicle Detection |
| nightmode  | Night Mode Enable           |

---

## Outputs

| Signal     | Description               |
| ---------- | ------------------------- |
| red        | Red Traffic Signal        |
| yellow     | Yellow Traffic Signal     |
| green      | Green Traffic Signal      |
| timer[3:0] | Remaining Countdown Timer |

---

## Operating Logic

### Normal Traffic Cycle

Red → Red+Yellow → Green → Yellow → Red

### Traffic Detection Mode

* If vehicles are detected:

  * Green light duration extends up to 8 cycles.
* If no vehicles are detected:

  * Green light remains active for 5 cycles.

### Pedestrian Mode

* Activated when pedestrian request is received.
* Traffic signal transitions safely to pedestrian crossing state.

### Emergency Mode

* Emergency vehicles receive highest priority.
* System immediately transitions to green state.

### Night Mode

* Activated through nightmode input.
* Controller enters blinking yellow state.
* Returns to normal operation when night mode is disabled.

---

## Design Methodology

* Verilog HDL implementation
* Finite State Machine (FSM) architecture
* Sequential logic for state storage and counters
* Combinational logic for state transitions
* Real-time timing and priority handling

---

## Verification

The design was verified through simulation by testing:

* Normal traffic operation
* Vehicle detection scenarios
* Pedestrian requests
* Emergency vehicle prioritization
* Night mode transitions
* Timer functionality
* State transition correctness

---

## Applications

* Smart City Infrastructure
* Intelligent Transportation Systems (ITS)
* FPGA-Based Traffic Controllers
* Embedded Control Systems
* Digital Logic Design Learning
* VLSI and RTL Design Projects

---

## Technologies Used

* Verilog HDL
* Finite State Machines (FSM)
* Digital Logic Design
* RTL Design
* FPGA Development Flow
* Simulation and Verification

---

## Key Learning Outcomes

* FSM Design and Optimization
* Sequential and Combinational Logic Design
* Traffic Control Algorithms
* Priority-Based State Transition Systems
* Verilog RTL Development
* Hardware-Oriented System Design

This project demonstrates the practical application of FSM-based control systems in real-world intelligent traffic management scenarios while showcasing core RTL design and digital system development skills relevant to FPGA and ASIC design flows.
