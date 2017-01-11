---
layout: post
categories: python express
title: 2016 A year dedicated to Python Workshops
tag: pythonexpress
---

Beautiful 2017 has already started. While everybody is busy with preparing 
resolutions for their new year I decided to look back and share my journey
here.

During my last year I conducted 13 workshops at various colleges of
state Gujarat and Rajasthan. 10 workshops were conducted targeting college
students and 3 were presented for professionals. Gandhinagar and Ahmedabad
received 4 number of workshops individually. Did single workshop at Bhuj,
Ajmer, Vadodara and New delhi. One over Google Hangouts on Air.


Graph
------

<link rel="stylesheet" type="text/css" href="{{site.url}}/assets/css/nv.d3.min.css">

<style>
    #chart svg {
      height: 400px;
    }

    svg: {
      display: block;
    }

    svg text {
      font: normal 8px Impact;
    }
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.2/d3.min.js" charset="utf-8"></script>

<script src="{{ site.url }}/assets/js/nv.d3.min.js"></script>

<script>

function GetData() {
  return  [
    {
      "label": "Introduction to Django",
      "value" : 1
    },
    {
      "label": "My name is Python and I am not terrorist",
      "value" : 1
    },
    {
      "label": "Beginning with Python",
      "value" : 2
    },
    {
      "label": "Let's learn Python",
      "value" : 5
    },
    {
      "label": "Token based authentication system using JWT",
      "value" : 4
    },
  ];
}

nv.addGraph(function() {
  var chart = nv.models.pieChart()
      .x(function(d) { return d.label })
      .y(function(d) { return d.value })
      .showLabels(true)
      .labelType("value");

  d3.select("#chart svg")
      .datum(GetData())
      .transition().duration(350)
      .call(chart);

  return chart;
});

</script>

<div id="chart">
  <svg></svg>
</div>


Photos
-----------------
Below is the list of colleges with a selfie with students:

![PG GTU Gandhinagar]({{site.url}}/assets/images/pg_gtu.jpg)

* At [PG GTU Gandhinagar](http://pgschool.gtu.ac.in/moodle/)

* [K.S.K.V. Kachchh University](http://cs.kutchuni.edu.in/)

![kskv_kachchh_university]({{site.url}}/assets/images/kskvku_photo.jpg)

* [Gujarat Polytechnic College, Gandhinagar](http://www.gpgandhinagar.edu.in/)

![Polytechnic Gandhinagar]({{site.url}}/assets/images/polytechnic_gandhinagar.jpg)

* [Parul University, Waghodia, Vadodara](http://paruluniversity.ac.in/home/)

![Parul University]({{site.url}}/assets/images/parul_university.jpg)

* [Nirma Technology University, Ahmedabad](http://www.nirmauni.ac.in/)

![Nirma University]({{site.url}}/assets/images/nirma_university.jpg)

* [Startup Gujarat, Gandhinagar](http://the1947.com/)

![Startup Gujarat]({{site.url}}/assets/images/startup_gujarat.jpg)

* [Ahmedabad Web and Mobile developers meetup](https://www.meetup.com/Ahmedabad-Web-and-Mobile-Developers-Meetup/events/232699917/)

![Ahmedabad Meetup]({{site.url}}/assets/images/ahmedabad_meetup.jpg)

* [Dhirubhai Ambani Institute of Information and Communication Technology
Gandhinagar](http://www.daiict.ac.in/)

![DAIICT]({{site.url}}/assets/images/daiict.jpg)

* [Government Women Engineering College Ajmer](http://www.gweca.ac.in/web/)

![Engineering college Ajmer]({{site.url}}/assets/images/engineering_college_ajmer.jpg)

* [AEG Ahmedabad]()

![AEG Ahmedabad]({{site.url}}/assets/images/aeg_ahmedabad.jpg)

* [PyCon India, New Delhi][pycon_india_2016]

![Pycon India]({{site.url}}/assets/images/pycon_india.jpg)

* [Mozilla Maker Party Ahmedabad](https://reps.mozilla.org/e/maker-party-gujarat/)

![Macker Party]({{site.url}}/assets/images/macker_party.jpg)


Facilities I received while conducting workshops
------------------------------------------------

The colleges which were settled far from my town provided a travelling allowance
for me. Which I accepted because I felt there is nothing wrong in taking such
help. Some colleges arranged an afternoon meal for me. I happily accepted that
because finding another option during short breaks at unknown place is quite
time consuming. There were few colleges which gave cash covers as a good will.
That I never decided to accept in my lifespan.  The reason I don’t accept
money from any educational institute is they sometimes charge students for
raising that money.  I don’t feel good to take money from the pocket of any
student. Still some college claimed that the money belongs to their grants and
not raised from students. I took that money at that time and donated each to
[Krishna Vrudhashram](http://www.krishnavriddhashram.org/) located at
Gandhinagar, Gujarat.


Python Express
--------------

Such contributions would have not possible without Python Express. Python
Express is a platform to collaborate colleges, students with Python tutors
across India. It is supervised and funded by the [Python Software Society of
India](https://pssi.org.in/).


### Python Express Ahmedabad

At present, we have a Python Express Ahmedabad group whose motive is to teach
Python to nearby colleges. We are linked up with
[Telegram Messenger](https://telegram.org/). During this PyCon, I got a large
bunch of Python Express stickers from Vijay sir. The stickers will be a lot to
motivate pupils. We also received Python Express volunteer T-shirts. If you are
living nearby Ahmedabad and want to contribute to this movement, please touch
me over email.


**"Teaching is the best way to learn."**
----------------------------------------

I am inspired from curious questions raised by scholars. They forced me to
plunge deep into the subject. It was little difficult to afford such a huge
hours with having a full time job, but after observing my personal
improvements I consider this as a good investment.

In summary, I took 1 workshop every month during the year 2016 which is nearly
90% more than what I did in the year 2015.

You can download [Slides here](https://goo.gl/vTBhTh) and
[Python Kit here](https://drive.google.com/file/d/0B_TmiicGbqjHb2ZGcE5QYmtXRHc/view?usp=sharing).


### Do you want to invite me for your college?

First step is to take briefing your college administration with Python Express
to get the permission. Once they agree register your college at
[Python Express][python_express] and create the workshop request that’s it!

I will advice to schedule workshop on weekends. Saturday is usually the best
day for me. Facilities like Projector, Microphone and speakers if number of
attendees are more than 60. College Computer Labs, the auditorium is the best
place for such events.

[python_express]: https://pythonexpress.in/
[pycon_india_2016]: http://www.ciie.co/
[pydelhi_conf]: https://conference.pydelhi.org/
