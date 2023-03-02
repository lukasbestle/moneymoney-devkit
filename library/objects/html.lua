---@meta

---@class HTML
local html = {}

---**Creates an HTML document object**
---
---@param content binary HTML code
---@param charset? string Defaults to the charset from the `<meta>` tags
---@return HTML
function HTML(content, charset) end

---**Queries elements with an XPath expression**
---
---**Note:** The developer tools of web browsers offer convenient tools to author and test XPath expressions.
---
---@param query string Expression in the [XML Path Language Version 1.0](https://www.w3.org/TR/xpath/); all tag and attribute names need to be written in lowercase
---@return Elements elements
function html:xpath(query) end

---**Formats the document as HTML code**
---
---The generated code is *not* always identical to the original code. The generated code is always encoded with UTF-8.
---
---@return string text
function html:html() end
