---@meta

---@class JSON
local json = {}

---**Creates a JSON document**
---
---@param json? binary
---@return JSON
function JSON(json)
end

---**Converts a JSON document to a Lua data structure**
---
---@return table
function json:dictionary()
end

---**Sets a Lua data structure on the document**
---
---@param fields table
---@return JSON
function json:set(fields)
end

---**Renders the data to a JSON document**
---
---@return binary json
function json:json()
end
