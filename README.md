# VisionForge
### EEA Winter Project 2023-24 <br />

## Project 1: Smart Parking System

A state-machine based access control system with:
- Entry/exit detection using **front and back sensors**
- Password verification using two 2-bit inputs
- Real-time display updates on **seven-segment displays**
- Access indication using **Red (R_LED)** and **Green (G_LED)** LEDs

### FSM-Based States
- `IDLE`: No car present
- `WAIT_PASSWORD`: Front sensor detects car, waiting for password
- `WRONG_PASS`: Incorrect password entered
- `RIGHT_PASS`: Correct password entered, waiting for car to fully enter
- `STOP`: Car has entered, system halts temporarily

### Features
- Password validation: Expected combination is `pass_1=2'b01` and `pass_2=2'b10`
- Timeout logic with `cnt_wait`
- Visual feedback using 7-segment displays:
  - **"En"** while waiting for password
  - **"EE"** on wrong password
  - **"60"** on correct password
  - **"5P"** when parked
- LEDs blink or stay steady based on current FSM state

---

## Project 2: Alarm Clock (24-Hour Format)

A digital clock that:
- Maintains and displays hours, minutes, and seconds in 24-hour format.
- Allows **manual loading of current time and alarm time**.
- Triggers an **Alarm signal** when current time matches alarm time.

### Features
- Input time and alarm time using BCD inputs.
- Alarm ON/OFF toggle and STOP input for manual control.
- Seconds, minutes, and hours updated based on internal `clk_1s`.
- Output time split into digit-wise signals (H1, H0, M1, M0, S1, S0).

---

## Tech Stack and Learnings

Verilog, GTKWave, Digital Logic, Finite State Machines (FSM)
