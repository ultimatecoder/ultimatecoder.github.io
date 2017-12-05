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

The book provides a nice overview of Docker toolchain. It is not a reference
book.  Even though few options are deprecated, I will advise you to read this
book and then refer to the official documentation to get aware of the latest
development.

Detailed overview

In modern software engineering, terms are coined to the audience with a new
wrapper. Such wrappers are required to earn your bread & butter. They proclaim
that they are solving a problem and because they are solving a problem it is
evident to make money from it. A good marketed term is assumed as best practice.
I am asserting success of term “Open source” even after 18 years. Congratulation
E. Raymond. You won!

I was unsure about the Docker technology. Even I was unfamiliar with the
container technology. Such undiscovered technology was preventing me to get
communicate with others. My certain goal was to get aware of it so that I can
nudge(with understanding) what others are talking. I started reading about
Docker from the official getting started guide. It somehow worked, but one
strong indication I realized when I was trying to deploy my blog using Docker. I
found I was still unclear about the internals. I noticed the tutorial I am
reading is only discussing exposed API of the tool which I found very shallow in
comparison to the technology. My inert was telling am I not sure what I am
doing. Such quest lead me to find a better resource which introduces this tool
in another way. With some Quora posts and some Goodreads reviews, I decided to
learn by reading “Docker Up & Running by K. Matthias & S. Kane”. I consider
books written on any tool are likely to be outdated soon. Similar has happened
with this book. After reading a table of content, I concluded to purchase it
because it contains topics based on fundamentals. I got printed copy at nearly
450 INR (which is near to 7 USD, where 1 USD = 65 INR) from Amazon.in which is
fairly appropriate with respect to the print quality.

The book begins with a little history of the container (Docker is an
implementation of the container). Initial chapters are discussing higher level
overview of Docker tool combining Docker engine, Docker image, Docker registry,
Docker compose and Docker container. Authors had discussed where Docker
technology should not be implemented can result in a bad practice. I must insist
to not skip that topic. I skipped the dedicated chapter on installing Docker to
your distribution. I got to aware of few other methods to distribute Docker
images rather than the repository. You should not skip the chapter which is
discussing the behavior of the container. That chapter cleared many confusions
of mine. I must insist to not skip that chapter and try to re-read if you are
lost in between.  Such chapters are enough for getting an overview of Docker
containers and image.  Next chapters are focused more on best practices to setup
the Docker engine. To be frank I was not aware of ways to debug your container
at runtime. Nor about how to logging containers. Even not about how should I
monitor my containers and host. This book points few expected production
glitches. I didn't like the depicted testing workflow by authors. I will look
for some other references which discuss various strategies to construct your
test workflow. Suggestions are welcome to an email. I was aware of auto-scaling
using various orchestration tools. This book provides step by step guidance on
orchestration tools such as Docker Swarm, Centurion, Amazon EC2 container
service. I am confused why the book is missing Kubernets, Helios here. As a part
of advanced topics, this book provides the best introduction to various
GNU/Linux related technologies. Such as strategies for choosing a storage driver
(filesystem), nice comparison of various filesystems with a shallow overview of
how Docker engine interacts with them. Which filesystem you should choose if you
are doing the setup of Docker engine in your production system and most
importantly how will it affect the performance of your container. You should not
skip the overview of container filesystem layers. If someone says Docker engine
follows Copy-On-Write for container layers then you should argue them that it
depends. The Docker engine gives priorities to the filesystem which supports COW
such as aufs, devicemapper, btrfs, overlayfs. Docker engine will go using vfs as
the last option. You should make a note that vfs doesn't support the COW. The
same chapter is discussing the execution driver and giving an overview of LXC
which is another container technology. The API of execution driver is deprecated
by Docker version 17.0.9 and Docker is only dependent on libcontainer. You
should not invest your time and skip this topic.  I got to aware about how
Docker containers are providing the virtualization layer using Namespaces.
Docker limits the execution of container using CGroups (Control Groups).
Namespaces and CGroups are GNU/Linux level dependencies used by Docker under the
hood. If you are an API developer, then you should not skip Chapter 11. This
chapter is discussing two well-followed patterns Twelve-Factor App and The
Reactive manifesto. These design guidelines are helpful if you are designing the
architecture of your service.  The book concludes with further challenges of
using Docker as a container tool.

One typo I found at page number 123, second last line, 'expore some of the
tools...', here 'expore' is typo and it should be 'explore some of the
tools...'. I have submitted it to the official errata of the book, but at the
time of writing this post it has not confirmed by the authority. It seems errata
section is not frequently reviewed. Hope someone from the authority will make it
confirm soon.


Who should read this book?

* If you are developer who is unaware with the Docker or who is using Docker but
  not aware with the architecture of it then I must advise to read this book.

* If your job is to setup deployment cluster using Docker then this book can
  help you to get informed about the Linux host internals. It will be helpful to
  get aware about various debugging strategies and security guidelines for
  container infrastructure. Good to get aware about how Docker engine is
  communicating with your host workstation.

* This book is not a reference book. If you already well aware with Docker, then
  I will not advise you to not read this book. In such case, Docker
  documentation can be the best reference.

* I am assuming at the time of writing this book, Docker was not supporting
  Windows platform. The book purely focus on GNU/Linux architecture and
  highlight ways to run Docker over Windows using VM. Boot2Docker for Non-Linux
  VM-based servers.

What to keep in mind?

* Docker is changing rapidly. There will be situations where mentioned options
  are deprecated. In such situation, you have to browse the latest Docker
  documentation and try to follow them.

* Understanding Docker documentation becomes easy after reading this book.

Conclusion

* Your GNU/Linux skills are your Docker skills. Once you will understand what
  internally Docker is using, it will be easy for you to make decisions.

Printed Copy

* Amazon
* Flipkart
* Website of Book
