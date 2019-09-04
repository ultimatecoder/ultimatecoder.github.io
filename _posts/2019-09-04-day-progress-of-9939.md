---
layout: post
title: "Day progress of 9939"
date: "2019-09-04 22:46:01 +0530"
days:
  - fulfill_io_task
  - daily
---

## Morning

I woke up around 10:30 AM. I was late because I slept late Yesterday night. I
was trying to implement efficient way to deliver file processing events using
Server Sent Events for task given by FulFill IO as an assignment. I skipped
break fast and tried to implement it so that I can submit assignment to them.

### Products Upload task

I found that documentation of Django channels were having example implementation
of Server Sent Events. That was looking like it will run in a constant loop and
in async manner. That approach was looking efficient than an approach of
individual Thread approach.

I was able to write that structure of Django channel consumer, but I was not
able to get events shared by my consumer to browser. I tried entire morning
doing that, but I didn't received any thing positive. These events were
displayed as HTTP response body when I terminate my browser connection. I was
not able to realise why this is happening like this.

I was hungry and decided to have food and went to co-working space.


## First half

### Products Upload task

On the way to restaurant, I was thinking about such behaviour of Server Sent
Events in a background. I realized that SSE is a stream maintained by server to
browser. Because it is a socket type connection, just like how WebSockets are, I
thought it can be problem at Browser side, who is unable to understand a type
of connection which is open for a long time.

I observed code of Django eventstream library, which is implementing higher
level interfaces to sent SSE. I tried to understand their way to send body to
clients. I also observed an implementation of AsyncHTTPConsumer handler of
Django channels. It gave me core understanding of an idea of how long polling
HTTP connections are handle red under the hood.

From those examples, I improved given SSE example at Django channels
documentation. At guess what? I was able to get events at JS side. Here is a
thing to remember, when you are observing long polling HTTP connections, browser
don't display anything in response or body until it is stopped. May be in future
version of Firefox browser, we get a feature in which it is able to understand
it and give developer friendly features in it.

After that, I just dumped my code of SSE to the implementation of Narad. Now the
only thing I had to figure out was to have a URL pattern for event streams which
maintains different consumers for them. Well, it was already maintaining an
individual connections for it, but from URL I can task task id and from that I
can fetch details of celery task.

Guess what? I stuck at this point. URL structure with `django.url.path` was
causing problem. I spent almost 1 hour trying to figure out the problem. Then I
switched to old style URL structure of Django, it turns out to be working. I
quickly grabbed regular expression for parsing long UUID kind of value and coded
rest of things.

I completed existing SSE to give more user friendly events and event data.
Tested it once and pushed docker images to running Heroku instance. Mailed the
recruiter that I have uploaded given task at Heroku and shared URL of Heroku
instance. I also explained the reason for taking some more time on it.

I am positive, but I took 6 more days to complete this task. I improved things
drastically on this task. Such delay is not accepted when it comes to
competitive market. I am sure there will be many to complete this task in given
time frame. I am sure I will not be the one who has done this efficiently. But I
invested my time to learn most from this task. It was fun to do and I don't have
any regret of it. I am happy that I have implemented it in a good efficient way.
I am not concluding that this is the last limit to improve things, but I am
happy that I did this in a good efficient way. Let's hope for the best!

If they will like my solution, they will move forward and will take another
rounds of mine.


## Second half

### Amazon interview

The recruiter told that I should prepare for Leetcode easy to medium category
questions. I should not invest my time in solving hard problems because time is
limited. Recruiter has to deal with large number of interviews.

He told that part of non-technical questions or leadership questions are as much
important as technical questions. I should not ignore them. He also explained
that in history of Amazon hiring, there were tons of candidate who has performed
exceptionally well in technical questions, but they were not able to perform
well in non-technical questions. He strongly recommended that I should not
ignore them.

I should carry at least one photo ID card issued by government. I have to sign
certain non disclosure agreements before starting interview.

He said that I should prepare examples for each of the leadership principles of
Amazon. Preparing examples related from my experience will help. I should be
ready for answering counter questions based on my examples. He said I should
at least have an example for these four leadership principles.

