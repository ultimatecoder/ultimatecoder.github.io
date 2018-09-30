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

Last Friday, I was sitting in one of the good coffee shops in Bangalore with my
friend. Coffee and discussion is the best combination to release stress. It was
looking like a perfect Friday evening, until my friend was struck by an idea of
asking me a question.

“What if I ask you a quiz question?” said by him at the middle of our
conversation.

“Aha! What is the level of difficulty?” I said confusingly.

Actually, he played the trick here. He hinted, “It is a bit difficult, but not
that difficult. I gave a wrong answer to this question in my last interview.”

I said confidently, “Then please go ahead.”

He stood up, took a tissue paper from a nearby counter and scratched below code on
it. And he asked me by pointing towards that code, “What will be the output of
this code?”

```python
def my_function():
    l = [0, 1, 2]
    print(l[30:])

my_function()
```

Now it was my turn to give the answer. I looked at the code and tried parsing it
in my head line by line. In my mind, I observed the first line. It was defining
a function which looked correct. I moved my eyes to the next line. It was
defining a variable l of type list and assigning values ranging from 0 to 2.
This either wasn’t looking problematic. So I forwarded to the next line where it
was trying to print that variable l by slicing it from starting value 30 to the
infinity.

“Well, the start value is 30 which is greater than the length of the list. This
should raise an IndexError” I said in my mind. I was about to speak an answer,
but suddenly Devil of me splashed.

“It is even less than [a banana job][4] my dear,” the Devil said to me, “You should
take some advantage to this opportunity my boy.”

To be frank, I was confused at that moment. Because things were looking in my
control I negotiated with the Angle and decided to be with the Devil.

I said, “How about betting for some real values?”

By going closer I spoke, “If I answer correctly, You will pay the bill and If I
am wrong, This will be a treat from my side.”

He thought for a while and shook his head as a sign of affirmation. Now it was
my turn to show the cards.

I said in a strong voice, “It will raise an IndexError.”

He starred my face for a second and spoke, “Okay”.

After pausing for a second he teased, “Are you sure about this?”.

This was the hint he gave to me for taking another shot to this. I was
overconfident by lurking thought seeded by the Devil. I didn’t think much here.

I said with a flat face, “Yes I am.”

With my answer, he instantly opened his bag pack, took his Laptop out and typed
the code which he wrote on that tissue.

When I stopped hearing a sound of typing I yelled, “So did I won?”

He turned his laptop towards me and exclaimed, “Not at all!”

When I looked on screen, the interpreter was printing []. Damn! I lost the bet.
Why the hell slice is returning an empty list even when we are trying to slice
it with a value which is greater than the length of it! It was surely looking
unpythonic behavior. I paid whatever the bill amount was. Entire evening this
question was all cramming my mind. After coming home, I decided to find reasons
for returning an empty list instead of raising an IndexError from a slice.

Below are a few reasons justifying such behavior of slice function. I am sharing
this with you so that you don’t lose a bet with your friend :) For those who
haven’t used slice anytime in their life, I advise to read this tutorial.

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
**jaysinhp** at **gmail** dot **com** or contact me over Twitter [@jaysinhp][3].
I will update the reasons at this post and give credits to you.


I advise reading [this][2] guide for understanding how a slice function converts
the input values. Especially rule number 4 referenced there.


###### Proofreaders: [Geoffrey Sneddon](https://github.com/gsnedders), [Elijah](https://mailto:thyarmageddon@gmail.com), [Mahendra Yadav](mailto:mahendra.k12@gmail.com)

[1]: https://docs.python.org/3.7/tutorial/introduction.html#lists
[2]: https://docs.python.org/3.7/library/stdtypes.html#sequence-types-list-tuple-range
[3]: https://twitter.com/jaysinhp
[4]: http://catb.org/jargon/html/O/one-banana-problem.html
