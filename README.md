# Introduction to Functions and Debugging


<!-- README.md is generated from README.qmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

## Prerequisites

- Basic R programming experience
- Familiarity with R scripts and basic data manipulation
- Experience running R code and encountering errors

## Learning outcomes

In this course you will learn the following ideas on writing good
functions:

- How to write functions to:
  - Manage complexity
  - Explain and express ideas
  - Techniques for developing good functions: outside-in, inside-out
  - Avoid repetition
- How to debug functions and troubleshoot common errors
- Best practices for function documentation

## Course website

<https://fun2debug.njtierney.com>

## Details

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

## Schedule

### Why Functions Matter

- The problem with repeated code
  - Recognising patterns in data analysis scripts
  - “Spot the difference” problem
  - When re-reading code becomes a burden
- Why write functions?
  - Managing complexity
  - Expressing ideas clearly
  - Making code easier to reason about
- Moving beyond DRY (Don’t Repeat Yourself)
  - DRRY: Don’t Re-Read Yourself
  - Functions as tools for expression
  - When to write a function (it’s not just about repetition)

### Function Fundamentals and Design

- Anatomy of a function
  - Name, inputs (arguments), body, output
  - Function signatures and what they communicate
- Two approaches to writing functions
  - Outside-in: Start with how you want to use it
  - Inside-out: Extract from existing code
- Naming things
  - Making function names evocative
  - Naming arguments and variables
  - Iteration is normal and expected

### Writing Functions in Practice

- Outside-in approach
  - Imagining the ideal function interface
  - What am I trying to do?
  - What inputs do I need?
  - What should it return?
- Inside-out approach
  - Starting with working code
  - Identifying the parts that change
  - Abstracting complexity step-by-step
- Moving between outside and inside views
  - Up and down the ladder of abstraction
  - Street-level vs map-level understanding

### Debugging Basics and Tools

- Why debugging matters
  - Functions create boxes we need to look inside
  - Errors are normal, not punishment
  - Learning to read error messages
- Essential debugging tools
  - `browser()`: Setting breakpoints and stepping through code
  - RStudio debugging interface
  - `debug()` and `debugonce()`
- Common debugging workflow
  - Where did the error occur?
  - What values do variables have?
  - Testing assumptions step-by-step

### Cleaning Up a Data Analysis

- Hands-on: From script to functions
  - Taking a real data analysis
  - Breaking down complexity
  - Identifying what to turn into functions
- Chunking code
  - Code is not just lines, but ideas
  - Breaking 50 lines into manageable chunks
  - Each chunk should be individually understandable
- Practical debugging in action
  - Using `browser()` to explore function execution
  - Finding and fixing issues
  - Navigating to function definitions (Cmd/Ctrl + Click)

### Practice and Integration

- Bringing it all together
  - Work on your own code
  - Practice the outside-in and inside-out approaches
  - Apply debugging tools to real problems
- Code as writing
  - Functions help you express ideas
  - Iteration and refinement
  - Writing code for your future self
- Resources and next steps
  - Key concepts to remember
  - Tools to continue using
  - Further learning materials
  - Open Q&A
