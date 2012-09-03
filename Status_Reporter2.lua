lang = "eng"
iTick = 0
Time = 0
Width = GetScreenWidth()
Height = GetScreenHeight()
Online = 0
CurOn = "No Language File Found"
SrvIP = "Unknown IP"
SrvIPCon = "No Language File Found"
LabelRatio = "No Language File Found"
LabelKills = "No Language File Found"
LabelDeaths = "No Language File Found"
LabelScore = "No Language File Found"
LabelPing = "No Language"
LabelTime = "No Language"
LabelLaserCl = "No Language File Found"
LabelLaserClOut = "No Language File Found"
LabelLaserClIn = "No Language File Found"
Score = 0
Ratio = 0
PlayerID = 0
Hilfsvar = 50
Waffe = 0
WaffenPic = 0
Ping = 0
Kills = 0
Deaths = 0
Sek = 0
Min = 0
Std = 0
OuterR = 0.075
OuterG = 0.075
OuterB = 0.25
OuterA = 1
InnerR = 0.5
InnerG = 0.5
InnerB = 1
InnerA = 1

Testbild = TextureLoad("Test.png")
Testbild2 = TextureLoad("Test.png")
a = UiGetScreenWidth() / UiGetScreenHeight()
StatHammer = 0
StatGun = 0
StatShotgun = 0
StatGrenade = 0
StatRifle = 0
StatHandle = 0
StatLife = 0
IsKog = 0
HilfsvarOnline = 0
HilfsvarLoggedIn = 0
Hilfsvar2 = 0
Credits = ""
px = 0
py = 0

--Getting needed Information
Include ("lua/Status_Reporter.config")

SetScriptTitle("Status_Reporter 0.1")
SetScriptInfo("(c) by Kebein")
SetScriptUseSettingPage(1)

AddEventListener ("OnKill", "Kill")
AddEventListener("OnRenderBackground", "OnRenderBackground")
AddEventListener("OnRenderLevel5", "Render5")
AddEventListener("OnChat", "Chat")
AddEventListener("OnAmmoRender", "HUDhide")
AddEventListener("OnHealthRender", "HUDhide")
AddEventListener("OnArmorRender", "HUDhide")
AddEventListener("OnRenderLaser", "RenderLaser")


Ui = table
Ui.Active = false
Ui.BaseRect = nil



Ui.Score = nil
Ui.Frags = nil
Ui.Deaths = nil
Ui.LabelRatio = nil
Ui.Ratio = nil 
Ui.Fpm = nil
Ui.GlobalRatio = nil
Ui.Flags = nil
Ui.ID = nil
Ui.OnlineList = nil
Ui.Test = nil
Ui.OnlineBox = nil
Ui.RatioBox = nil
Ui.DeathBox = nil
Ui.GlobalRatioBox = nil
Ui.KillStreak = nil
Ui.ServerIPBox = nil
Ui.ServerIP = nil
Ui.ConnectedTo = nil
Ui.InsertLang = nil
Ui.LanguageLabel = nil
Ui.KillsStreak = nil
Ui.ScoreLabel = nil
Ui.ScoreBox = nil
Ui.InfoBackground = nil
Ui.HeartPic = nil
Ui.ShieldPic = nil
Ui.AmmoPic = nil
Ui.KillsBox = nil
Ui.DeathsBox = nil
Ui.KillsLabel = nil
Ui.DeathsLabel = nil
Ui.nlvlpic = nil
Ui.Kills = nil
Ui.Deaths = nil
Ui.HammerStats = nil
Ui.GunStats = nil
Ui.ShotgunStats = nil
Ui.GrenadeStats = nil
Ui.RifleStats = nil
Ui.HammerPic = nil
Ui.GunPic = nil
Ui.ShotgunPic = nil
Ui.GrenadePic = nil
Ui.RiflePic = nil
Ui.HandleStats = nil
Ui.HandlePic = nil
Ui.KogStatsBg = nil
Ui.LifePic = nil
Ui.LifeStats = nil
Ui.KOG = nil
Ui.CreditsLabel = nil
Ui.Credits = nil
Ui.ApplyBtn = nil
Ui.PingBox = nil
Ui.PingLabel = nil
Ui.Ping = nil
Ui.MusicPanelBox = nil
Ui.MusicNext = nil
Ui.MusicPlay = nil
Ui.MusicPrev = nil
Ui.TimeBox = nil
Ui.TimeLabel = nil
Ui.Sekunden = nil
Ui.Minuten = nil
Ui.Stunden = nil
Ui.LabelLaserCl = nil
Ui.LabelLaserClOut = nil
Ui.LabelLaserClIn = nil
Ui.SldR = nil
Ui.SldG = nil
Ui.SldB = nil
Ui.SldA = nil
Ui.PreviewOuter = nil
Ui.PreviewOuter2 = nil
Ui.PreviewInner = nil
Ui.SldInnerR = nil
Ui.SldInnerG = nil
Ui.SldInnerB = nil
Ui.SldInnerA = nil

