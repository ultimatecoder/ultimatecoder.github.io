---
layout: post
title: "Analyzing the behaviour of Python function slice"
date: "2018-09-29 10:17:46 +0530"
tag:
  - python
  - slice
  - python trick questions
---

Preface
Last Friday, I was sitting at one of the good coffee shop in the Bangalore with
my friend. Coffee and discussion is best combination to get relax. It was
looking like a perfect Friday even, until my friend stroke an idea of asking me a
Python question. He said, "What if I ask you one quiz question based on
Python?". I said, "Aha! Is it something too much difficult?". Here he played the
trick. He said, "It is a bit difficult, but not that much difficult. I gave a
wrong answer when someone asked me this at my last interview.". I said, "Please
go ahead!". He stood up, went for taking a tissue paper and wrote below code.

def my_function():
  l = [0, 1, 2]
  print(l[30:])

my_function()

And asked me, "What will be the output of above code?". As soon I looked the
code, I went through the iteration. I observed the l is a list. and in third
line, it is trying to access slice a list with higher start value then length of
the list. Which is clearly raising an IndexError because length of the l is 3. I
said in my mind, "It is even less than a banana job. I should grab this
opportunity to earn something more." I decided to take the advantage of the
situation. Because I was sure, I will be on winning side, I said "What if we put
some real world conditions to this problem?. If I answer correctly, You will pay
the bill and If I am wrong, I will take the responsibility of paying this
bill". He thought for a while and said affirmatively answered by saying "Done!".
I said it will raise an IndexError. He thought for a while and said "Okay". And
after some pause he asked "Are you sure about this?" Now, here there was some
hints he gave. I said, "Yes I am". Within a second he opened his bag pack took
his Laptop out and ran the code which he wrote on a tissue. I was sure and said
"So did I won?" he turned a laptop towards me and said, "Not at all!". When I
looked on screen, it was printed "[]". Damn! I lost the bet. I paid whatever the
amount was and then this shocking question was all turning me down. After coming
home, I sat on my bed with this thought running on my head.


It was a great shocking moment for me.  Why the hell the slice returns an empty
list even when we are trying to slice it with an value which is above the length
of it!. It was surely looking unpythonic behaviour at present. I decided to room
round and thought more on this.

Below are few reasons mainly why returning an empty list make sense instead of
raising an IndexError in slice.
