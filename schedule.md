# Schedule

## Don't re-read yourself

- The problem with repeated code; when re-reading becomes a burden
- DRRY: Don't Re-Read Yourself
  - Re-reading is the cost, repetition is only one way to pay it
  - "Spot the difference" in copy-paste-edit code
- DRY: Don't Repeat Yourself, as the special case
- When *not* to write a function
- Why write functions?
  - Managing complexity
  - Expressing ideas clearly
  - Speed of thought: getting unstuck faster

## Anatomy of a function

- Name, inputs (arguments), body, output
- Argument values arrive at the call, not at the definition
- Function signatures and what they communicate
- Good (simple) function design
- Naming things
  - Making function names evocative
  - Naming arguments and variables
  - Iteration is normal and expected
- Documenting a function with roxygen
  - `@param` and `@return` as design questions, answered before the body
  - Using `{fnmate}` to generate the skeleton

## Outside-in, inside-out

- Outside-in approach
  - Imagining the ideal function interface
  - What am I trying to do? What inputs do I need? What should it return?
- Inside-out approach
  - Starting with working code
  - Identifying the parts that change
  - Abstracting complexity step-by-step
- Moving between outside and inside views
  - Up and down the ladder of abstraction
  - Street-level vs map-level understanding

## Looking inside a function

- Errors are normal, not punishment
- Learning to read an error message
- Where did the error come from?
  - `traceback()`
  - `rlang::last_trace()`
- Stopping inside a function
  - `browser()`: setting breakpoints and stepping through code
  - `debug()` and `debugonce()`
  - `options(error = recover)`
  - The RStudio debugging interface
- Looking inside code that works, not just code that breaks

## From script to functions

- Hands-on: taking a real data analysis apart
- Chunking code
  - Code is not just lines, but ideas
  - Breaking 50 lines into manageable chunks
  - Each chunk should be individually understandable
- Extracting functions, step by step
- Practical debugging in action
  - Using `browser()` to explore function execution
  - Navigating to function definitions (Cmd/Ctrl + Click)
- Where it lands: an `R/` folder of documented functions, and a thin script

## Measure before you optimise

- Dangers of premature optimisation
- Evaluating compute time
  - `system.time()`
  - `{tictoc}`
  - `{profvis}`
- Comparing compute time
  - How to use `bench::mark()`
  - Evaluating many iterations with `bench::press()`

## Writing for your future self

- Bringing it all together
  - Work on your own code
  - Practice the outside-in and inside-out approaches
  - Apply debugging tools to real problems
- Code as writing
  - Functions help you express ideas
  - Iteration and refinement
- Resources and next steps
  - Key concepts to remember
  - Tools to continue using
  - Further learning materials
  - Open Q&A
