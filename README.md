# Introduction to Functions and Debugging


<!-- README.md is generated from README.qmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

<https://fun2debug.njtierney.com>

**Prerequisites**

- Basic R programming experience
- Familiarity with R scripts and basic data manipulation
- Experience running R code and encountering errors
- An analysis script of your own that you would like to improve

**Learning outcomes**

- Write functions that express an idea, so your code reads the way you
  would explain it
- Spot when code has become expensive to re-read, and use a function to
  fix that
- Recognise repetition as one reason to write a function, not the only
  one, and know when not to write one at all
- Design a function from the outside in, before writing its body
- Extract a function out of code you have already got working
- Name functions and arguments so they explain themselves
- Document a function with roxygen, so you and others know how to use it
- Read an R error message and work out where it actually came from
- Use `browser()`, `debug()` and `debugonce()` to look inside a running
  function
- Turn a long analysis script into a set of functions without breaking
  it
- Measure what is actually slow before trying to speed it up, and
  compare implementations fairly

# Details

I would argue the highest value skillset in statistical programming is
knowing how to write good functions. Functions are often taught as a
tool to avoid repetition using the mnemonic DRY: Don’t Repeat Yourself.
Whilst DRY is both true and real, I think functions are at their best
when they encapsulate expression and are easy to reason with. That is,
DRY is sufficient, but not necessary.

Writing good functions is more than esoteric aesthetics. We need to be
able to reason with our code in statistics. We often don’t have the
capacity to write tests to show our code is “correct”. Instead, we need
to rely on our ability to reason with, trust, and verify that the code
works as it should. I believe writing good functions that encapsulate
expressions and are able to be reasoned with are how we can ensure our
code, and therefore our methods, and our analyses, work as they should.

This course is for people writing analysis code, not packages. You will
take a real analysis script, ideally your own, and turn it into a set of
named, documented functions that you can look inside when something goes
wrong, and reason about when it doesn’t. The functions you end up with
are the same unit of work that pipelines like `targets` are built from,
so this is useful whether or not you ever write a pipeline.

# Schedule

## Don’t re-read yourself

- The problem with repeated code; when re-reading becomes a burden
- DRRY: Don’t Re-Read Yourself
  - Re-reading is the cost, repetition is only one way to pay it
  - “Spot the difference” in copy-paste-edit code
- DRY: Don’t Repeat Yourself, as the special case
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
  - What am I trying to do? What inputs do I need? What should it
    return?
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
- Where it lands: an `R/` folder of documented functions, and a thin
  script

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
