# RISC-V Myth workshop
![1](https://user-images.githubusercontent.com/63381455/122866731-19442580-d346-11eb-9821-0c316b5c2c0b.JPG)

# Table of contents

- [Overview](#overview)
- [Day 1 : Introduction to RISC-V ISA and GNU compiler toolchain](#intro)
- 


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










 

