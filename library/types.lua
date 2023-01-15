---@meta

---@class Account
---@field name string Account description
---@field owner string Name of the account owner
---@field accountNumber string
---@field subAccount string Sub account attribute
---@field bankCode string
---@field currency string
---@field iban string
---@field bic string
---@field type accountType
---@field attributes table<string, string> Custom fields
---@field comment string Notes
---@field balance number
---@field balanceDate timestamp Date when the balance was refreshed

---@class AccountResults
---@field balance number? Current balance in the account currency
---@field balances table[]? Array of tuples, each with a balance and currency (to be returned instead of a single `balance`)
---@field pendingBalance number? Sum of all pending transactions
---@field transactions NewTransaction[]? New transactions, sorted with the newest transactions first
---@field securities NewSecurity[]?
---@field bonusPoints number? Number of points in a bonus program

---@alias accountType "Giro account" | "Savings account" | "Fixed term deposit" | "Loan account" | "Credit card" | "Portfolio" | "Other"

---@class BankInfo
---@field name string Name of the bank

---@alias binary string String in a charset other than UTF-8 or actual binary data

---@class ExporterParams
---@field version number Version number of the extension
---@field format string? Label for the export format in the format dropdown
---@field fileExtension string? File extension of the export file
---@field bundleIdentifier string? Bundle identifier of an installed app for "Send transactions to"
---@field hidden boolean? If set to `true`, the extension is not listed in the export dialog; the default is `false`, which displays the extension
---@field reverseOrder boolean? If set to `true`, the oldest transaction is printed first; the default is `false`, which prints the transactions in the display order with the newest transaction first
---@field description string? Description of the extension
---@field options ExportOption[]? Options that the user can toggle in the export dialog

---@class ExportOption
---@field label string Label for the option in the export dialog
---@field name string Internal key that gets passed to the extension in the options table
---@field default boolean Value of the option before the user changes it for the first time

---@class ImportedTransaction
---@field name string? Name of the payee
---@field accountNumber string? Account number or IBAN of the payee
---@field bankCode string? Bank code or BIC of the payee
---@field amount number
---@field currency string?
---@field bookingDate timestamp
---@field valueDate timestamp?
---@field purpose string? Multiline purpose text
---@field transactionCode integer?
---@field textKeyExtension integer?
---@field purposeCode string? SEPA purpose code
---@field bookingKey string? SWIFT booking key
---@field bookingText string? transaction type
---@field primanotaNumber string?
---@field batchReference string?
---@field endToEndReference string? SEPA end to end reference
---@field mandateReference string? SEPA mandate reference
---@field creditorId string? SEPA creditor ID
---@field returnReason string?
---@field booked boolean? Whether the transaction is booked or pending
---@field category string? Selected category name (levels separated with `\`)
---@field comment string? User-defined multiline comment

---@class ImporterParams
---@field version number Version number of the extension
---@field format string? Label for the import format in the format dropdown
---@field fileExtension string? File extension of the import file
---@field description string? Description of the extension

---@class LoginChallenge
---@field title string Headline for the 2FA dialog
---@field challenge string | binary String for a question or binary captcha image in PNG or JPEG format
---@field label string Label for the challenge answer field

---@alias LoginFailed "Login to server failed." Error message constant for a failed login because of invalid credentials

---@class NewAccount
---@field name string? Account description
---@field owner string? Name of the account owner
---@field accountNumber string
---@field subAccount string? Sub account attribute
---@field portfolio boolean Whether the account is a portfolio
---@field bankCode string?
---@field currency string?
---@field iban string?
---@field bic string?
---@field type accountType?

---@class NewSecurity
---@field name string Name of the security
---@field isin string
---@field securityNumber string WKN
---@field market string Exchange
---@field currency string? Set for nominal amount, `nil` for pieces
---@field quantity number Nominal amount or number of pieces
---@field amount number Value in the account currency
---@field originalCurrencyAmount number Value in the original currency
---@field currencyOfOriginalAmount string Original currency
---@field exchangeRate number Exchange rate at the time of purchase
---@field tradeTimestamp timestamp Time of quotation
---@field price number Current price
---@field currencyOfPrice string Currency if it differs from the account currency
---@field purchasePrice number
---@field currencyOfPurchasePrice string Currency if it differs from the account currency

---@class NewStatement
---@field creationDate timestamp
---@field identifier string Unique identifier to prevent downloading a statement multiple times
---@field pdf binary PDF file contents
---@field filename string Name of the PDF file
---@field account string? Account to assign the statement to (if multiple accounts exist)
---@field name string? Label of the statement file

---@class NewTransaction
---@field name string? Name of the payee
---@field accountNumber string? Account number or IBAN of the payee
---@field bankCode string? Bank code or BIC of the payee
---@field amount number
---@field currency string?
---@field bookingDate timestamp
---@field valueDate timestamp?
---@field purpose string? Multiline purpose text
---@field transactionCode integer?
---@field textKeyExtension integer?
---@field purposeCode string? SEPA purpose code
---@field bookingKey string? SWIFT booking key
---@field bookingText string? transaction type
---@field primanotaNumber string?
---@field batchReference string?
---@field endToEndReference string? SEPA end to end reference
---@field mandateReference string? SEPA mandate reference
---@field creditorId string? SEPA creditor ID
---@field returnReason string?
---@field booked boolean? Whether the transaction is booked or pending

---@alias protocol "HBCI+/FinTS" | "Web Banking"

---@class StatementResults
---@field statements NewStatement[]

---@alias timestamp integer POSIX timestamp

---@class Transaction
---@field name string Name of the payee
---@field accountNumber string Account number or IBAN of the payee
---@field bankCode string Bank code or BIC of the payee
---@field amount number
---@field currency string
---@field bookingDate timestamp
---@field valueDate timestamp
---@field purpose string Multiline purpose text
---@field transactionCode integer
---@field textKeyExtension integer
---@field purposeCode string SEPA purpose code
---@field bookingKey string SWIFT booking key
---@field bookingText string Transaction type
---@field primanotaNumber string
---@field batchReference string
---@field endToEndReference string SEPA end to end reference
---@field mandateReference string SEPA mandate reference
---@field creditorId string SEPA creditor ID
---@field returnReason string
---@field booked boolean Whether the transaction is booked or pending
---@field checkmark boolean Whether the checkmark in MoneyMoney was checked
---@field category string Selected category name (levels separated with `\`)
---@field comment string User-defined multiline comment
---@field id number Internal primary key in the MoneyMoney database

---@class WebBankingParams
---@field version number Version number of the extension
---@field url string? URL of the online banking entry page
---@field services string[]? List of supported service names to display in the account type dropdown during account creation
---@field description string? Description of the extension
