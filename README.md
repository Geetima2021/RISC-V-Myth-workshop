# RISC-V Myth workshop
![1](https://user-images.githubusercontent.com/63381455/122866731-19442580-d346-11eb-9821-0c316b5c2c0b.JPG)

# Table of contents

- [Overview](#overview)
- [Day 1 : Introduction to RISC-V ISA](#Day1)
  - [GNU compiler toolchain](#GNU)
  - [Installation of GNU toolchain](#Installation)
- [Introduction to ABI](#ABI)
  - [Combinational logic in TL verilg using Makerchip IDE](#combinational)


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

To start off a c program to compile sum from 1 to n was written whose file is in the codes folder as [sum1to9.c](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Codes/sum1to9.c). The program is compiled using both the gcc compiler and RISC-V compiler. For normal gcc compiliation simply `gcc <filename.c>` is executed in the terminal generating an object file `a.out` and `./a.out` is use to further run it. 

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

Also certain nomenlature are also discussed starting from bits to doubleword. The chronological order of the same along with the RISC-V signed number and unsigned number ranges is as shown in the figure below

![I1](https://user-images.githubusercontent.com/63381455/123209636-8a1e4580-d4de-11eb-9b4a-4d9e5fa3b949.png)

Following the above, c program for both signed and unsigned numbers are written whose codes are [here](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Codes) and the output of the programs can be viewed in the following [folder](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Images).

### Installation of GNU toolchain

For installation of GNU toolchain in your local system visit

1. [RISC-V GNU toolcahain](http://hdlexpress.com/RisKy1/How2/toolchain/toolchain.html)
2. [RISC-V workshop collaterals](https://github.com/kunalg123/riscv_workshop_collaterals)

# Introduction to ABI

A number of interface are present between the application program and hardware as shown in [figure1](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Images/interface.png). Application binary interface or ABI is an interface, that helps programs access system hardware and services. An ABI consists of two parts - one is the user instruction itself and the second is the system call interface through the operating system. Through the system call interface the application program can directly access the ISA via the ABI registers and hence  ABI is also known system call interface. RISC-V consisits  of 32 registers and Application  programmer can access the register through their ABI name. Below is a table showing the role of the 32 integer register in the calling convention of RISC-V architectute. More information  on RISC-V calling can be found [here](https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf). [Figure2](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Images/register_example.png) shows few examples of ABI integer registers.

<!---![interface](https://user-images.githubusercontent.com/63381455/123235164-408f2400-d4f9-11eb-9fa2-09ca639fac9c.png)--->

![ABI](https://user-images.githubusercontent.com/63381455/123235177-4258e780-d4f9-11eb-8308-e543d68b57f0.png)

Thereafter, the c program for summation of 1 to 9 is modified using the ABI function call and both the file can be access in [1](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Codes/1to9_custom.c) and [2](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Codes/load.S). Now the program is compiled, deassembled using RISC-V gcc compiler and the deassmbled main section & load loop section can be viewed in [figure3](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Images/customC_main.png), [figure4](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Images/load_loop.png). The output of the above program is shown below.

![op_customC](https://user-images.githubusercontent.com/63381455/123276259-a2b04f00-d522-11eb-9fa6-5fb4c3050cff.png)
 
# Digital logic with TL verilog and Makerchip

[Makerchip](http://makerchip.com/) introduces ground breaking capabilities for advanced Verilog design, it also makes circuit design easy fun! For this Makerchip provides free and instant access to the latest tools (both the open-source and proprietary ones) from the browser in a local system.  One can easily code, compile, simulate, and debug verilog design by using the makerchip IDE platform from the browrser iteslf. Makerchip platform provides a seamless design experience as the code,log file, block diagrams, waveforms, and novel visualisation are highly organised, tightly integrated and debugging is easy.

Makerchip supports the emerging Transaction-Level Verilog or TL-Verilog standard which is a huge step forward as it allows simpler coding. As the coding becomes lesser faster development, fewer bugs, easier maintenance, and better quality silicon becomes possible.  TL-Verilog adds powerful constructs for pipelines and transactions. A number of examples available in Makerchip which can be found [here](https://makerchip.com/sandbox/).

## Combinational logic in TL verilg using Makerchip IDE
 
Initiatlly we started with understanding the Makerchip IDE platform by trying some basic digital logic gate with inverter being the standard one. In TL verilog we simply code the logic itself viz `$out =!$in1` without requiring to declare the variables separately and $in assignment is also not required. The output of the above is as shown in figure below. We note that simultaneous highlighting of the variable is possible at the output.

![inverter](https://user-images.githubusercontent.com/63381455/123416539-502f6b00-d5d4-11eb-8521-25ab4e68c01e.png)

Apart from inverter the logic gates, multiplexer, counter etc are also coded using TL verilog. The logic gates code along with the output is as shown in figure and we can see that assigment of inputs is not necessary in TL verilog. Other codes and output cab be viewed [here](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Images).

![Logic gates](https://user-images.githubusercontent.com/63381455/123433254-deade780-d5e8-11eb-8c36-629c5e99f808.png)


