---
layout: post
title: "Vim helpfile for plugin goyo.vim"
date: "2017-03-30 12:02:58 +0530"
tags: vim helpfile documentation
---

![Goyo plugin]({{site.url}}/assets/images/goyo_vim_plugin.png)

## Goyo Plugin

[goyo.vim][goyo] is a popular plugin for [vim][vim] editor. This plugin helps
the writers to concentrate on their writing while they are writing.  Recently I
was playing with [goyo.vim][goyo] plugin and found the [vim][vim] helpfile is
missing. The author did a good job of describing API of the plugin at
**README.MD** file, but it is more helpful if the documentation is provided as a
[vim][vim] specific **helpfile**. I have prepared initial [vim][vim] helpfile
for this plugin. I hope it will help the users of this plugins. Below are the
steps for adding helpfile for your goyo.vim plugin.


### Steps for adding goyo.vim helpfile

Find the location of your `.vim` directory. In
[GNU/Linux](https://en.wikipedia.org/wiki/Linux) workstation it is located under
your **home** directory. Create documentation directory under your vim
directory. Below command creates document directory and change your current
directory to `.vim/doc` directory.

  {% highlight shell %}
  mkdir -p ~/.vim/doc && cd ~/.vim/doc
  {% endhighlight %}

Download the goyo.vim helpfile

  {% highlight shell %}
  wget https://git.io/vSGAK -O goyo_help.txt
  {% endhighlight %}

For generating the tag file, Open the [vim][vim] editor and write below command.

  {% highlight vim %}
  :helptags ~/.vim/doc
  {% endhighlight %}

Done! You will be able to get help from your [vim][vim] editor by typing below command.

  {% highlight vim %}
  :help goyo_text.txt
  {% endhighlight %}

### Found improvements?

I am volunteering the task of maintaining helpfile for goyo.vim plugin until it
is provided natively. If you find any improvements, errors I request to drop me
a mail at [jaysinhp@gmail.com](mailto:jaysinhp@gmail.com). I am open for
suggestions. This helpfile is maintained
[here](https://gist.github.com/ultimatecoder/491e6da43f2f796446068d427f6668bc)
as a Github gist.

[goyo]: https://github.com/junegunn/goyo.vim
[vim]: http://www.vim.org