function ConfigOpen(x, y, w, h)
GetLanguage()
py = y
px = x
     Ui.Active = true 
	 Ui.BaseRect = UiDoRect(x, y, w, h, 0, 15, 15, 0, 0, 0, 0.5)
	 Ui.InsertLang = UiDoEditBox (x + 110, y + 10, 100, 20, 0, lang)
	 Ui.LanguageLabel = UiDoLabel (x + 10, y + 10, 100, 20, 0, "Type Your Language Here:", 20, -1)
	 Ui.CreditsLabel = UiDoLabel (x + 220, y + 10, 150, 20, 0, "Language File by:", 20, -1)
	 Ui.Credits = UiDoLabel (x + 380, y + 10, 100, 20, 0, Credits, 20, -1)
	 Ui.ApplyBtn = UiDoButton (x + 60, y + 60, 100, 20, 0, "Apply", "Apply")
	 Ui.LabelLaserCl = UiDoLabel (x + 10, y + 90, 400, 20, 0, LabelLaserCl, 20, -1)
	 Ui.LabelLaserClOut = UiDoLabel(x + 10, y + 120, 400, 20, 0, LabelLaserClOut, 20, -1)
	 Ui.SldR = UiDoSlider (x + 10, y + 150, 400, 15, 0, OuterR, "SetOuterR")
	 Ui.SldG = UiDoSlider (x + 10, y + 170, 400, 15, 0, OuterG, "SetOuterG")
	 Ui.SldB = UiDoSlider (x + 10, y + 190, 400, 15, 0, OuterB, "SetOuterB")
	 Ui.SldA = UiDoSlider (x + 10, y + 210, 400, 15, 0, OuterA,	"SetOuterA")
	 Ui.LabelLaserClIn = UiDoLabel(x + 10, y + 230, 400, 20, 0, LabelLaserClIn, 20, -1)
	 Ui.SldInnerR = UiDoSlider (x + 10, y + 250, 400, 15, 0, InnerR, "SetInnerR")
	 Ui.SldInnerG = UiDoSlider (x + 10, y + 270, 400, 15, 0, InnerG, "SetInnerG")
	 Ui.SldInnerB = UiDoSlider (x + 10, y + 290, 400, 15, 0, InnerB, "SetInnerB")
	 Ui.SldInnerA = UiDoSlider (x + 10, y + 310, 400, 15, 0, InnerA, "SetInnerA")
	 Ui.PreviewOuter = UiDoRect (x + 10, y + 330, 200, 1, 0, 0, 0, OuterR, OuterG, OuterB, OuterA)
	 Ui.PreviewInner = UiDoRect (x + 10, y + 331, 200, 5, 0, 0, 0, InnerR, InnerG, InnerB, OuterA)
	 Ui.PreviewOuter2 = UiDoRect (x + 10, y + 336, 200, 1, 0, 0, 0, OuterR, OuterG, OuterB, OuterA)
end

function SetOuterR(val)
OuterR = val
UiSetColor(Ui.PreviewOuter, OuterR, OuterG, OuterB, OuterA)
UiSetColor(Ui.PreviewOuter2, OuterR, OuterG, OuterB, OuterA)
end

function SetOuterG(val)
OuterG = val
UiSetColor(Ui.PreviewOuter, OuterR, OuterG, OuterB, OuterA)
UiSetColor(Ui.PreviewOuter2, OuterR, OuterG, OuterB, OuterA)
end

function SetOuterB(val)
OuterB = val
UiSetColor(Ui.PreviewOuter, OuterR, OuterG, OuterB, OuterA)
UiSetColor(Ui.PreviewOuter2, OuterR, OuterG, OuterB, OuterA)
end

function SetOuterA(val)
OuterA = val
UiSetColor(Ui.PreviewOuter, OuterR, OuterG, OuterB, OuterA)
UiSetColor(Ui.PreviewOuter2, OuterR, OuterG, OuterB, OuterA)
end

function SetInnerR(val)
InnerR = val
UiSetColor(Ui.PreviewInner, InnerR, InnerG, InnerB, InnerA)
end

function SetInnerG(val)
InnerG = val
UiSetColor(Ui.PreviewInner, InnerR, InnerG, InnerB, InnerA)
end

function SetInnerB(val)
InnerB = val
UiSetColor(Ui.PreviewInner, InnerR, InnerG, InnerB, InnerA)
end

function SetInnerA(val)
InnerA = val
UiSetColor(Ui.PreviewInner, InnerR, InnerG, InnerB, InnerA)
end

function Apply()
lang = UiGetText(Ui.InsertLang)
configout = io.open("lua/Status_Reporter.config","wb")
 configout:write ("lang = \"" ..lang.. "\"\n")
configout:close()
Include ("lua/Status_Reporter.config")
GetLanguage()
UiRemoveElement(Ui.InsertLang)
UiRemoveElement(Ui.LanguageLabel)
UiRemoveElement(Ui.CreditsLabel)
UiRemoveElement(Ui.Credits)
UiRemoveElement(Ui.ApplyBtn)

	 Ui.InsertLang = UiDoEditBox (px + 110, py + 10, 100, 20, 0, lang)
	 Ui.LanguageLabel = UiDoLabel (px + 10, py + 10, 100, 20, 0, "Type Your Language Here:", 20, -1)
	 Ui.CreditsLabel = UiDoLabel (px + 220, py + 10, 150, 20, 0, "Language File by:", 20, -1)
	 Ui.Credits = UiDoLabel (px + 380, py + 10, 100, 20, 0, Credits, 20, -1)
	 Ui.ApplyBtn = UiDoButton (px + 60, py + 60, 100, 20, 0, "Apply", "Apply")
