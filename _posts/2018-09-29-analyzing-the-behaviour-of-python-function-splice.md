---
layout: post
title: "Analyzing the behaviour of Python function slice"
date: "2018-09-29 10:17:46 +0530"
tag:
  - python
  - slice
  - python trick questions
---


![Title Image](/assets/images/python_slice_function/title_image.jpg)

Last Friday, I was sitting at one of the good coffee shops of Bangalore with my
friend. Coffee and discussion is the best combination to release stress. It was
looking like a perfect Friday evening, until my friend stroke with an idea of
asking me a question. Suddenly he said, "What if I ask you one quiz question
based on Python?"

"Aha! What is the level of difficulty?" I confusingly requestioned.

Here he played the trick. He said, "It is a bit difficult, but not that
difficult." And added he gave a wrong answer to this question at this last
interview.

I said confidently, "Then please go ahead."

He stood up, took a tissue paper from nearby counter and scathed below code on
it.

```python
def my_function():
    l = [0, 1, 2]
    print(l[30:])

my_function()
```

And he asked me by pointing towards that code, "What will be the output of this
code?"

Now it was my turn to give the answer. I looked at the code and tried parsing it
in my head by iterating it line by line. In my mind I observed the first line.
It was defining a function which is looking correct. I moved my eyes to the next
line.  I found the `l` is a variable of type `list` assigned with values ranging
from 0 to 2. This either isn't looking problematic. So I forwarded to the next
line where it was trying to print list by slicing it from starting value `30` to
the infinity.

"Well, the start value is 30 which is greater than the length of the list. This
should raise an `IndexError`" I said in my mind. After this what happen actually
created a problem for me. I was about to speak an answer, but suddenly Devil of
me splashed.

"It is even less than a banana job my dear. You should take some advantage to
this opportunity for earning something more JAY!" that Devil murmured in my
ears.


To be frank, I was confused at that moment.  Because things were looking in my
control I negotiated with the Angle and decided to be with the Devil. I said,
"How about betting for some real values?". By going closer I spoke, "If I answer
correctly, You will pay the bill and If I am wrong, This will be a treat from my
side."

He thought for a while and shook his head as a sign of affirmation.  Now it was
my turn to show the cards. I said, "It will raise an `IndexError`."

He starred my face for a second and said "Okay". After pausing for a second he
questioned, "Are you sure about this?".

This was the hint he gave to me for taking another shot. I was overconfident by
lurking thought seeded by the Devil and said, "Yes I am."

With that answer he instantly opened his bag pack, took his Laptop out and ran
the code which he wrote on that tissue.

When he paused typing I said in a strong voice, "So did I
won?"

He turned his laptop towards me and said, "Not at all!"

When I looked on screen, the interpreter was printing `[]`. Damn! I lost the
bet. It was a shocking moment for me. Why the hell `slice` is returning an empty
list even when we are trying to `slice` it with a value which is greater than
the length of it! It was surely looking unpythonic behavior. I paid whatever the
bill amount was. Entire evening this question was all cramming on my mind. After
coming home, I decided to find reasons for returning an empty list instead of
raising an `IndexError` from a `slice`.

Below are a few reasons mainly why returning an empty list makes more sense
instead of raising an `IndexError` when the `slice` is called with values greater
than the length of the Iterator object.

For those who haven't used splice anytime in their life, I advise to read [this]
[1] tutorial.

* **Reason number one:**

  Python lists are more commonly used at iterations. Consider below example:

  ```python
  numbers = [0, 1, 2, 3]
  for number in numbers[30:]:
      print(number)
  ```

  If `slice` was raising an `IndexError`, then above code could have been coded
  like this

  ```python
  numbers = [0, 1, 2, 3]
  try:
      for number in numbers[30:]:
          print(numbers)
  except IndexError:
      pass
  ```

  Or in another way below is also looking reasonable

  ```python
  numbers = [0, 1, 2, 3]
  start = 30
  if len(numbers) > start:
      for number in numbers[start:]:
          print(number)
  ```

  Both the approaches are looking little lengthy for an obvious reason of
  preventing executing the loop if there are no elements in it. When we expect
  the behavior of `slice` compared with using `for in`, it makes sense to return
  an empty list instead of raising an `IndexError`.

I am not getting further reasons for returning an empty list instead of raising
the `IndexError` from `slice`. But I am sure, there will be. If you know any
other potential reasons for such behavior of `slice`, please drop me a mail at
**jaysinhp** at **gmail** dot **com** or contact me over a Twitter
[@jaysinhp][3].  I will update the reasons at this post and give credits to you.

I advise to read [this][2] guide for understanding how a splice function
converts the input values. Especially rule number 4 referenced in it.


###### Proofreaders: [Geoffrey Sneddon](https://github.com/gsnedders), [Elijah](https://mailto:thyarmageddon@gmail.com), [Mahendra Yadav](mailto:mahendra.k12@gmail.com)

[1]: https://docs.python.org/3.7/tutorial/introduction.html#lists
[2]: https://docs.python.org/3.7/library/stdtypes.html#sequence-types-list-tuple-range
[3]: https://twitter.com/jaysinhp
