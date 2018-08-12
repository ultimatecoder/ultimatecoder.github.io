---
layout: post
title: "Walkthrough with features introduced in Core Python 3.7"
date: "2018-08-12 15:51:15 +0530"
tag:
  - Python
  - CorePython
  - Python3.7
---


In this post, I will try to explain improvements done in Core Python version
3.7. Below is the summary of features covered in this post.

* Breakpoints

* Subprocess

* Dataclass

* Int with underscores

* Namedtuples

* Hash-based Python object file

### breakpoint()

Breakpoints are extream important tool for debugging. Since I started learning
Python, I am using the same API for putting breakpoints. With this release,
breakpoint() is introduced as n new built-in function which can be used for
putting breakpoints in your code.  Putting breakpoint by calling a breakpoint
function is handier than importing a ```pdf.set_trace()```.

![Breakpoint function in Python 3.7](/assets/images/walkthrough_python_3_7/breakpoint_example.gif)

Code used in above example

```python
for i in range(100):
    if i == 10:
        breakpoint()
    else:
        print(i)

```

### PYTHONBREAKPOINT

There wasn't any handy option to
disable or enable existing breakpoints with single flag. But with this release
you can certainly reduce your pain by using ```PYTHONBREAKPOINT``` environment
variable. You can disable all breakpoints in your code by setting the environment variable
```PYTHONBREAKPOINT``` to ```0```.


![Breakpoint environment variable in Python 3.7](/assets/images/walkthrough_python_3_7/breakpoint_environment_variable_example.gif)

##### Note Use "PYTHONBREAKPOINT=0" in your production environment to avoid unwanted pausing at forgotten breakpoints


### Subprocess.run(capture_output=True)

You can pipe the output of Standard Output Stream (stdout) and Standard Error
Stream (stderr) by enabling ```capture_output``` parameter of
```subprocess.run()``` function.

![subprocess.run got capture_output parameter](/assets/images/walkthrough_python_3_7/subprocess_run_capture_output.gif)


### Dataclasses

The new class level decorator ```@dataclass``` introduced with ```dataclasses```
module. It will reduce many lines of your code.  Python is well-known for
developing features which allows to achieving more by writing less. Basic
understanding of Typehints is expected to understand this feature.

The ```@dataclass``` decorator will put obvious construct code. Additionally, it
will define a behaviour for dander methods ```__repr__()```, ```__eq__()``` and
```__hash__()``` for us.


![Dataclasses.dataclass](/assets/images/walkthrough_python_3_7/dataclasses_dataclass.gif)

Below is the code before introducing a ```dataclasses.dataclass``` decorator.

```python
class Point:

    def __init__(self, x, y):
        self.x = x
        self.y = y
```


After wrapping with ```@dataclass``` decorator it reduces to below code

```python
from dataclasses import dataclass


@dataclass
class Point:
    x: float
    y: float
```


### Namedtuples

According to me namedtuples are less known, but very helpful feature in Python.
With this release, you can define default arguments of variables.

![Namedtuples with default arguments](/assets/images/walkthrough_python_3_7/namedtuple_example.gif)

##### Note: Default arguments will be assigned from left to right. In the above example, default value ``2`` will be assigned to variable ``y``

Below is the code used in the example

```python
from collections import namedtuple


Point = namedtuple("Point", ["x", "y"], defaults=[2,])
p = Point(1)
print(p)
```

### .pyc

***.pyc*** are object files generated every time you change your Python code
file (.py). At present identifying the change in Python code is done by
comparing meta fields like last edited date and by few other fields. With this
release, that functionality is improved by comparing files with a hash-based
approach. Hashed approach is quick and more consistent than a metadata approach.
Though this improvement is still considered unstable and CPython will continue
with the metadata approach.