End

function OnRenderBackground()
	 RenderTexture (Testbild, 0, 0, 300 * a, 300)
end
function RenderLaser (FromX, FromY, ToX, ToY, OutR, OutG, OutB, OutA, InnR, InnG, InnB, InnA)
OutR = OuterR 
OutG = OuterG 
OutB = OuterB
OutA = OuterA
InnR = InnerR
InnG = InnerG
InnB = InnerB
InnA = InnerA
return render, OuterR, OuterG, OuterB, OuterA, InnerR, InnerG, InnerB, InnerA
end


function Chat(Text, ID, Team)

  if (Text:find("Logged in")) then
   HilfsvarLoggedIn = 1
  end
    if (ID == -1) then
	if (Text:find ("Upgrade")) then
      ChatSend("/stats")

	end
        if (string.char(Text:byte(1)) == "H" and string.char(Text:byte(2)) == "a" and string.char(Text:byte(3)) == "m") then
     
            i = 0
            for w in Text:gmatch("%d+") do
                i = i + 1
                if (i == 1) then
                    StatHammer = tonumber(w)
                end
                if (i == 2) then
                    StatGun = tonumber(w)
                end
                if (i == 3) then
                    StatShotgun = tonumber(w)
                end
                if (i == 4) then
                    StatGrenade = tonumber(w)
                end
            end
		     return true
        end
		
        if (string.char(Text:byte(1)) == "R" and string.char(Text:byte(2)) == "i" and string.char(Text:byte(3)) == "f") then
           
            i = 0
            for w in Text:gmatch("%d+") do
                i = i + 1
                if (i == 1) then
                    StatRifle = tonumber(w)
                end
                if (i == 2) then
                    StatLife = tonumber(w)
                end
                if (i == 3) then
                    StatHandle = tonumber(w)
                end
            end

	  return true
        end
	        if (string.char(Text:byte(1)) == "L" and string.char(Text:byte(2)) == "e" and string.char(Text:byte(3)) == "v") then	
			return true
			end
    end
end

function ConfigClose()
Ui.Active = false
UiRemoveElement (Ui.BaseRect)
lang = UiGetText(Ui.InsertLang)
configout = io.open("lua/Status_Reporter.config","wb")
 configout:write ("lang = \"" ..lang.. "\"\n")
 configout:write ("OuterR = " ..OuterR)
 configout:write ("OuterG = " ..OuterG)
 configout:write ("OuterB = " ..OuterB)
 configout:write ("OuterA = " ..OuterA)
 configout:write ("InnerR = " ..InnerR)
 configout:write ("InnerG = " ..InnerG)
 configout:write ("InnerB = " ..InnerB)
 configout:write ("InnerA = " ..InnerA)
configout:close()
UiRemoveElement (Ui.InsertLang)
UiRemoveElement (Ui.LanguageLabel)
UiRemoveElement (Ui.CreditsLabel)
UiRemoveElement (Ui.Credits)
UiRemoveElement (Ui.ApplyBtn)
UiRemoveElement(Ui.SldR)
UiRemoveElement(Ui.SldG)
UiRemoveElement(Ui.SldB)
UiRemoveElement(Ui.PreviewOuter)
UiRemoveElement(Ui.PreviewOuter2)
UiRemoveElement(Ui.SldInnerR)
UiRemoveElement(Ui.SldInnerG)
UiRemoveElement(Ui.SldInnerB)
UiRemoveElement(Ui.PreviewInner)
UiRemoveElement(Ui.LabelLaserCl)
UiRemoveElement(Ui.LabelLaserClOut)
UiRemoveElement(Ui.LabelLaserClIn)
UiRemoveElement(Ui.SldInnerA)
UiRemoveElement(Ui.SldA)

--Refresh the Configs
Include ("lua/Status_Reporter.config")

end

function Kill(Killer, Victim, Weapon)
if (Victim ~= GetLocalCharacterID() and Killer == GetLocalCharacterID()) then
Kills = Kills + 1
end
if (Victim == GetLocalCharacterID() and Killer ~= GetLocalCharacterID()) then
Deaths = Deaths + 1
end
end

function GetLanguage()

if (lang == "ger") then
  Include ("lua/Ger.txt")
end

if (lang == "eng") then
  Include ("lua/Eng.txt")
end

if (lang == "fr") then
  Include ("lua/Fr.txt")
end

if (lang == "es") then
  Include ("lua/Es.txt")
end

if (lang == "tr") then
  Include ("lua/Tr.txt")
end

if (lang == "bul") then
  Include ("lua/Bul.txt")
end

if (lang == "srb") then
 Include ("lua/Srb.txt")
end

if (lang == "rus") then
  Include ("lua/Rus.txt")
end

if (lang == "ita") then
  Include ("lua/Ita.txt")
end

end

