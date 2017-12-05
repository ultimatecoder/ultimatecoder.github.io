---
layout: post
title: "Book review: Docker Up & Running"
date: "2017-12-05 11:26:32 +0530"
tags:
  - books
  - docker
  - linux
---

TL;DR

The book provides nice overview of Docker toolchain. It is not a reference book.
Even though few options are depricated, I will advice you to read this book and
then refer to the official documentation to get aware with latest development.

Detailed overview

In modern software engineering, terms are coined to the audience with a new
wrapper. Such wrappers are required to earn your bread & butter. They proclaim
that they are solving a problem and because they are solving a problem it is
evident to make money from it. A good marketed term is assumed as best practice.
I am asserting success of term "Open source" even after 18 years. Congratulation
E.Raymonds You won!

I was unsure about the Docker technology. Even I was unfamiliar with the
container technology. Such undiscovered technology was preventing me to get
communicate with others. My certain goal was to get aware about it so that I can
nudge(with understanding) what others are talking. I started reading about
Docker from the official "Getting started" guide.  It somehow worked, but one
strong indication I realized when I was trying to deploy my blog using Docker. I
found I was still unclear abut the internals. I noticed, the tutorial I am
reading is only discussing exposed API of the tool which I found very shallow in
comparison to the technology. My inert was telling am I not sure what I am
doing. Such quest lead me to find better resource which introduces this tool in
other way. With some Quora posts and some Goodreads reviews I decided to learn
by reading "Docker Up & Running by K. Matthias & S. Kane". I consider books
written on any tool are likely to be outdated soon and that is the exact with
this book too. After reading table of content, I concluded to purchase it
because it is containing topics based on fundamentals. I got printed copy at
nearly 450 INR (which is near to 7 USD, where 1 USD = 65 INR) from Amazon.in
which is fairly appropriate with respect to the print quality.

The book begins with little history of container (Docker is an implementation of
container). Initial chapters are discussing higher level overview of Docker tool
combining Docker engine , Docker image, Docker registry, Docker compose and
Docker container. Authors had discussed where Docker technology should not be
implemented can can result as a bad practice. I must insist to not skip that
topic. I skipped the dedicated chapter on installing Docker to your
distribution. I got to aware about few other methods to distribute Docker images
rather than repository. You should not skip the chapter which is discussing the
behaviour of container. That chapter cleared many confusions of mine. I must
insist to not skip that chapter and try to re-read if you are lost in between.
Such chapters are enough for getting an overview of Docker containers and image.
Next chapters are focused more on best practices to setup the Docker engine. To
be frank I was not aware about ways to debug your container at runtime. Nor
about how to logging containers. Even not about how should I monitor my
containers and host. This book points few expected production glitches.  I
didn't like the depicted testing workflow by authors. I will look for some other
references which discusses on various strategies to construct your test
workflow. Suggestions are welcome over an email. I was aware about auto-scaling
using various orchestration tools. This book provides step by step guidance of
orchestration tools such as Docker Swarm, Centurion, Amazon EC2 container
service. I am confused why the book is missing Kubernets, Helios here. As a part
of advance topics, this book provides the best introduction to various GNU/Linux
related technologies. Such as strategies for choosing a storage driver
(filesystem), nice comparison of various filesystems with shallow overview of
how Docker engine interacts with them. Which filesystem you should choose if you
are doing the setup of Docker engine at your production system and most
important how will it effect the performance of your container. You should not
skip the overview of container filesystem layers. If someone says Docker engine
follows "copy-on-write" for container layers then you should argue them that it
depends. The Docker engine gives priorities to the filesystem which supports COW
such as aufs, devicemapper, btrfs, overlayfs. If host is not supporting any from
mentioned earlier then it will go with vfs. If your storage driver is using vfs
then it doesn't support COW.  The same chapter is discussing about execution
driver and giving overview of LXC is another container execution driver. The API
of execution driver is dapricated by Docker version 17.0.9 and Docker is only
dependent on libcontainer. You should not invest your time and skip this topic.
I got to aware about how Docker containers are providing the virtualization
layer using Namespaces. Docker limits the execution of container using CGroups
(Control Groups). Such are the GNU/Linux level dependencies used by Docker under
the hood. If you are an API developer (like me) do not skip Chapter 11 which is
the second last chapter of the book. This chapter is discussing two well
followed patterns Twelve Factor App and The Reactive manifesto. These design
guidelines are helpful if you are designing the architecture of your service.
The book concludes with further challenges of using Docker as a container tool.

One typo I found at page number 123, second last line, `expore some of the
tools...`, here 'expore' is typo and it should be `explore some of the
tools...`. I have submitted it to the official errata of the book, but at the
time of writing this post it has not confirmed by the authority. It seems errata
section is not frequently reviewed. Hope someone from the authority will make it
confirm soon.


Who should read this book?

* If you are developer who is unaware with the Docker or who is using Docker but
not aware with the architecture of it then I must advice to read this book.

* If your job is to setup deployment cluster using Docker then this book can
help you to get informed about the Linux host internals. It will be helpful to
get aware about various debugging strategies and security guidelines for
container infrastructure. Good to get aware about how Docker engine is
communicating with your host workstation.

* This book is not a reference book. If you already well aware with Docker, then
I will not advice you to not read this book. In such case, Docker documentation
can be the best reference.

* I am assuming at the time of writing this book, Docker was not supporting
Windows platform. The book purely focus on GNU/Linux architecture and highlight
ways to run Docker over Windows using VM. Boot2Docker for Non-Linux VM-based
servers.

What to keep in mind?

* Docker is changing rapidly. There will be situations where mentioned options
are deprecated. In such situation, you have to browse latest Docker
documentation and try to follow them.

* Understanding Docker documentation becomes easy after reading this book.


Conclusion

* Your GNU/Linux skills are your Docker skills. Once you will understand what
internally Docker is using, it will be easy for you to take decisions.

Printed Copy
* Amazon
* Flipkart
* Website of Book
