# Devkit for MoneyMoney extensions

> Formal documentation of the [MoneyMoney extension APIs](https://moneymoney-app.com/extensions/) for use with [lua-language-server](https://github.com/sumneko/lua-language-server)

This library of formal documentation brings the MoneyMoney API documentation directly into your IDE. It helps you to find typos, catches type errors and displays API documentation right at your fingertips.

## Installation

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Install the [lua-language-server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) extension
3. Download this repository or clone it with `git clone https://github.com/lukasbestle/moneymoney-devkit.git`
4. Enable the library in your VS Code settings. You can either enable it globally (if the only Lua projects you work on are MoneyMoney extensions) or just in the workspace (`.vscode/settings.json`):

```json
{
  "Lua.workspace.library": [
    "<repo>/library"
  ]
}
```

## Extension templates

Once you have installed and enabled the library, lua-language-server will know all types and classes that are provided by MoneyMoney inside the extension environment.

You can refer to the types with the [lua-language-server annotation syntax](https://github.com/sumneko/lua-language-server/wiki/Annotations).

To help you getting started, here are templates for different extension types:

### Web banking extension

```lua
WebBanking {
  version     = 1.00,
  url         = "...",
  services    = { "..." },
  description = "..."
}

---**Checks if this extension can request from a specified bank**
---
---@param protocol protocol Protocol of the bank gateway
---@param bankCode string Bank code or service name
---@return boolean | string # `true` or the URL to the online banking entry page if the extension supports the bank, `false` otherwise
function SupportsBank(protocol, bankCode)
end

---**Performs the login to the backend**
---
---@param protocol protocol Protocol of the bank gateway
---@param bankCode string Bank code or service name
---@param username string
---@param reserved string Empty, currently not in use
---@param password string
---@return LoginFailed | string | nil # Optional error message
function InitializeSession(protocol, bankCode, username, reserved, password)
end

---**Returns a list of accounts that can be refreshed with this extension**
---
---@param knownAccounts Account[] List of accounts that are already known via FinTS/HBCI
---@return NewAccount[] | string # List of accounts that can be requsted with web scraping or error message
function ListAccounts(knownAccounts)
end

---**Refreshes the balance and transaction of an account**
---
---@param account Account Account that is being refreshed
---@param since timestamp | nil POSIX timestamp of the oldest transaction to return or `nil` for portfolios
---@return AccountResults | string # Web scraping results or error message
function RefreshAccount(account, since)
end

---**Performs the logout from the backend**
---
---@return string? error Optional error message
function EndSession()
end
```

**`InitializeSession2` function (alternative to `InitializeSession`):**

```lua
---**Performs the login to the backend with 2FA**
---
---If the method returns a `LoginChallenge` object on the first call,
---it is called a second time with `step=2`.
---
---@param protocol protocol Protocol of the bank gateway
---@param bankCode string Bank code or service name
---@param step integer Step `1` or `2` of the 2FA
---@param credentials string[] Username and password on `step=1`, the challenge response on `step=2`
---@param interactive boolean If MoneyMoney is running in the foreground
---@return LoginChallenge | LoginFailed | string | nil # 2FA challenge or optional error message
function InitializeSession2(protocol, bankCode, step, credentials, interactive)
end
```

**Optional `FetchStatements` function:**

```lua
---**Fetches PDF statements from the bank**
---
---@param accounts Account[] Accounts to download statements for
---@param knownIdentifiers string[] List of statement identifiers (`statement.identifier`) that have already been downloaded
---@return StatementResults | string # Downloaded statements or error message
function FetchStatements(accounts, knownIdentifiers)
end
```

### Import extension

```lua
Importer {
  version       = 1.00,
  format        = "...",
  fileExtension = "..."
}

---**Parses transactions from the input file**
---
---@param account Account Account the transactions are imported to
---@return NewTransaction[] | string # Transactions or error message
function ReadTransactions (account)
end
```

### Export extension

```lua
Exporter {
  version       = 1.00,
  format        = "...",
  fileExtension = "...",
  description   = "..."
}

---Writes the first line(s) of the export file;
---called only once per export on the first account
---
---@param account Account Account from which transactions are being exported
---@param startDate timestamp Booking date of the oldest transaction
---@param endDate timestamp Booking date of the newest transaction
---@param transactionCount integer Number of transactions to be exported
---@param options table<string, boolean> Export options from the `Exporter` constructor
---@return string? error Optional error message that aborts the export
function WriteHeader(account, startDate, endDate, transactionCount, options)
end

---Writes a consecutive list of transactions of the same account;
---called multiple times if transactions from multiple accounts are exported
---
---@param account Account Account from which transactions are being exported
---@param transactions Transaction[] List of transactions of a booking date
---@param options table<string, boolean> Export options from the `Exporter` constructor
---@return string? error Optional error message that aborts the export
function WriteTransactions(account, transactions, options)
end

---Writes the last line(s) of the export file;
---called only once per export on the first account
---
---@param account Account Account from which transactions are being exported
---@param options table<string, boolean> Export options from the `Exporter` constructor
---@return string? error Optional error message that aborts the export
function WriteTail(account, options)
end
```

## Copyright

The method signatures and documentation texts are adapted from the [MoneyMoney website](https://moneymoney-app.com/extensions/). MRH applications GmbH, the developer of MoneyMoney, keeps all copyright.
