# RISC-V Myth workshop
![1](https://user-images.githubusercontent.com/63381455/122866731-19442580-d346-11eb-9821-0c316b5c2c0b.JPG)

# Table of contents

- [Overview](#overview)
- [Day 1 : Introduction to RISC-V ISA](#Day1)
  - [GNU compiler toolchain](#GNU)
  - [Installation of GNU toolchain](#Installation)
- [Introduction to ABI](#ABI)


# Overview

The 5 day RISC-V Myth (microprocessor for you in thirty hours) workshop is conducted by [VLSI system design](https://www.vlsisystemdesign.com/riscv-based-myth/?v=a98eef2a3105) and [Redwood EDA](https://www.redwoodeda.com/tl-verilog). This workshop starts from the beginner level of understanding the basic software to hardware integration,by writing a simple c program for the assembly language  program to finally built a RISC-V pipelinened architecture for the same. As VSD has an intelligent cloud based VSDA-IAT platform the entire workshop contents, assessments and initial labs are carried out in the platform itself. Thereafter the TL based Makerchip platform as given in the github repository https://github.com/stevehoover/RISC-V_MYTH_Workshop for RTL implementation of RISC-V core. Prior to the implemantation of the core some simple digital logics along with a calculator was implemented in  Makerchip platform for better understanding of the platform and TL verilog.

# Day 1 : Introduction to RISC-V ISA and GNU compiler toolchain

RISC-V ISA is a base integer ISA and must be present in any implemenatation along with some optional extension. The RISC-V has been designed to support extensive customization and specialization which can be extended  with  one  or  more  optional  instruction-set  extensions,  but  the  base  integer instructions cannot be redefine. The different instructions included in RISC-V are listed below.

1. Pseudo instructions
2. Base integer instruction (RV64I, RV32I)
3. Multiply extension (RV64M)
4. Single and double floating point instruction (RV64F, RV64D)
5. Application binary instruction
6. Memory allocation and stack pointer

The detail of the RISC-V instructions set manual can be found [here](https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf).

Each base integer set is characterized by the  width  of the register (XLEN) and size of the user address space. The most important advantage of RISC-V is that it is an open standard instruction which is easily available for academics and commercial purposes free of cost. The main github link of RISC-V is https://github.com/riscv which is a hub of the different repositories related to RISC-V.

### GNU compile toolchain

The GNU compile toolchain is a set of programming tools in LINUX system that can be use for compiling a code to generate certain executable program, library and debugger and whose detail can be found in [1](https://en.wikipedia.org/wiki/Toolchain) and [2](https://en.wikipedia.org/wiki/GNU_toolchain). RISC-V is one such toolchain which supports C and C++ cross compiler. It supports two build modes: a generic ELF/Newlib toolchain and a more sophisticated Linux-ELF/glibc toolchain and [here](https://github.com/riscv/riscv-gnu-toolchain) the github link for the same can be found. 

<!---1. Compiler and linker which transform the source code into an executable program
2. Libraries which provide interfaces to the operating system 
3. Debugger which is used to test and debug created program--->

To start off a c program to compile sum from 1 to n was written whose file is in the codes folder as [sum1to9.c](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Codes). The program is compiled using both the gcc compiler and RISC-V compiler. For normal gcc compiliation simply `gcc <filename.c>` is executed in the terminal generating an object file `a.out` and `./a.out` is use to further run it. 

In case RISC-V GNU toolchain the follwing commands are executed

- To use the RISC-V gcc compiler or simulator, type
```bash
riscv64-unknown-elf-gcc <-01/-Ofast> -mabi=lp64 -march=rv64i -o <object filename.o> <filename.c>
```
![C1](https://user-images.githubusercontent.com/63381455/123098306-a4a8de00-d44e-11eb-8a44-3666ea943164.png)

- To deassemble the object file 

```bash
riscv64-unknown-elf-objdump <object file> -d <object filename.o>
```
![C2](https://user-images.githubusercontent.com/63381455/123098440-c73af700-d44e-11eb-95e1-6919e21f7846.png)

The deassemble file with the highlighted main part of the program  is as shown below

![objfile](https://user-images.githubusercontent.com/63381455/123098447-c904ba80-d44e-11eb-9606-b08c4fb4c39a.png)

- To use SPIKE simulator to run obj file

```bash
spike pk <object filename.o>
```
The figure below shows the output for sum 1 to 100.

![C3](https://user-images.githubusercontent.com/63381455/123099143-88f20780-d44f-11eb-8e8c-634349cf6ab6.png)

- The SPIKE simulator can be used to manually debug the code
```bash
spike - d pk <object filename.o> 
```
and we can decide the pc till where the debug is done

```bash
until pc 0 < pc of your choice> 
```
and thereafter  any register content can be viewed using the command

```bash
reg 0 <register name>
```
The spike debugger along with a register is as shown below

![C4](https://user-images.githubusercontent.com/63381455/123113626-513d8c80-d45c-11eb-9af0-5fa579c0920a.png)

Information on the RISC-V options is available in [RISC-V options](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html) and [here](https://www.sifive.com/blog/all-aboard-part-1-compiler-args).

### Installation of GNU toolchain

For installation of GNU toolchain in your local system visit

1. [RISC-V GNU toolcahain](http://hdlexpress.com/RisKy1/How2/toolchain/toolchain.html)
2. [RISC-V workshop collaterals](https://github.com/kunalg123/riscv_workshop_collaterals)













 

