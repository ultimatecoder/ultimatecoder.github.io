---
layout: post
title: "How to write automated functional tests for your command line utility?"
date: "2019-05-26 13:49:39 +0530"
tags:
  - Ruby
  - Testing
  - Cucumber
  - Aruba
  - Functional-test
  - How-to
---

## Introduction

  Recently I had to write lot of command line utilities as a part of solving
  GeeksforGeeks exercises. The programming language I am using has a great
  support for writing unit tests, but I didn't find anything capable for the
  purpose of writing functional tests. After trying quite a few approaches, I am
  satisfied with Aruba. Aruba is a module of popular behaviour driven testing
  framework Cucumber.  Aruba makes the Cucumber capable to test any command line
  utility. Before using Aruba, I was not having any experience of writing
  Behaviour Driven Tests nor using the Cucumber, but learning and using Aruba
  didn't took any time. I am sure, you will be able to use Aruba for your
  purpose with a small overhead of learning.

  In this post, I will explain how to install and configure Aruba. For the
  demonstration, I will write functional tests for two command line utilities.
  After writing a functional tests, I will teach to invoke the Cucumber utility
  to run written functional tests.


## Example

  We will write a command line utility which accepts a Nth position of a
  Fibonacci number, computs Fibonacci number for accepted position and prints it
  on a screen. For example, The number 2 is the Fibonacci number for 3rd
  position. For a reference you should read the sequence of Fibonacci numbers
  here.


### Writing functional tests

  We will write functional tests feature by feature. First we will write a
  functional test for computing a Fibonacci number.

#### Feature: Compute a Fibonacci number non interactively

  Create a new file `compute_a_fibonacci_sequence_non_interactively.feature` at
  `Features` directory initialized by the Cucumber and type or paste below
  content in it.

  ```
  Feature: Compute Nth Fibonacci sequence non-interactively

    Scenario: The program should compute 2nd Fibonacci number accurately.
      When I run `fibonacci 2`
      Then the output should contain:
      """
      1
      """

    Scenario: The program should compute 50th Fibonacci number accurately.
      When I run `fibonacci 10`
      Then the output should contain:
      """
      55
      """

    Scenario: The program should give error when position entered is below 0.
      When I run `fibonacci -1`
      Then the exit status should be 1

    Scenario: The program should give error when no position is entered.
      When I run `fibonacci`
      Then the exit status should not be 0
  ```

  We will do a feature driven development for this example. We added a failing
  test case for our functionality before writing the actual code. There are many
  advantages of doing a behaviour driven development, but I am not going to
  discuss them here. Now we will run the test runner by below command.

  ```
  cucumber
  ```

  # TODO: Add a screen shot of failing test cases output.

  Our test case will fail odiously because we haven't wrote any solution yet. We
  will write a program which will pass this test case.

  Create a file `fibonacci` at the home directory of your project.Write below
  content in it. With a intention of making this program as a command line
  utility, we are not adding a file extension.

  ```python
  #! /usr/bin/env python

  import argparse


  def compute_fibonacci(position: int) -> int:
      """Calculates a fibonacci number for given position

      Arguments:
          * position : Position of fibonacci sequence. A value of 3 will return a
                       fibonacci position for 3rd position.
      Example

          >>>compute_fibonacci(2) == 1
      """
      if position == 0:
          return 0

      if position == 1:
          return 1

      return compute_fibonacci(position - 1) + compute_fibonacci(position - 2)


  if __name__ == "__main__":
      parser = argparse.ArgumentParser(
          description="Computes Nth Fibonacci number"
      )
      parser.add_argument(
          'position',
          type=int,
          help="Nth position of Fibonacci number"
      )
      args = parser.parse_args()
      print(compute_fibonacci(args.position))
  ```

  Save this file and assign a permission to execute this file using below
  command.

  ```shell
  chmod +rwx fibonacci
  ```

  You can invoke our program in a below way

  ```shell
  ./fibonacci 2
  ```

  This should display appropriate Fibonacci number at a console of your screen.

  Now if we will run the cucumber tests by below command

  ```shell
  PATH=$PWD:$PATH cucumber
  ```

  The `PATH` prefix is nothing but a way to add current directory to a current
  system path so that the `cucumber` can find our `fibonacci` program.

#### Feature: Compute Fibonacci numbers interactively

  We will add another feature in which our existing fibonacci utility will
  compute a fibonacci numbers interactively. Let's write a functional tests for
  it first.

  Create `compute_a_fibonacci_sequence_interactively.feature` file at `Features`
  directory and type or paste below content in it.

  ```
  Feature: Compute a Fibonacci number interactively

    Scenario: The program should compute accurate Fibonacci numbers when invoked interactively.
      When I run `fibonacci -i` interactively
      And I type "0"
      And I type "1"
      And I type "3"
      Then the output should contain:
      """
      0
      1
      2
      """

    Scenario: The program should give error when given Fibonacci position is below 0.
      When I run `fibonacci -i` interactively
      And I type "-1"
      Then the exit status should not be 0
  ```

  If you had read content of a given feature tests, you had realized that the
  test needs no explanation at all. It has written in a way that any
  non-technical person can understand. That's the power of Gherkin syntax.
  Involved people like Managers, Investors, Functionality testers can interact
  without any technical hurdles.

  You can run these tests using the same command we have fired earlier. From the
  output you can see that our feature for testing interactive inputs is failed.
  Let's add this feature to our `fibonacci` utility by updating its code as
  below.

  ```python
  #! /usr/bin/env python

  import argparse


  def compute_fibonacci(position: int) -> int:
      """Calculates a fibonacci number for given position

      Arguments:
          * position : Position of fibonacci sequence. A value of 3 will return a
                       fibonacci position for 3rd position.
      Example

          >>>compute_fibonacci(2) == 1
      """
      if position == 0:
          return 0

      if position == 1:
          return 1

      return compute_fibonacci(position - 1) + compute_fibonacci(position - 2)


  if __name__ == "__main__":
      parser = argparse.ArgumentParser(
          description="Computes Nth Fibonacci number"
      )
      parser.add_argument(
          'position',
          type=int,
          nargs="?",
          help="Nth position of Fibonacci number"
      )
      parser.add_argument(
          '-i',
          dest="interactively",
          action="store_true",
          help="Call this program in an interactive manner"
      )
      args = parser.parse_args()
      if args.interactively:
          while True:
              position = int(input(''))
              print(compute_fibonacci(position))
      else:
          print(compute_fibonacci(args.position))
  ```
