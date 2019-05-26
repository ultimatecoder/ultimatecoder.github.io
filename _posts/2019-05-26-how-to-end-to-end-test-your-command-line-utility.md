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


## Example - 1

  Our purpose is to write a command line utility which accepts a Nth position
  from a user and prints a Fibonacci number for that position. For example if
  given input is 3 then program should return 2. You can read the sequence of
  Fibonacci numbers here.


### Writing functional tests

  We will write functional tests feature by feature. First we will write a
  functional test for computing a Fibonacci number.

#### Feature: Compute a Fibonacci number

  Create a new file `compute_fibonacci_number.feature` at `Features` directory
  initialized by the Cucumber and type the below content in it.