function Tick(Time, ServerTick)
    iTick = iTick + 1
    Time = Time or 0
    ServerTick = ServerTick or 0
	Sek = TimeGet()
	PlayerID = GetLocalCharacterId()
	Score = GetPlayerScore(PlayerID)
	Health = GetLocalCharacterHealth()
	--Im spec gibts kein health, daher wird nichts angezeigt, sieht komisch aus, daher wirds für diesen fall hier gleich null gesetzt
	if (Health == nil) then
	Health = 0
	end
	-- Same goes for armor
	Armor = GetLocalCharacterArmor()
	if (Armor == nil) then
	Armor = 0
	end
	--Ammo auch
	Ammo = GetLocalCharacterWeaponAmmo()
	if (Ammo == nil) then
	Ammo = 0
	end
	
	_, SrvIP = GetServerInfo()

	if (HilfsvarLoggedIn >=  1) then
	HilfsvarLoggedIn = HilfsvarLoggedIn + 1
	end
	if( HilfsvarLoggedIn == 100 and IsKog == 1) then
	ChatSend("/stats")
	end

	--GetPing vom spieler
	Ping = GetPlayerPing(GetLocalCharacterId())
	
	--wenn esc gedrückt
	if(MenuActive() == true and Online == 1) then
	OptionsActive()
	end


	 if (Score == 0) then
	   Hilfsvar = 50
	 end

      if (Score < 100) then
	     Hilfsvar = 50
	  end

	  if (Score < 1000) then
	     Hilfsvar = 40
	  end

	  if (Score < 10000) then
	     Hilfsvar = 30
	  end

	  if (Score < 100000) then
	     Hilfsvar = 20
	  end

	  if (Score < 1000000) then
	     Hilfsvar = 10
	  end

	  if (Score > 1000000) then
	     Hilfsvar = 0
	  end
	  CalcTime()
	  
	 if (StateOnline() == true and MenuActive() == false) then
		 
		if (Online == 0) then
			Online = 1
		    GetLanguage()

			--Uhr
			UiDoTime()
	
			--Punktezähler
			UiDoScore()

			--IpAdresse
			UiDoIp()
			--Freundesliste, N-LVL neues featureblablabla
			--UiDoFriendlist()

			--Ammo, Health und der ganze andere müll
			UiDoHud()
			--KillCounter
			UiDoKills()
			--DeathCounter	
			UiDoDeaths()
			-- Ratio
			UiDoRatio()
			--Ping
			UiDoPing()
			--DoMusicPanel()
			
					
        end

	end

	if (GetGameType() == "KoG|DM") then
	IsKog = 1
	end
	if (GetGameType() == "KoG|TDM") then
	IsKog = 1
	end
	if (GetGameType() == "KoG|CTF") then
	IsKog = 1
	end
	if (GetGameType() == "Build") then
	IsKog = 2
	end
						--Do KogShit

	if (IsKog == 1 and Online == 1 and HilfsvarOnline == 0) then
		UiDoKog()
	end


	if (StateOnline() and Online == 1) then
	RenderRatio()
	RenderAmmoPic()
	RenderHudUi()	
	RenderScore()
	RenderKills()
	RenderDeaths()
	RenderPing()
	RenderTime()

		 if (IsKog == 1 and HilfsvarOnline==1) then
		    RenderKog()
			
		 end
	 end
    


	if (StateOffline()) then
	 OfflineRemoveHud()
    end

end



function DoMusicPanel()
Ui.MusicPanelBox = UiDoRect (20, Height/2 + 150, 300, 150, 0, 15, 15, 1, 1, 1, 0.1)
Ui.MusicPrev = UiDoButton (30, Height/2 + 150, 40, 40, 0, "<<", "MusicPrev")
UiSetColor(Ui.MusicPrev, 1, 1, 1, 0.1)

end

function HUDhide()
return true
end

function CorrectValue(i)
    return i / 1200 * UiGetScreenHeight()
end


function IsKogServer()

    if (GetGameType() == "KoG|DM") then
        return true
    end
    if (GetGameType() == "KoG|TDM") then
        return true
    end
    if (GetGameType() == "KoG|CTF") then
        return true
    end
	if (GetGameType() == "Build") then
        return true
    end
	return false
end	

function ReadStats()

	
    ChatSend("/stats")
    

end
function UiDoScore()
	Ui.ScoreBox = UiDoRect (-15, Height/2 - 20, 160, 55, 0, 15, 15, 0.6, 0.7, 0.1, 0.8)
	Ui.ScoreLabel = UiDoLabel (5, Height / 2 - 15, 210, 20, 0, LabelScore, 20, -1)
	Ui.Score = UiDoLabel (Hilfsvar, Height / 2 + 5, 150, 30, 0, Score, 30, -1)
end

