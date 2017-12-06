---
layout: post
title: "Book review 'Docker Up & Running'"
date: "2017-12-05 11:26:32 +0530"
tags:
  - books
  - docker
  - linux
---

In the modern era of software engineering, terms are coined with a new wrapper.
Such wrappers are required to make bread-and-butter out of it. Sometimes good
marketed terms are adopted as best practices. I was having lot of confusions
about this Docker technology. Even I was unfamiliar with the concept of
containers. My certain goal was to get a higher level overview first and then
come to a conclusion. I started reading about the Docker from its official
getting started guide. That guide helped me to deploy this blog using Docker,
but rather than solving initial it created few more questions. I decided to look
for a better resource. By observing some Quora posts and Goodreads reviews, I
decided to read “Docker Up & Running by K. Matthias & S. Kane”. I am sharing my
reading experience here.

TL;DR

The book provides a nice overview of Docker toolchain. It is not a reference
book. Even though few options are deprecated, I will advise you to read this
book and then refer to the official documentation to get aware with the latest
development.


Detailed overview

I got a printed copy at nearly 450 INR (roughly rounding to 7 USD, where 1 USD =
65 INR) from Amazon. That prize is fairly acceptable with respect to the print
quality. The book begins with a little history of the container (Docker is an
implementation of the container). Initial chapters gives a higher level overview
of Docker tools combining Docker engine, Docker image, Docker registry, Docker
compose and Docker container. Authors had indicated software patterns where
Docker is not suitable. I insist you do not skip that topic. I skipped the
dedicated chapter on installing Docker. I will advise you to skip irrelevant
topics because the chapters are not interlinked. You must have to read chapter 5
discussing the behavior of the container. That chapter cleared many of my
confusions. Somehow I lost in between, but re-reading helped. Such chapters are
enough for getting an overview of Docker containers and image. Next chapters are
focused more on best practices to setup the Docker engine. To be frank I was not
aware of ways to debug the container at runtime. Nor about strategies for
logging it. Even not on monitoring containers and a host machine. This book
points few expected production glitches that you should keep in mind. I didn't
like the depicted testing workflow by authors. I will look for some other
references which highlight more strategies to construct your test workflow. If
you are aware of any please share them with me via e-mail. I know about
achieving auto-scaling using various orchestration tools. This book provides
step by step guidance on configuring and using them. Mentioned tools are Docker
Swarm, Centurion and Amazon EC2 container service. I am confused why the book is
missing Kubernets and Helios here. As a part of advanced topics, you will find a
comparison of various filesystems with a shallow overview of how Docker engine
interacts with them. The same chapter is discussing available execution drivers
and introduces LXC as another container technology. This API option is
deprecated by Docker version 17.0.9 which makes libcontainer as the only
dependency. I got to aware of how Docker containers are providing the
virtualization layer using Namespaces. Docker limits the execution of container
using CGroups (Control Groups). Namespaces and CGroups are GNU/Linux level
dependencies used by Docker under the hood. If you are an API developer, then
you should not skip Chapter 11. This chapter is discussing two well-followed
patterns Twelve-Factor App and The Reactive manifesto. These guidelines are
helpful while designing the architecture of your services. The book concludes
with further challenges of using Docker as a container tool.

One typo I found at page number 123, second last line, 'expore some of the
tools...', here 'expore' is a typo and it should be 'explore some of the
tools...'. I have submitted it to the official errata. At the time of writing
this post it has not confirmed by the authority. It seems errata requests are
not frequently reviewed. Hope responsible will confirm it soon.


Who should read this book?

* If you are developer who is unaware of the Docker or who is using Docker but
  not aware of the architecture of it then I must advise to read this book.

* If your job is to setup deployment cluster using Docker then this book can
  help you to get informed about the Linux host internals. It will be helpful to
  get aware of various debugging strategies and security guidelines for
  container infrastructure. Good to get aware of how Docker engine is
  communicating with your host workstation.

* This book is not a reference book. If you already well aware of Docker, then I
  will not advise you to not read this book. In such case, Docker documentation
  can be the best reference.

* I am assuming this book written, Docker was not supporting Windows platform
  natively. The book purely focuses on GNU/Linux platform and highlight ways.
  It highlights ways to run Docker over Windows using VM and Boot2Docker for
  Non-Linux VM-based servers.


What to keep in mind?

* Docker is changing rapidly. There will be situations where mentioned options
  are deprecated. In such situation, you have to browse the latest Docker
  documentation and try to follow them.

* You will be able to understand the official documentation better after reading
  this book.


Conclusion

* Your GNU/Linux skills are your Docker skills. Once you will understand what
  internally Docker is using, your decisions will become more mature.


Printed Copy

* Amazon
* Flipkart
* Website of Book
