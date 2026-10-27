# dartPencil: Sharpened

**Author:** Lee Endrey Alpas  
**Section:** 3.3BSIT  
> Object-Oriented Programming (OOP) Project in Dart demonstrating Inheritance, Polymorphism, Abstraction, Interfaces, and Mixins.

---

## Overview

This project refactors a basic `Pencil` class into a robust Object-Oriented system in Dart. It demonstrates core OOP principles including encapsulation, inheritance, polymorphism through method overriding, contract implementation via abstract interfaces, and code reuse using mixins across independent class hierarchies.

---

## Added Features
**Scenario**: cloud sync for ColoredPencil
- **Async** Method (`syncDrawingData`): Added to `Pencil` with a return type of `Future<String>`.
- **Delay** (`Future.delayed`): Pauses execution inside `syncDrawingData()` for 2 seconds without blocking the Dart event loop.
- **Async Main** (`void main() async`): Marked `async` so `await` can be used to wait for `syncDrawingData()` to yield its value.

Execution Order: Step 1: Initiating... and [Async task running...] print immediately before the 2-second delay begins, demonstrating non-blocking initialization before Step 2 prints upon resolution.   
---
## Class Architecture & OOP Features

### Base Class (`Pencil`)
Defines common properties and behaviors for all pencil types, using encapsulation for private fields (`_eraser`).
- **Properties:** `graphite` (double), `color`(String), `_eraser` (double)
- **Behaviors:** `sketch()`, `erase()`, `displayInfo()`, getter/setter for `eraser`

### Derived Classes (`extends`)
- `ColoredPencil`:
  - **Inherits from:** `Pencil`
  - **Additional Property:** `pigmentType` (String)
  - **Polymorphism:** Overrides `sketch()` and `displayInfo()` to include color pigment information.
- `MechanicalPencil`:
  - **Inherits from:** `Pencil`
  - **Additional Property:** `leadSize` (double)
  - **Polymorphism:** Overrides `sketch()` and `displayInfo()` to show precise drafting functionality.

### Abstract Interface (`Sharpenable`)
- Defines an explicit contract: `void sharpen()`.
- Implemented by both `ColoredPencil` (restores graphite) and `MechanicalPencil` (advances lead mechanism).

### Mixin (`Refillable`)
- Provides reusable state (`refillCount`) and behavior (`refill()`) without needing deep inheritance.
- **Shared across classes:**
  - `MechanicalPencil` (inside the `Pencil` class hierarchy)
  - `Stapler` (an external class completely outside the `Pencil` hierarchy)

---

### What it does
- Open this **[Dart run link](https://dartpad.dev/?id=f3667c4a3bea3f6b4a750a5ff7b0ffd7)**, then click '*run*'. 

### License

* [MIT](https://choosealicense.com/licenses/mit/)