function OfflineRemoveHud()
Online = 0
	 IsKog = 0
	 UiRemoveElement(Ui.OnlineList)
	 Ui.OnlineList = nil
	 UiRemoveElement(Ui.OnlineBox)
	 Ui.OnlineBox = nil
	 UiRemoveElement(Ui.ServerIPBox)
	 Ui.ServerIPBox = nil
	 UiRemoveElement(Ui.SrvIP)
	 Ui.SrvIP = nil
	 UiRemoveElement(Ui.ConnectedTo)
	 Ui.ConnectedTo = nil
	 UiRemoveElement(Ui.KillStreak)
	 Ui.KillStreak = nil
	 UiRemoveElement(Ui.ScoreLabel)
	 Ui.ScoreLabel = nil
	 UiRemoveElement(Ui.Score)
	 Ui.Score = nil
	 UiRemoveElement (Ui.Health)
	 Ui.Health = nil
	 UiRemoveElement(Ui.Armor)
	 Ui.Armor = nil
	 UiRemoveElement(Ui.Ammo)
	 Ui.Ammo = nil
	 UiRemoveElement(Ui.InfoBackground)
	 Ui.InfoBackground = nil
	 UiRemoveElement(Ui.AmmoPic)
	 Ui.AmmoPic = nil
	 UiRemoveElement(Ui.HeartPic)
	 Ui.HeartPic = nil
	 UiRemoveElement(Ui.ShieldPic)
	 Ui.ShieldPic = nil
	 UiRemoveElement(Ui.ScoreBox)
	 Ui.ScoreBox = nil
	 UiRemoveElement(Ui.KillsBox)
	 Ui.KillsBox = nil
	 UiRemoveElement(Ui.KillsLabel)
	 Ui.KillsLabel = nil
	 UiRemoveElement(Ui.DeathsBox)
	 Ui.DeathsBox = nil
	 UiRemoveElement(Ui.DeathsLabel)
	 Ui.DeathsLabel = nil
	 UiRemoveElement(Ui.Kills)
	 Ui.Kills = nil
	 UiRemoveElement(Ui.Deaths)
	 Ui.Deaths = nil
	 UiRemoveElement(Ui.KOG)
	 Ui.KOG = nil
	 UiRemoveElement(Ui.HammerStats)
	 Ui.HammerStats = nil
	 UiRemoveElement(Ui.GunStats)
	 Ui.GunStats = nil
	 UiRemoveElement(Ui.ShotgunStats)
	 Ui.ShotgunStats = nil
	 UiRemoveElement(Ui.GrenadeStats)
	 Ui.GrenadeStats = nil
	 UiRemoveElement(Ui.RifleStats)
	 Ui.RifleStats = nil
	 UiRemoveElement(Ui.HandleStats)
	 Ui.HandleStats = nil
	 UiRemoveElement(Ui.LifeStats)
	 Ui.LifeStats = nil
	 UiRemoveElement(Ui.HammerPic)
	 Ui.HammerPic = nil
	 UiRemoveElement(Ui.GunPic)
	 Ui.GunPic = nil
	 UiRemoveElement(Ui.GrenadePic)
	 Ui.GrenadePic = nil
	 UiRemoveElement(Ui.ShotgunPic)
	 Ui.ShotgunPic = nil
	 UiRemoveElement(Ui.RiflePic)
	 Ui.RiflePic = nil
	 UiRemoveElement(Ui.HandlePic)
	 Ui.HandlePic = nil
	 UiRemoveElement(Ui.LifePic)
	 Ui.LifePic = nil
	 UiRemoveElement(Ui.PingBox)
	 Ui.PingBox = nil
	 UiRemoveElement(Ui.PingLabel)
	 Ui.PingLabel = nil
	 UiRemoveElement(Ui.Ping)
	 Ui.Ping = nil
	 UiRemoveElement(Ui.MusicPanelBox)
	 Ui.MusicPanelBox = nil
	 UiRemoveElement(Ui.MusicPrev)
	 Ui.MusicPrev = nil
	 UiRemoveElement(Ui.RatioBox)
	 Ui.RatioBox = nil
	 UiRemoveElement(Ui.LabelRatio)
	 Ui.LabelRatio = nil
	 HilfsvarLoggedIn = 0
	 Hilfsvar2 = 0
	 HilfsvarOnline = 0
	 Kills = 0
	 Deaths = 0
	 Waffe = nil
	 Ui.AmmoPic = nil
	 RemoveTime()
end

function OptionsActive()
RemovePing()
RemoveFriendlist()
RemoveIpAddress()
RemoveScore()
RemoveHudUi()
RemoveMusicPanel()
RemoveKills()
RemoveDeaths()
RemoveRatio()
RemoveTime()
	 UiRemoveElement(Ui.KillStreak)
	 Ui.KillStreak = nil


	  if (IsKog == 1) then
	 RemoveKog()
	 end
	 
	 Online = 0
end

function RemovePing()
	 UiRemoveElement(Ui.PingBox)
	 Ui.PingBox = nil
	 UiRemoveElement(Ui.PingLabel)
	 Ui.PingLabel = nil
	 UiRemoveElement(Ui.Ping)
	 Ui.Ping = nil
end

function RemoveRatio()
	 UiRemoveElement(Ui.RatioBox)
	 Ui.RatioBox = nil
	 UiRemoveElement(Ui.LabelRatio)
	 Ui.LabelRatio = nil
	 UiRemoveElement(Ui.Ratio)
	 Ui.Ratio = nil