1. Hire and Develop the best
2. Dive Deep
3. Have backbone; Disagree and Commit
4. Deliver Results

I should use Google for searching on how to prepare for non-technical questions.

While answering for non-technical questions, I should focus on my contribution
to team rather than showing a team effort.

While giving examples, I should add numbers. Adding numbers puts more weight to
things I will talk.

When I asked about dress code, he said "Amazon is not a suite and tie company,
but I should be in formals".

Three of my interview will be algorithm and data structure rounds, in which I
have to code them on white board. He has shared details with me. I will try to
refer them.

He said, technical rounds are designed in a way that three people will be an
engineer from Amazon and one will be engineering manager. I will be sitting in
room and my interviewer will come for taking my interview. Even if I am
performing bad in an interview, they will take whole four round of my interview.

## Tomorrow

I will take sample test of Hackerrank which includes 3 question. In which 2 are
coding question and 1 is multiple choice question. [Sample
test](https://www.hackerrank.com/tests/sample).

My coding test at Air Asia will last 60 minutes long in which there will be 2
question. Dividing them, there will be 30 minute for each question. I will try
to practice solving Hackerrank questions in 20 minutes.

Below is first round of questions. I will not invest more than 20 minutes to
solve these question. I will switch to another question once it is one.

### Round one - 80 minutes

1. [Non-Divisible
Subset](https://www.hackerrank.com/challenges/non-divisible-subset/problem).
2. [Queen's
Attack](https://www.hackerrank.com/challenges/queens-attack-2/problem).
3. [Maximum
Palindromes](https://www.hackerrank.com/challenges/maximum-palindromes/problem).
4. [Minimum Penalty
Path](https://www.hackerrank.com/challenges/maximum-palindromes/problem).


### Round two - 80 minutes

1. [Contacts](https://www.hackerrank.com/challenges/chocolate-in-box/problem).

2. [Components in a
graph](https://www.hackerrank.com/challenges/components-in-graph/problem).

3. [Down to zero
II](https://www.hackerrank.com/challenges/down-to-zero-ii/problem).

4. [Largest
Rectangle](https://www.hackerrank.com/challenges/largest-rectangle/problem).


### Round three - 80 minutes

1. [Snakes and Ladders: The Quickest Way
Up](https://www.hackerrank.com/challenges/the-quickest-way-up/problem).
2. [Prime Digit
Sums](https://www.hackerrank.com/challenges/prime-digit-sums/problem).
3. [Kingdom
Division](https://www.hackerrank.com/challenges/kingdom-division/problem).
4. [The Great
XOR](https://www.hackerrank.com/challenges/kingdom-division/problem).


### Round four - 80 minutes

1. [Self Balancing
Tree](https://www.hackerrank.com/challenges/self-balancing-tree/problem).

2. [Is this a binary search
tree?](https://www.hackerrank.com/challenges/is-binary-search-tree/problem).
3. [Cycle
detection](https://www.hackerrank.com/challenges/detect-whether-a-linked-list-contains-a-cycle/problem).
4. [Jim and the
   skyscrapers](https://www.hackerrank.com/challenges/jim-and-the-skyscrapers).


### Round five - 80 minutes

1. [Recursive Digit
Sum](https://www.hackerrank.com/challenges/recursive-digit-sum/problem).
2. [Short
Palindrome](https://www.hackerrank.com/challenges/short-palindrome/problem).
3. [Pairs](https://www.hackerrank.com/challenges/pairs/problem).
4. [Minimum Loss](https://www.hackerrank.com/challenges/minimum-loss/problem).


### Round six - 20 minutes

1. [Chocklate in
Box](https://www.hackerrank.com/challenges/chocolate-in-box/problem).


After solving above problems, I will revise unsolved problems and try to read
and prepare algorithms for them. It will take nearly 400 minutes. Which means 7
hours of concentrated work. This is very difficult to solve. Questions are all
medium category. I am sure it will take huge amount of time to solve un-solved
questions.
