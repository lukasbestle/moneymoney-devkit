---@meta

---------------------------------------
-- General

---@type string Name of the extension
extensionName = nil

---@type number Version number of the extension
version = nil

---@type string? Description of the extension
description = nil

---------------------------------------
-- Import and export extensions

---@type string? Label for the export format in the format dropdown
format = nil

---@type string? File extension of the export file
fileExtension = nil

---------------------------------------
-- Export extensions

---@type string? Bundle identifier of an installed app for "Send transactions to"
bundleIdentifier = nil

---@type boolean? If set to `true`, the extension is not listed in the export dialog; the default is `false`, which displays the extension
hidden = nil

---@type boolean? If set to `true`, the oldest transaction is printed first; the default is `false`, which prints the transactions in the display order with the newest transaction first
reverseOrder = nil

---@type table<string, boolean>? Options that the user can toggle in the export dialog
options = nil

---------------------------------------
-- Web banking extensions

---@type table<string, string> Data store that persists beyond the run time of the script
LocalStorage = nil

---@type string? URL of the online banking entry page
url = nil

---@type string[]? List of supported service names to display in the account type dropdown during account creation
services = nil