end
function RemoveFriendlist()
	UiRemoveElement(Ui.OnlineList)
	Ui.OnlineList = nil
	UiRemoveElement(Ui.OnlineBox)
	Ui.OnlineBox = nil
end

function RemoveIpAddress()
	 UiRemoveElement(Ui.ServerIPBox)
	 Ui.ServerIPBox = nil
	 UiRemoveElement(Ui.SrvIP)
	 Ui.SrvIP = nil
	 UiRemoveElement(Ui.ConnectedTo)
	 Ui.ConnectedTo = nil
end

function RemoveScore()
	UiRemoveElement(Ui.ScoreBox)
	 Ui.ScoreBox = nil
	 UiRemoveElement(Ui.ScoreLabel)
	 Ui.ScoreLabel = nil
	 UiRemoveElement(Ui.Score)
	 Ui.Score = nil
end

function RemoveHudUi()
	 UiRemoveElement(Ui.InfoBackground)
	 Ui.InfoBackground = nil
	 UiRemoveElement(Ui.InfoBackground)
	 Ui.InfoBackground = nil
	 UiRemoveElement (Ui.Health)
	 Ui.Health = nil
	 UiRemoveElement(Ui.Armor)
	 Ui.Armor = nil
	 UiRemoveElement(Ui.Ammo)
	 Ui.Ammo = nil
	 UiRemoveElement(Ui.AmmoPic)
	 Ui.AmmoPic = nil
	 UiRemoveElement(Ui.HeartPic)
	 Ui.HeartPic = nil
	 UiRemoveElement(Ui.ShieldPic)
	 Ui.HeartPic = nil
end

function RemoveMusicPanel()
	 UiRemoveElement(Ui.MusicPanelBox)
	 UiRemoveElement(Ui.MusicPrev)
end

function RemoveKills()
	 UiRemoveElement(Ui.KillsBox)
	 Ui.KillsBox = nil
	 UiRemoveElement(Ui.KillsLabel)
	 Ui.KillsLabel = nil
	 UiRemoveElement(Ui.Kills)
	 Ui.Kills = nil
end

function RemoveDeaths()
	 UiRemoveElement(Ui.DeathsBox)
	 Ui.DeathsBox = nil
	 UiRemoveElement(Ui.DeathsLabel)
	 Ui.DeathsLabel = nil
	 UiRemoveElement(Ui.Deaths)
	 Ui.Deaths = nil
end

function RemoveKog()
	 UiRemoveElement(Ui.KOG)
	 Ui.KOG = nil
	 UiRemoveElement(Ui.HammerStats)
	 Ui.HammerStats = nil
	 UiRemoveElement(Ui.GunStats)
	 Ui.GunStats = nil
	 UiRemoveElement(Ui.ShotgunStats)
	 Ui.ShotgunStats = nil
	 UiRemoveElement(Ui.GrenadeStats)
	 Ui.GrenadeStats = nil
	 UiRemoveElement(Ui.RifleStats)
	 Ui.RifleStats = nil
	 UiRemoveElement(Ui.HandleStats)
	 Ui.HandleStats = nil
	 UiRemoveElement(Ui.LifeStats)
	 Ui.LifeStats = nil
	 UiRemoveElement(Ui.HammerPic)
	 Ui.HammerPic = nil
	 UiRemoveElement(Ui.GunPic)
	 Ui.GunPic = nil
	 UiRemoveElement(Ui.GrenadePic)
	 Ui.GrenadePic = nil
	 UiRemoveElement(Ui.ShotgunPic)
	 Ui.ShotgunPic = nil
	 UiRemoveElement(Ui.RiflePic)
	 Ui.RiflePic = nil
	 UiRemoveElement(Ui.HandlePic)
	 Ui.HandlePic = nil
	 UiRemoveElement(Ui.LifePic)
	 Ui.LifePic = nil
	
	
	 HilfsvarOnline = 0
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function UiDoIp()
	Ui.ServerIPBox =  UiDoRect (Width / 2 + 80, 0, 200, 50, 0, 15, 15, 0.2, 0.8, 0.8, 0.5)
	Ui.ConnectedTo = UiDoLabel (Width/2 + 85, 5, 200, 20, 0, SrvIPCon, 20, -1)
	Ui.SrvIP = UiDoLabel (Width / 2 + 85, 25, 200, 20, 0, SrvIP, 20, -1)
end

function UiDoRatio()
Ui.RatioBox = UiDoRect (Width - 200, Height/2 + 145, 200, 40, 0, 15, 15, 0.0, 0.2, 0.0, 0.5)
Ui.LabelRatio = UiDoLabel (Width - 195, Height/2 + 155, 200, 20, 0,LabelRatio, 20, -1)
end

function UiDoFriendlist()
	Ui.OnlineBox = UiDoRect (Width - 105, Height - 505, 100, Height - 250, 0, 0, 0, 0.5)
	Ui.OnlineList = UiDoLabel (Width - 100, Height - 500, 100, 20, 0, CurOn, 20, -1)
	Ui.nlvlpic = UiDoImageEx (Width/2, Height/2, 25, 25, 0, Testbild2)
end

function RenderRatio()
if (Deaths == 0) then
Ratio = Kills/1
elseif (Deaths ~= 0) then
Ratio = round(Kills / Deaths , 2)
end
UiRemoveElement(Ui.Ratio)

