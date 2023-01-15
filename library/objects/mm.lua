---@meta

---@class MM
MM = {}

---**MoneyMoney user interface language**
---
---@type "en" | "de"
MM.language = nil;

---**MoneyMoney product name**
---
---@type string
MM.productName = nil;

---**MoneyMoney version**
---
---@type string
MM.productVersion = nil;

---**Translates a text string that is built-in to MoneyMoney**
---
---This method is primarily suited for extensions that are shipped
---together with MoneyMoney. It's a wrapper for the Cocoa function
---`NSLocalizedString` and only returns a translation if the text
---was defined in the MoneyMoney localization table.
---
---@param str string English text
---@return string str Localized text
function MM.localizeText(str)
end

---**Localizes a date and time value**
---
---Because the Lua POSIX locales are not available inside macOS apps,
---this method is a wrapper for the Cocoa function `NSDateFormatter`.
---
---@param format string Output format according to [Unicode Technical Standard #35](https://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns)
---@param date integer POSIX timestamp
---@return string str Localized date
---@diagnostic disable-next-line:duplicate-set-field
function MM.localizeDate(format, date)
end

---**Localizes a date and time value**
---
---Because the Lua POSIX locales are not available inside macOS apps,
---this method is a wrapper for the Cocoa function `NSDateFormatter`.
---
---@param date integer POSIX timestamp
---@return string str Localized date
---@diagnostic disable-next-line:duplicate-set-field
function MM.localizeDate(date)
end

---**Localizes a number**
---
---Because the Lua POSIX locales are not available inside macOS apps,
---this method is a wrapper for the Cocoa function `NSNumberFormatter`.
---
---@param format string Output format according to [Unicode Technical Standard #35](https://unicode.org/reports/tr35/tr35-6.html#Number_Format_Patterns)
---@param num number
---@return string str Localized number
---@diagnostic disable-next-line:duplicate-set-field
function MM.localizeNumber(format, num)
end

---**Localizes a number**
---
---Because the Lua POSIX locales are not available inside macOS apps,
---this method is a wrapper for the Cocoa function `NSNumberFormatter`.
---
---@param num number
---@return string str Localized number
---@diagnostic disable-next-line:duplicate-set-field
function MM.localizeNumber(num)
end

---**Localizes a currency amount**
---
---@param format string Output format according to [Unicode Technical Standard #35](https://unicode.org/reports/tr35/tr35-6.html#Number_Format_Patterns)
---@param amount number
---@param currency? string Without currency, only the amount without currency is returned
---@return string str Localized amount
---@diagnostic disable-next-line:duplicate-set-field
function MM.localizeAmount(format, amount, currency)
end

---**Localizes a currency amount**
---
---@param amount number
---@param currency? string Without currency, only the amount without currency is returned
---@return string str Localized amount
---@diagnostic disable-next-line:duplicate-set-field
function MM.localizeAmount(amount, currency)
end

---**Applies a URL encoding**
---
---@param str string
---@param charset? string Charset according to the [IANA list](https://www.iana.org/assignments/character-sets); defaults to `ISO-8859-1`
---@return string urlencoded
function MM.urlencode(str, charset)
end

---**Removes the URL encoding**
---
---@param urlencoded string
---@return string str
function MM.urldecode(urlencoded)
end

---**Converts a string from UTF-8 to another charset**
---
---@param charset string Target charset according to the [IANA list](https://www.iana.org/assignments/character-sets)
---@param str string Text in UTF-8
---@param bom? boolean If set to `true`, a byte order mark (BOM) is added if it exists for the target charset
---@return binary data
function MM.toEncoding(charset, str, bom)
end

---**Converts a string from another charset to UTF-8**
---
---@param charset string Source charset according to the [IANA list](https://www.iana.org/assignments/character-sets)
---@param data binary
---@return string str Text in UTF-8
function MM.fromEncoding(charset, data)
end

---**Converts data to Base64**
---
---@param data binary
---@return string encoded
function MM.base64(data)
end

---**Converts data from Base64**
---
---@param encoded string
---@return binary data
function MM.base64decode(encoded)
end

---**Calculates an SHA512 hash**
---
---@param data binary
---@return string digest
function MM.sha512(data)
end

---**Calculates an SHA256 hash**
---
---@param data binary
---@return string digest
function MM.sha256(data)
end

---**Calculates an SHA1 hash**
---
---@param data binary
---@return string digest
function MM.sha1(data)
end

---**Calculates an MD5 hash**
---
---@param data binary
---@return string digest
function MM.md5(data)
end

---**Calculates an HMAC512 message authentication code**
---
---@param key binary
---@param data binary
---@return binary digest Binary MAC string
function MM.hmac512(key, data)
end

---**Calculates an HMAC384 message authentication code**
---
---@param key binary
---@param data binary
---@return binary digest Binary MAC string
function MM.hmac384(key, data)
end

---**Calculates an HMAC256 message authentication code**
---
---@param key binary
---@param data binary
---@return binary digest Binary MAC string
function MM.hmac256(key, data)
end

---**Calculates an HMAC1 message authentication code**
---
---@param key binary
---@param data binary
---@return binary digest Binary MAC string
function MM.hmac1(key, data)
end

---**Returns the current time with milliseconds as decimals**
---
---@return number timestamp
function MM.time()
end

---**Halts the execution for the specified number of seconds**
---
---@param seconds number
function MM.sleep(seconds)
end

---**Prints a message to the log and the UI**
---
---@param ... any
function MM.printStatus(...)
end
