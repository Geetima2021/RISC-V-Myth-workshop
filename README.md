# RISC-V Myth workshop
![1](https://user-images.githubusercontent.com/63381455/122866731-19442580-d346-11eb-9821-0c316b5c2c0b.JPG)

# Table of contents

- [Overview](#overview)
- [Day 1 : Introduction to RISC-V ISA](#Day1)
  - [GNU compiler toolchain](#GNU)
  - [Installation of GNU toolchain](#Installation)
- [Introduction to ABI](#ABI)
  - [Combinational logic in TL verilg using Makerchip IDE](#combinational)
  - [Combinational Calculator](#cal)
  - [Sequential Calculator](#seq)
  - [Pipelining](#pipe)
  - [Validity](#valid)
  - [Calculator with memory](#mem)
- [Basic RISC-V CPU micro-architecture](#archi)
  - [Fetch](#fetch)
  - [Decode](#decode)
  - [Register file read](#register)


# Overview

The 5 day RISC-V Myth (microprocessor for you in thirty hours) workshop is conducted by [VLSI system design](https://www.vlsisystemdesign.com/riscv-based-myth/?v=a98eef2a3105) and [Redwood EDA](https://www.redwoodeda.com/tl-verilog). This workshop starts from the beginner level of understanding the basic software to hardware integration,by writing a simple c program for the assembly language  program to finally built a RISC-V pipelinened architecture for the same. As VSD has an intelligent cloud based VSD-IAT platform the entire workshop contents, assessments and initial labs are carried out in the platform itself. Thereafter, the TL based Makerchip platform as given in the github repository https://github.com/stevehoover/RISC-V_MYTH_Workshop for RTL implementation of RISC-V core is used. Prior to the implemantation of the core some simple digital logics along with a calculator is implemented in Makerchip platform for better understanding of the platform and TL verilog.

# Introduction to RISC-V ISA

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

- To use SPIKE simulator to run object file

```bash
spike pk <object filename.o>
```
The figure below shows the output for sum 1 to 100.

![C3](https://user-images.githubusercontent.com/63381455/123099143-88f20780-d44f-11eb-8e8c-634349cf6ab6.png)

- The SPIKE simulator can be used to manually debug the code
```bash
spike - d pk <object filename.o> 
```
and we can decide the pc from where the debug starts

```bash
until pc 0 < pc of your choice> 
```
and thereafter  any register content can be viewed using the command

```bash
reg 0 <register name>
```
The spike debugger along with a register is as shown below-

![C4](https://user-images.githubusercontent.com/63381455/123113626-513d8c80-d45c-11eb-9af0-5fa579c0920a.png)

Information on the RISC-V options is available in [RISC-V options](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html) and [here](https://www.sifive.com/blog/all-aboard-part-1-compiler-args).

Also certain nomenlature are also discussed starting from bits to doubleword. The chronological order of the same along with the RISC-V signed number and unsigned number ranges is as shown in the figure below.

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

Apart from inverter the logic gates, multiplexer, vectors are also coded using TL verilog. The logic gates code along with the output is as shown in figure and we can see that assigment of inputs is not necessary in TL verilog. Other sanpshot can be viewed [here](https://github.com/Geetima2021/RISC-V-Myth-workshop/tree/main/Images).

![Logic gates](https://user-images.githubusercontent.com/63381455/123433254-deade780-d5e8-11eb-8c36-629c5e99f808.png)

## Combinational calculator

Now a lab on combinational calculator is implemented that can perform `+, -, *, /` on two input values. The snapshot of the code, waveform and diagram is as shown below.
 
![combi_cal](https://user-images.githubusercontent.com/63381455/123447880-f50f6f80-d5f7-11eb-9102-af976e8ea547.png)

## Sequential calculator

First the Fibionacci series is discussed and the single line code `$num[31:0] = $reset ? 1 : (>>1$num + >>2$num);` implementing it is written. Here the concept of ahead operator `>>1 and >>2`which provides the output 1 cycle and 2 cycle before comes into the picture. Next a free running counter is designed using the ahead operator concept. The snapshot of the free running counter is as shown.

![counter](https://user-images.githubusercontent.com/63381455/123443247-5d0f8700-d5f3-11eb-8c40-f3219e7d0640.png)

Thereafter, the sequential calculator is implemented where the output of the previous stage serves as the input of this stage. The snapshot of the sequential calculator  is included below and the code is provided [here](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Codes/cal_seq)
![cal_sequential](https://user-images.githubusercontent.com/63381455/123452217-d57a4600-d5fb-11eb-8b50-a09cec85c7e6.png)

## Pipelining 

Pipelining or timing abstract is an important feature in TL verilog as it can be implemented very easily with fewer codes as compared to system verilog which reduces bugs to a great extent. An example of the pipeling for pythogoras theorem using both TL verilog and system verilog is shown [here](https://github.com/Geetima2021/RISC-V-Myth-workshop/blob/main/Images/pipelining_example.png). In TL verilog pipteling can be implemented by defining the pipeline as |calc and the different pipeline stages should be properly align and are indicated by @1, @2 and so on.

Below the snapshot of the pipeline sequential calcuator is included. Here the first pipeline stage consists of the input followed by arithimetic operation in the second pipeline stage and finally the ouput is included 2 cycles ahead in the third pipeline stage.

![pipeline_calculator](https://user-images.githubusercontent.com/63381455/123455095-f1331b80-d5fe-11eb-84d0-43ead26708ad.png)

## Validity

Validity is another feature in TL verilog which is asserted if a particular transactions in a pipeline is valid or true. A new scope, called “when” scope is introduced for this and it is denoted as `?$valid`. This new scope has many advantages - easier design, cleaner debug, better error checking and automated clock gating. The snapshot of a validity introduced in 2 cycle calculator is as shown below.

![validity](https://user-images.githubusercontent.com/63381455/123520842-8520e800-d6d0-11eb-88e4-a2e78a1b450d.png)

## Calculator with memory

Now the memory is added along with the additional recall feature to the 2 cycle calculator. The two highlighted feature is as shown in the snapshot added below. 

![Mem_recall](https://user-images.githubusercontent.com/63381455/123610760-84966780-d81e-11eb-9a72-02b9f777ba7e.jpg)

# Basic RISC-V CPU microarchitecture

The block diagram of a basic RISC-V microarchitecture is as shown in figure below. Now, using the Makerchip platform the implementation of the RISC-V microarchitecture or core is done. For starting the implementation a starter code present [here](https://github.com/stevehoover/RISC-V_MYTH_Workshop) is used. The starter code consist of -

- A simple RISC-V assembler.
- An instruction memory containing the sum 1..9 test program.
- Commented code for register file and memory.
- Visualization.

![RISCV-BD](https://user-images.githubusercontent.com/63381455/123661532-3e5afb80-d852-11eb-8ab9-55629049586b.png)

Designing of processor is based on three core steps fetch, decode and execute.

## Fetch

During the fetch stage, processors fetches the instruction from the memory to the address pointed by the program counter. The program counters holds the address of the next stage, in our case it is after 4 cycle and the instruction memory holds the set of instruction to be executed. The snapshot of the fetch stage is shown below.

![Fetch](https://user-images.githubusercontent.com/63381455/123745194-8834f780-d8cd-11eb-8514-2ce83838919c.png)

## Decode

For decoding a particular instruction, it is necessary that the isntruction type and format is known to the processor. The decoding is a crucial part and has to be done properly according to the given format to avoid error. There are 6 instructions type in RISC-V :

1. Register (R) type 
2. Immediate (I) type
3. Store (S) type
4. Branch (B) type
5. Upper immediate  (U) type
6. Jump (J) type

Following the decoding of the above, the instruction immediate decode for all the above, except the register type is added. The 6 others instruction format/fields including the opcode, 2 source register, destination register, funct3 and funct7 decode is included. Next the instruction field decode of the different instruction type is inserted to ensure that only valid registers are used. Finally the base instruction set decode for the various fields is incorporated. The instruction type and format is as shown in figure below and is sourced from [here](https://en.wikipedia.org/wiki/RISC-V).

![instr_format](https://user-images.githubusercontent.com/63381455/123752003-009fb680-d8d6-11eb-8b8e-874c4b1a4872.png)

Below is the snapshot of the entire decode logic.

![Decode](https://user-images.githubusercontent.com/63381455/123753367-63458200-d8d7-11eb-837e-549afe0a52f8.png)

## Register file read



