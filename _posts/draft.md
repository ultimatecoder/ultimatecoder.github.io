tldr;

scanner tries to identify open ports
tool is based on possible venerability to fingerprint open TCP ports at client
workstation using Javascript. I will explain my motivation for writing this
tool.


Background

Recently, I came across a possibility to fingerprint open TCP ports via browser
based Javascript attack. This attack was discovered by AndLabs and briefly
introduced at
[this](http://blog.andlabs.org/2010/12/port-scanning-with-html5-and-js-recon.html)
blog post.

CORS a half way protection

Ajax request to cross domain are prevented by a browser to avoid CORS attacks.
If you are not aware what CORS is, then I suggest you to read [this][cors_guide]
post before progressing further.

What happens when you do an ajax request to "https://localhost:8084"?

If any service is running on port *8084* at your computer, then a browser will
forward your request to that service. When that service returns any response,
the browser checks for the CORS headers in the response. Responses without
appropriate CORS headers are dropped by the browser. From the client side, there
is no way to identify a reason for failed request. You can't identify that the
request failed because of CORS error or 404 until you track it in debug console
of your browser.

The error response from the browser for XHR on ports where any service is
running is late than ports where no services are running. The delay in coming
response exposes this variability to finger print open TCP ports at client
workstation.


My motivation for writing this tool

Now a days, browser is the most commonly used tool. Everyone is not a developer
who can write Javascript to assert the possibility of this venerability. Despite
trying hard, I failed to find the source code of JS-Recon. I am writing this
tool so that anyone irrespective with their background can try and believe the
possibility of this venerability.


This venerability attracted me to try it out via their implementation done at
JS-Recon tool. When I clicked at the mentioned link, I found the domain has
expired.  I tried finding the source code of that tool, but ended with no
results. I fired some XML HTTP Requests (XHR) to localhost at my Developer
console and I was clearly seeing the pattern identified by the author.  


he mentioned method by the author. For confirming his
hypothesis I wanted to try this vulnerability. Unfortunately, mentioned tool
isn't available at this moment. I tried best to find the source of that tool,
but I ended with no results.


seemed expired to me. That blog
post describes a possible way to fingerprint open TCP ports at clinet
workstation. The author claims that Ajax request to ports which are open at
clinet worksation are delayed  were delayed than empty ports. 


Firefox browser allows XML HTTP Requests (XHR) for localhost which allows is
proposed by [here]() While reading that post I found their tool "JS-Recon"
implementing this attack is not available.

[cors_guide]: https://add-cors-guide.com
