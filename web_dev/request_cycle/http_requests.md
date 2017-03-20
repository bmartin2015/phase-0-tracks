# Week 9.1 How the Web Works

## Release 0: View HTTP Requests

1. What are some HTTP status codes?
    * A. 200 - Ok; 403 - Forbidden; 404 - Not found; 500 - Internal Server Error

2. What is the difference between a GET request and a POST request? When might each be used?
    * A. GET is used anytime a request is being made via the URL. It passes along data from the URL in name/value pairs appended to the URL. A POST method passes along data from the browser in the body of the request, also as name/value pairs, not in the URL. While researching when to use GET vs. POST, there seems to be a lot of conflicting opinions. The best explanation I found was that GET should be used on 'safe' requests (requests that does not change the data) or cases when the results will be the same no matter what (such as Long/Lat coordinates on a map). This is because GET requests can be repeated over since they can be cached and the URL book marked. A POST request should be used for 'destructive' requests that create, change, or delete data, and when the results to the call may be different each item. I also saw some people talking about the security of POST vs GET requests, but ultimately, both can be seen when viewing the network information in Chrome. 

3. Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
    * A. Cookies are sent from the server to the browser to store various bits of information in a reliable way that the server can use. These can be items in a shopping cart, names, and authentication. They can also be used to track behavior across the the web. Cookies can be sent as part of the HTTP response from the server and the name/value pair information can be sent back to the server from the browser in the HTTP request. In the CNN.com example, CNN sets cookies that apply a localization (US), and geo code data (city, state, zip, etc) in the Response and my browser passes back that info (and a lot more) in the request.
