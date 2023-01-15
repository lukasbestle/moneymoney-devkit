---@meta

---@class Elements
local elements = {}

---**Returns the number of elements inside the list**
---
---@return integer count
function elements:length()
end

---**Returns a specific element**
---
---*Example:*
---```
---if elements:get(2):length() == 1 then print "Fnord!" end
---```
---
---@param n number Number starting at `1`
---@return Elements elements A list with only the queried element or an empty list if the index `n` is invalid
function elements:get(n)
end

---**Performs an action on each HTML element inside the list**
---
---The provided function is called on every element. The provided index starts at `1`.
---If the function returns `false`, further execution of the loop is cancelled.
---
---*Example:*
---```
---elements:each(function (index, element))
---  print (index .. "=" .. element:text())
---end
---```
---
---@param func fun(index: number, element: Elements): boolean?
function elements:each(func)
end

---**Reverses the order of the HTML elements**
---
---@return Elements elements
function elements:reverse()
end

---**Returns the direct children elements**
---
---@return Elements elements
function elements:children()
end

---**Queries elements with an XPath expression**
---
---The elements are queried relative to the first HTML element in the list.
---The XPath expression `query` needs to be relative as well to make that work, i.e. start with a dot.
---
---**Note:** The developer tools of web browsers offer convenient tools to author and test XPath expressions.
---
---@param query string Expression in the [XML Path Language Version 1.0](https://www.w3.org/TR/xpath/) starting with a dot; all tag and attribute names need to be written in lowercase
---@return Elements elements
function elements:xpath(query)
end

---**Returns the combined plain text of all elements inside the list**
---
---@return string text
function elements:text()
end

---**Returns the value of an attribute of the first element inside the list**
---
---@param attribute string Name of the attribute
---@return string text Value of the attribute
---@diagnostic disable-next-line:duplicate-set-field
function elements:attr(attribute)
end

---**Sets an attribute on each element inside the list**
---
---@param attribute string Name of the attribute
---@param value string Value of the attribute
---@diagnostic disable-next-line:duplicate-set-field
function elements:attr(attribute, value)
end

---**Returns the value of a form input**
---
---The first element inside the list needs to be a form input.
---
---In contrast to `elements:attr("value")`, this takes the `disabled` attribute
---and `<select>` inputs into account.
---
---@return string value
function elements:val()
end

---**Selects an option inside a `<select>` input**
---
---The first element inside the list needs to be a `<select>` input.
---
---In contrast to `elements:attr("selected", "selected")`, this takes the
---`disabled` attribute into account and deselects all other options.
---
---@param value string
function elements:select(value)
end

---**Creates options for an HTTP request from an HTML link or form**
---
---The first element inside the list needs to be a link (`<a href>`),
---a submit button (`<input type="submit">` or `<button>`) or an image
---button (`<input type="image">`).
---
---When a link is clicked, the method returns the linked URL. For a form
---it encodes the values of the `<input>` tags. Depending on the defined
---form method, the values are appended as query params to the URL or
---returned as `POST` params.
---
---**Note:** The types and order of return values was chosen so they can be used
---to perform an HTTP request:
---```
---connection:request(elements:click())
---```
---
---@return "GET" | "POST" method HTTP request method
---@return string url
---@return binary? postContent Request body
---@return string? postContentType Value of the request `Content-Type` header
function elements:click()
end

---**Creates options for an HTTP request from a form without submit button**
---
---The first element inside the list needs to be a `<form>`.
---
---The method encodes the values of the `<input>` tags. Depending on the defined
---form method, the values are appended as query params to the URL or
---returned as `POST` params. Values of `<input type="submit">` tags are ignored
---as the form is generated without submit button.
---
---**Note:** The types and order of return values was chosen so they can be used
---to perform an HTTP request:
---```
---connection:request(elements:click())
---```
---
---@return "GET" | "POST" method HTTP request method
---@return string url
---@return binary? postContent Request body
---@return string? postContentType Value of the request `Content-Type` header
function elements:submit()
end
