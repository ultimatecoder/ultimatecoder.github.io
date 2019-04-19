tldr;

Chatur is a Javascript based port scanning tool. This tool proves the
possibility of fingerprinting open TCP ports at client workstation using pure
Javascript.

Background

Recently, I came across a possibility to fingerprint open TCP ports at client
workstation using browser side (aka client side) Javascript. This attack is
discovered by AndLabs in the year 2010. In this section, I will explain the
anatomy of this venerability in simple way. I expect you are able to understand
the basics of XML HTTP Request.


What happens when you fire an XHR?

Browser initiates a TCP socket at the destination URL and sends header and body
of the request. Once header and body is sent, browser terminates the active
socket and waits for the server to deliver a response. That is how HTTP works
under the hood.


If I write a Javascript code to put a XHR to 'http://localhost:8084' and host
that code at 'xyz.com' then when you visit the 'xyz.com' the browser will fire
that XHR to port '8084' of your workstation because 'localhost' for your
browser is your workstation. This gap invites many vulnerabilities for user.
One of them is the possibility to fingerprint open TCP ports at client
workstation.

While observing the timing browser took to receive headers from the server were
highlighting a clear pattern. Responses





Browser opens a socket to the destination URL, sends header and then sends body
of the request to the server and terminates the socket. That's how HTTP is
designed. In our example, browser will open a TCP client socket to
'http://localhost:8084' and sends header and body and terminates the socket.





Using `XMLHTTPRequest.onstatechange` listener, we can identify


If you want to fingerprint that any dedicated port at client workstation is
open or closed, you just fire XHR to that port.





If bunch of XHR on different ports of localhost and capture the time browser
took to open the socket then you can obser that response timing The browser(and
operating system) takes bit longer time to open a socket on a non-empty port.

That request will touch the workstation of whoever is browsing my website. This
is possible because browser do not block XHR to 'localhost'. Using this gap I
and founder of this vunerability has observed one common pattern in response
timings. Requests to non empty ports were returning late than ports where no
service was running. Using this clue, if response on such port is delayed we
can claim that there is an active service on such port.

I will suggested reading
[this](http://blog.andlabs.org/2010/12/port-scanning-with-html5-and-js-recon.html)
blog post published by the AndLabs briefly describing this venerability at more
detail level.

If I do an XML HTTP request to a random port of localhost, response timing of
empty ports is faster than the response of ports where any service is running.

If you do a XML HTTP Requests to cross domain, browser will expect an
appropriate CORS headers in response. Requests which aren't returning a
response with appropriate CORS headers are failed by the browser.

Which means, anyone

CORS a half way protection

Ajax request to cross domain are prevented by a browser to avoid CORS attacks.
If you are not aware what CORS is, then I suggest you to read
[this][cors_guide] post before progressing further.

What happens when you do an ajax request to "https://localhost:8084"?

If any service is running on port *8084* at your computer, then a browser will
forward your request to that service. When that service returns any response,
the browser checks for the CORS headers in the response. Responses without
appropriate CORS headers are dropped by the browser. From the client side,
there is no way to identify a reason for failed request. You can't identify
that the request failed because of CORS error or 404 until you track it in
debug console of your browser.

The error response from the browser for XHR on ports where any service is
running is later than ports where no services are running. The delay in coming
response exposes this variability to finger print open TCP ports at client
workstation.

My motivation for writing this tool

Browser is the most common tool used by us. Asserting this venerability
requires knowledge of Javascript and everyone is not a developer. Despite
trying hard, I failed to find the source code of JS-Recon (the tool written by
AndLabs proving possibility of this attack). I am sharing this tool so that you
or anyone else irrespective of your technical backgrounds can try this tool to
verify the possibility of this attack.

[cors_guide]: https://add-cors-guide.com