Ui.Ratio = UiDoLabel (Width - 80, Height/2 + 155, 200, 20, 0, Ratio, 20, -1)
end

function RenderAmmoPic()
		UiRemoveElement(Ui.AmmoPic)
		Ui.AmmoPic = nil
	 			Waffe = GetLocalCharacterWeapon()

		if (Waffe == 0) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 41, "")
		end
		if (Waffe == 1) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 28, "")
		end
		if (Waffe == 2) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 34, "")
		end
		if (Waffe == 3) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 40, "")
		end
		if (Waffe == 4) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 49, "")
		end
		if (Waffe == 5) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 14, "")
		end
		if (Waffe == nil) then
		Ui.AmmoPic =  UiDoImage (45, 65, 20, 20, 0, UiGetGameTextureID(), 28, "")
		end
end

function RenderHudUi()
		UiRemoveElement (Ui.Health)
		UiRemoveElement (Ui.Armor)
		UiRemoveElement (Ui.Ammo)
		Ui.Health = UiDoLabel (65, 5, 200, 20, 0, Health, 20, -1)
		Ui.Armor = UiDoLabel (65, 35, 200, 20, 0, Armor, 20, -1)
		Ui.Ammo = UiDoLabel (65, 65, 200, 20, 0, Ammo, 20, -1)
end

function RenderScore()
		UiRemoveElement(Ui.Score)
		Ui.Score = UiDoLabel (Hilfsvar, Height / 2 + 5, 150, 30, 0, Score, 30, -1)
end

function RenderKills()
		if (lang == "rus") then
		UiRemoveElement(Ui.Kills)
		Ui.Kills = UiDoLabel (90, Height/2 -110, 50, 20, 0, Kills, 20, -1)
		elseif (lang ~= "rus") then
		UiRemoveElement(Ui.Kills)
		Ui.Kills = UiDoLabel (80, Height/2 -110, 50, 20, 0, Kills, 20, -1)
		end
end

function RenderDeaths()
		UiRemoveElement(Ui.Deaths)
		Ui.Deaths = UiDoLabel (90, Height/2 - 60, 50, 20, 0, Deaths, 20, -1)
end

function RenderPing()
UiRemoveElement(Ui.Ping)
		Ui.Ping = nil
		if (Ping ~= nil) then
		if (Ping <= 65 ) then
		Ui.Ping = UiDoLabel (Width/2 - 130, 25, 50, 20, 0, Ping, 20, -1)
		UiSetColor(Ui.Ping, 0.2, 0.6, 0.2, 1)
		elseif (Ping > 65) then
	    Ui.Ping = UiDoLabel (Width/2 - 130, 25, 50, 20, 0, Ping, 20, -1)
		UiSetColor(Ui.Ping, 0.6, 0.0, 0.0, 1)
		end
		end
end

function RenderTime()
		CalcTime()
		UiRemoveElement(Ui.Sekunden)
		UiRemoveElement(Ui.Minuten)
		UiRemoveElement(Ui.Stunden)
		Ui.Sekunden = UiDoLabel(230, 30, 40, 20, 0, Sek, 20, -1)
		Ui.Minuten = UiDoLabel (205, 30, 40, 20, 0, Min, 20, -1)
		Ui.Stunden = UiDoLabel(180, 30, 40, 20, 0, Std, 20, -1)
end

function RenderKog()
			UiRemoveElement(Ui.HammerStats)
			Ui.HammerStats = UiDoLabel (Width/2 + 100, Height - 100, 60, 20, 0, StatHammer, 20, -1)
			UiRemoveElement(Ui.GunStats)
			Ui.GunStats = UiDoLabel (Width/2 + 100, Height - 60, 100, 20, 0, StatGun, 20, -1)
			UiRemoveElement(Ui.ShotgunStats)
			Ui.ShotgunStats = UiDoLabel (Width/2 + 100, Height - 30, 60, 20, 0, StatShotgun, 20, -1)
			UiRemoveElement(Ui.GrenadeStats)
			Ui.GrenadeStats = UiDoLabel (Width/2 + 230, Height - 100, 60, 20, 0, StatGrenade, 20, -1)
			UiRemoveElement(Ui.RifleStats)
			Ui.RifleStats = UiDoLabel (Width/2 + 230, Height - 60, 60, 20, 0, StatRifle, 20, -1)
			UiRemoveElement(Ui.HandleStats)
			Ui.HandleStats = UiDoLabel (Width/2 + 180, Height - 30, 60, 20, 0, StatHandle, 20, -1)
			UiRemoveElement(Ui.LifeStats)
			Ui.LifeStats = UiDoLabel (Width/2 + 240, Height - 30, 60, 20, 0, StatLife, 20, -1)
end

