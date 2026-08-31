# Dependencies: When are they worth it?

Nick's take: Be greedy. Use all the dependencies. Then prune back if they are a problem.

For most people, you don't need to worry about it.

When are too many dependencies...too many?

- If you are on High Performance Computer (HPC): It can be worthwhile to think through what you need to install.
  - Example: You use `library(tidyverse)` but you only use functions from ggplot2 and dplyr and tidyr. So, just use those packages.
  - example: You use dplyr for one function: mutate, and you only use it once.
  - The cost of packages on HPC:
    - Installation time: Typically HPC requires you to download "from source" - which means the R code needs to be compiled, which takes time.
    - Sometimes HPC can be finnicky with R packages that might use specific or special C code, or Java code.

- If you are developing R packages: only require the packages that you really need for your users.
