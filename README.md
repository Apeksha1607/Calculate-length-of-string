# 🖥️ X86-64 Assembly Program

## Accept a String and Display Its Length

---

## 📌 Title

**Write an X86/64 ALP to accept a string and display its length.**

---

## 📖 Description

This project is an **x86-64 Assembly Language Program (ALP)** for Linux that:

* Accepts a string from the user
* Calculates its length
* Displays the length in **2-digit hexadecimal format**

The program uses **Linux 64-bit system calls** via the `syscall` instruction.

---

## ⚙️ System Requirements

* 64-bit Linux OS
* NASM (Netwide Assembler)
* GNU Linker (`ld`)

---

## 🛠️ Tools & Technologies

* **Assembler:** NASM
* **Linker:** ld
* **Architecture:** x86-64
* **System Calls Used:**

  * `sys_read (0)`
  * `sys_write (1)`
  * `sys_exit (60)`

---

## 📂 Program Structure

### 🔹 `.data` Section

Stores:

* Input prompt message
* Output message

### 🔹 `.bss` Section

Reserves memory for:

* `string` → Buffer to store user input (100 bytes)
* `length` → Stores calculated length
* `dispbuf` → Buffer to store hexadecimal length (2 characters)

### 🔹 `.text` Section

Contains:

* `_start` entry point
* Input handling
* Length calculation
* Hexadecimal conversion logic
* Display output

---

## 🔄 Program Workflow

1. Display message: **"Enter the string:"**
2. Accept string input from user
3. `sys_read` returns number of bytes read in `RAX`
4. Decrement `RAX` to remove newline character
5. Store length
6. Convert length into 2-digit hexadecimal
7. Display: **"Length of the string:"** followed by calculated length
8. Exit program

---

## ▶️ How to Compile and Run

### Step 1: Assemble

```bash
nasm -f elf64 filename.asm -o filename.o
```

### Step 2: Link

```bash
ld filename.o -o filename
```

### Step 3: Run

```bash
./filename
```

---

## 📌 Sample Execution

```
Enter the string:
Hello

Length of the string:
05
```

---

## 🧠 Key Concepts Used

* 64-bit Linux system calls
* Register usage (RAX, RDI, RSI, RDX, RBX, RCX)
* Buffer handling
* Bitwise rotation (`ROL`)
* Hexadecimal conversion logic
* Loop control using `JNZ`

---

## 📎 Notes

* Maximum string length supported: **100 characters**
* Length is displayed in **2-digit hexadecimal format**
* Program does not validate overflow beyond buffer size
* Designed for educational purposes

