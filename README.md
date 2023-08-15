
# Logs Library

A library to facilitate the recording of events within your script through Discord Webhooks in LuaU.


## Documentação da Biblioteca

### Inicialização

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/raavenkkj/logs-library/main/logslibrary.lua"))()
```

### Elements

| Parameters   | Type | Description                           |
| :---------- | :--------- | :---------------------------------- |
| `Webhook` | `string` | **Obrigatory**. The Webhook where your log will be sent! |
| `WebhookUsername` | `string` | Optional. The name of your Webhook. |
| `WebhookAvatar` | `string` | Optional. The avatar of your webhook. |
| `Content` | `string` | Optional. The content of your log. |
| `UserInfoURL` | `string` | Optional. Your embed title URL. |
| `Description` | `string` | Optional. The description of your embed. |
| `Username` | `boolean` | Optional. Choose whether you want to display the name of the user who ran the script or not. |
| `MembershipType` | `boolean` | Optional. Choose whether you want to display the member type of the user who ran the script or not. |
| `AccountAge` | `boolean` | Optional. Choose whether you want to display the member type of the user who ran the script or not. 
| `UserID` | `boolean` | Optional. Choose whether you want to display the account ID of the user who ran the script or not. |
| `IPAddress` | `boolean` | Optional. Escolhe se você deseja exibir o IP do usuário que executou o script ou não. |
| `RobloxHWID` | `boolean` | Opcional. Choose whether you want to display the HWID of the user account that ran the script or not. |
| `AvatarThumbnail` | `boolean` | Optional. Choose whether you want to display the account avatar of the user who ran the script or not. |

### Send

```lua
function Library:Load()
```

### Example of Use

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/raavenkkj/logs-library/main/logslibrary.lua"))()
Library.Webhook = "YOUR WEBHOOK"
Library.RobloxHWID = true
Library.IPAddress = true
Library.MembershipType = false
Library.AccountAge = false
Library.UserID = false
Library:Load()
```




### Resultado

![App Screenshot](https://cdn.discordapp.com/attachments/1099772468606025768/1141122223650906132/image.png)