function UiDoKog()
	Ui.KOG = UiDoRect(Width/2 + 30, Height - 110, 270, 130, 0, 15, 15, 0.7, 0.6, 0.1, 0.5)
	HilfsvarOnline = 1
	Ui.HammerPic = UiDoImage (Width/2 + 40, Height - 100, 40, 40, 0,UiGetGameTextureID(1), 41, "")
	Ui.GunPic = UiDoImage (Width/2 + 40, Height -60, 40, 20, 0,UiGetGameTextureID(1), 26, "")
	Ui.ShotgunPic = UiDoImage (Width/2 + 40, Height -30, 60, 20, 0,UiGetGameTextureID(1), 32, "")
	Ui.GrenadePic = UiDoImage (Width/2 + 160, Height - 100, 60, 20, 0,UiGetGameTextureID(1), 38, "")
	Ui.RiflePic = UiDoImage (Width/2 + 160, Height - 60, 60, 20, 0,UiGetGameTextureID(1), 47, "")
	Ui.HandlePic = UiDoImage (Width/2 + 160, Height - 30, 20, 20, 0,UiGetGameTextureID(1), 14, "")
	Ui.LifePic = UiDoImage (Width/2 + 220, Height - 30, 20, 20, 0,UiGetGameTextureID(1), 55, "")
end

function UiDoPing()
			if (lang == "bul" or lang == "tr") then
			Ui.PingBox = UiDoRect (Width/2 - 170, 0, 100, 50, 0, 15, 15, 0.6, 0.2, 0.8, 0.6)	
			elseif (lang ~= "bul" or lang ~= "tr") then
			Ui.PingBox = UiDoRect (Width/2 - 150, 0, 60, 50, 0, 15, 15, 0.6, 0.2, 0.8, 0.6)	
			end
			if (lang == "bul" or lang == "tr") then
			Ui.PingLabel = UiDoLabel (Width/2 - 160, 5, 100, 20, 0, LabelPing, 20, -1)
			elseif (lang ~= "tr" or lang ~= "bul") then
			Ui.PingLabel = UiDoLabel (Width/2 - 140, 5, 50, 20, 0, LabelPing, 20, -1)
			end
			Ui.Ping = UiDoLabel (Width/2 - 130, 25, 50, 20, 0, Ping, 20, -1)
end

function UiDoHud()
			Ui.InfoBackground = UiDoRect (20, 0, 140, 90, 0, 15, 15, 0.1, 0.5, 0.9, 0.5)
			Ui.HeartPic = UiDoImage (45, 5, 20, 20, 0, UiGetGameTextureID(), 10, "")
			Ui.Health = UiDoLabel (65, 5, 200, 20, 0, Health, 20, -1)
			Ui.ShieldPic = UiDoImage (45, 35, 20, 20, 0, UiGetGameTextureID(), 12, "")
			Ui.Armor = UiDoLabel (65, 35, 200, 20, 0, Armor, 20, -1)
			Ui.Ammo = UiDoLabel (65, 65, 200, 20, 0, Ammo, 20, -1)
end

function UiDoDeaths()
			Ui.DeathsBox = UiDoRect(-15, Height/2 - 70, 170, 40, 0, 15, 15, 0.9, 0.2, 0.1, 0.5)
			if (lang == "bul") then
			Ui.DeathsLabel = UiDoLabel (5, Height/2 -70, 90, 20, 0, LabelDeaths, 20, -1)		
			elseif (lang ~= "bul") then
			Ui.DeathsLabel = UiDoLabel (5, Height/2 -60, 90, 20, 0, LabelDeaths, 20, -1)	
			end
end

function UiDoKills()
			Ui.KillsBox = UiDoRect(-15, Height/2 - 120, 170, 40, 0, 15, 15, 0.1, 0.9, 0.3, 0.5)
			Ui.KillsLabel = UiDoLabel (5, Height/2 -110, 90, 20, 0, LabelKills, 20, -1)		
end

function UiDoTime()

			Ui.TimeBox = UiDoRect(170, 0, 120, 55, 0, 15, 15, 1, 1, 1, 0.1)
			Ui.TimeLabel = UiDoLabel(180, 5, 110, 20, 0, LabelTime, 20, -1)
			Ui.Sekunden = UiDoLabel(230, 30, 40, 20, 0, Sek , 20, -1)
			Ui.Minuten = UiDoLabel (205, 30, 40, 20, 0, Min, 20, -1)
			Ui.Stunden = UiDoLabel(180, 30, 40, 20, 0, Std, 20, -1)

end

function CalcTime()
			Date = GetDate("*t")
			if (tonumber(Date["sec"]) < 10) then
			Sek = "0" ..Date["sec"]
			else
			Sek = Date["sec"]
			end
			
			if (tonumber(Date["min"]) < 10) then
			Min = "0" ..Date["min"].. ":"
			else
			Min = Date["min"] ..":"
			end
			if (tonumber(Date["hour"]) < 10) then
			Std = "  "..Date["hour"] ..":"
			else
			Std = Date["hour"] ..":"
			end
end

function RemoveTime()
 UiRemoveElement(Ui.TimeBox)
 Ui.TimeBox = nil
 UiRemoveElement(Ui.TimeLabel)
 Ui.TimeLabel = nil
 UiRemoveElement(Ui.Sekunden)
 Ui.Sekunden = nil
 UiRemoveElement(Ui.Minuten)
 Ui.Minuten = nil
 UiRemoveElement(Ui.Stunden)
 Ui.Stunden = nil
end