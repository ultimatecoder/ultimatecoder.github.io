---
layout: post
title: "JS-Recon is no more!"
date: "2019-04-23 17:47:21 +0530"
tag:
  - security
  - attack
  - vulnerability
  - javascript
  - jsrecon
---

In 2010, Andlabs discovered an attack to fingerprint open TCP ports at client
workstation. You can read [this blog post][andlabs_blogpost] which is describing
details of this method. JS-Recon was a tool implementing this attack on its
client to prove the danger of this vulnerability. Unfortunately, JS-Recon is not
available on mentioned link for unknown reasons. I tried my best to find the
source code of that tool, but I was ended with no results. Because the source
code of the tool is not available, the only way to confirm the possibility of
this attack was to reconstruct it from steps mentioned at that blog post.

In this post I will share my experience of rebuilding this attack. Because this
attack is from the front-end side, knowledge of basic Javascript API is
expected from the reader. The original blog post does not include any code
samples. For the easiness of the reader, I have prepared small code snippets
and attached them with related sections. I expect you run code samples at the
developer console of your browser.

### Glossary

* **Empty / Available port**: A port where no service is running.
* **Non-empty / Occupied port**: A port where some service is running.
* **XHR**: A short form of [XML Http Request][mdn_xhr].
* **Socket**: A TCP/IP raw socket.

According to that blog post, If I write a Javascript code to open a XHR to
`http://localhost:8084` and host that code at example.com then when you visit
the example.com the browser will open that XHR to port `8084` of your
workstation, because the localhost for your browser is your workstation. This
gap invites many vulnerabilities for users. One of them is the possibility to
fingerprint open TCP ports at client workstation.

The author claims that the browser takes recognizably more time to open a XHR
targeting an occupied port. Comparatively, time took to open a XHR aimed at an
empty port was short.

```javascript
//Sample code to measure the time browser took to open the socket.

var requestPort = function(port) {
  var startTime = null;
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 1) {
      var timeTook = Date.now() - startTime;
      console.log("Browser took : " + timeTook + " microseconds to open.");
    }
  };
  startTime = Date.now();
  url = "http://localhost:" + port;
  xhr.open("GET", url, true);
};
```

You can paste this code at a developer console of your browser. Calling this
function by writing `requestPort(8084)` at a console will open the XHR for port
`8084`. The function will print the time browser took to open a socket on that
port. I request you to call this function with a combination of empty and
non-empty ports to find response timings.

I tried opening a bunch of requests using `requestPort()` function at suspected
ports. For me the method was giving unidentifiable pattern in the time browser
took to open a socket. Below is a histogram of comparing time took to open a
socket on empty port(8084) and non-empty port(27017).

![Graph showing response time to open socket.]({{site.url}}/assets/images/js_recon_is_no_more/graph_response_time_open_socket.png)


Above is a graph of 6000 requests done to measure the response time using a
function I shared earlier. More than 5000 requests has ended in nearly no time.
There were less than 1000 requests which ended in 1 microseconds. From the
above results, We can conclude that mentioned method is not giving different
results for occupied and empty port. We can conclude that mentioned method by
AndLabs is failing to distinguish an occupied port from a non occupied port.

I tried hard to find any possible cause for the failure of this attack. I didn't
found any conclusive evidences. May be our hardware or browser code has improved
for opening a TCP sockets quicker than what it used to. I will not lie, but that
abstract blog post by the AndLabs took sometime to understand the anatomy of
this attack. I wasn't happy with going back from this point. Just for my
satisfaction, I tried every possible combinations of `xhr.readyState` values to
find any pattern. From my observation, I recognized that timing for returning a
header from an occupied port was delayed. Comparatively, this response was quick
for ports where no service was running. I am comparing the time browser took to
return a response headers whereas in the previous method it was dependent on the
time browser took for opening a socket.

```javascript
var requestPort = function(port) {
  var startTime = null;
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 2) {
      var timeTook = Date.now() - startTime;
      console.log("Browser took : " + timeTook + " microseconds to send response headers.");
    }
  };
  startTime = Date.now();
  url = "http://localhost:" + port;
  xhr.open("GET", url, true);
  xhr.send(null);
};
```

Above code will measure the time browser took to receive headers from the
destination. You should call this function requestPort() with a few
combinations of empty and non-empty ports.

![Graph showing header response time.]({{site.url}}/assets/images/js_recon_is_no_more/graph_header_response_time.png)

This graph is representing header response time of 6000 requests fired at both
active (27017) and inactive port (8084). The response time of inactive port not
go beyond 200 microseconds. Comparing this with a header response time of
occupied ports, we can see that response time of non-empty port is recognizably
higher than empty port.

Browser is the most common tool used by us. Asserting this vulnerability
requires knowledge of Javascript and everyone is not a developer. As I mentioned
earlier, I failed to find the source code of JS-Recon (the tool written by
AndLabs proving possibility of this attack). For those reasons, I decided to
write a tool pioneered on my improvements on an attempt of Andlabs.  Today, I
have successfully completed that tool. I have decided to name it
["Chatur"][chatur_pronounciation]. Chatur means intelligent person in Hindi.
Please find the source code of Chatur [on Github][chatur_github]. Chatur is a
free software. Try this tool and share your thoughts with me. This is not a
bulletproofed idea, but it works most of the time you will try.

[andlabs_blogpost]: http://blog.andlabs.org/2010/12/port-scanning-with-html5-and-js-recon.html
[mdn_xhr]: https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
[chatur_pronounciation]: https://youtu.be/Tih_dP_Tv2w
[chatur_github]: https://github.com/ultimatecoder/chatur
