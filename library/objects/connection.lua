---@meta

---@class Connection
local connection = {}

---**Creates an HTTPS connection to a web server**
---
---@return Connection
function Connection()
end

---**Requests a resource from a web server**
---
---If no HTTPS connection to that server exists, a connection is established.
---HTTP pipelining is supported as long as the server URL is not changed in subsequent requests.
---
---For JSON-based REST APIs please set the `Accept` header to `"application/json"` in the `headers` argument.
---In this mode, MoneyMoney will also pass HTTP error responses to the script. Otherwise the script execution
---will be stopped in case of a HTTP error status code and the error will be displayed in the UI.
---
---*Example:*
---```
---content, charset, mimeType = connection:request("POST",
---                                                "https://moneymoney-app.com/onlinebanking",
---                                                "username=foo&password=bar",
---                                                "application/x-www-form-urlencoded; charset=UTF-8")
---print(content)   -- "<html>\n<head>\n<title>[…]"
---print(charset)   -- "UTF-8"
---print(mimeType)  -- "text/html"
---```
---
---**Note:** The types and order of return values was chosen to be compatible with the `HTML()` constructor:
---```
---html = HTML(connection:request("GET", "https://moneymoney-app.com/onlinebanking"))
---```
---
---@param method "GET" | "POST" | "PUT" | "PATCH" | "DELETE" HTTP request method
---@param url string Absolute or relative URL (if a previous request used an absolute URL)
---@param postContent binary? Request body
---@param postContentType string? Value of the request `Content-Type` header
---@param headers table<string, string>? Additional HTTP request headers
---@return binary content Response body
---@return string charset Charset of the body (from headers and `<meta>` tags in the HTML code)
---@return string mimeType MIME type of the body (from headers and `<meta>` tags in the HTML code)
---@return string filename Filename from the HTTP response header `Content-Disposition`
---@return table<string, string> headers HTTP response headers
function connection:request(method, url, postContent, postContentType, headers)
end

---**Requests a resource from a web server with a `GET` request**
---
---@see connection.request
---@param url string Absolute or relative URL (if a previous request used an absolute URL)
---@return binary content Response body
---@return string charset Charset of the body (from headers and `<meta>` tags in the HTML code)
---@return string mimeType MIME type of the body (from headers and `<meta>` tags in the HTML code)
function connection:get(url)
end

---**Requests a resource from a web server with a `POST` request**
---
---@see connection.request
---@param url string Absolute or relative URL (if a previous request used an absolute URL)
---@param postContent binary? Request body
---@param postContentType string? Value of the request `Content-Type` header
---@return binary content Response body
---@return string charset Charset of the body (from headers and `<meta>` tags in the HTML code)
---@return string mimeType MIME type of the body (from headers and `<meta>` tags in the HTML code)
function connection:post(url, postContent, postContentType)
end

---**Closes the HTTP connection to the server**
---
---It is generally not required to call this method because all
---open connections are automatically closed after the script execution.
function connection:close()
end

---**Returns the last requested URL**
---
---@return string url
function connection:getBaseURL()
end

---**Sets a cookie in the current connection**
---
---Every script keeps a storage of HTTP cookies for the duration of its execution.
---This storage is shared by all connections that are opened in the same script.
---Cookies are automatically extracted from the HTTP respoonse headers and from HTML
---`<meta>` tags. All cookies are deleted after the execution of the script.
---
---This method allows to store additional cookies or override existing ones.
---
---*Example:*
---```
---connection:setCookie("SESSION=foobar; path=/")
---```
---
---@param cookie string Formatted like the `Set-Cookie` HTTP header
function connection:setCookie(cookie)
end

---**Gets all cookies from the current connection**
---
---The stored cookies are filtered by the last requested URL.
---
---@return string cookies Formatted like the `Cookies` HTTP header
function connection:getCookies()
end

---**Value of the `User-Agent` HTTP header**
---
---The value can be overridden to simulate a specific browser or mobile device
---to the server.
---
---*Example:*
---```
---connection.useragent = "Mozilla/5.0 (compatible; " .. MM.productName .. "/" .. MM.productVersion .. ")"
---```
---
---@type string
connection.useragent = nil;

---**Value of the `Accept-Language` HTTP header**
---
---On some servers, this allows to select the content language.
---If not set, it defaults to the operating system language.
---
---*Example:*
---```
---connection.language = "de-de"
---```
---
---@type string
connection.language = nil;
