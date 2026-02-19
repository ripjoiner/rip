                                                                                 local Players=game:   
                                                                        GetService("Players");local RunService=game:    
                                                                    GetService("RunService");local UserInputService=game:         
                                                                GetService("UserInputService");local TeleportService=game:GetService(   
                                                            "TeleportService");local player=Players.LocalPlayer;local placeId=game.       
                                                          PlaceId;local DARK=Color3.fromRGB(18,18,22);local PANEL=Color3.fromRGB(28,28,35); 
                                                        local BUTTON=Color3.fromRGB(35,35,45);local function getRainbowColor(t) local r=math. 
                                                      floor(((math.sin(t * 2 ) + 1)/2) * 255 );local g=math.floor(((math.sin((t * 2) + 2 ) + 1) 
                                                    /2) * 255 );local b=math.floor(((math.sin((t * 2) + 4 ) + 1)/2) * 255 );return Color3.fromRGB 
                                                  (r,g,b);end local guiBar=Instance.new("ScreenGui");guiBar.Name="GoblinNotifierBar";guiBar.        
                                                  ResetOnSpawn=false;guiBar.Parent=player:WaitForChild("PlayerGui");local bar=Instance.new("Frame");  
                                                bar.Size=UDim2.new(0,400,0,60);bar.Position=UDim2.new(0.5, -200,0.1,0);bar.BackgroundColor3=PANEL;bar.  
                                                BorderSizePixel=0;bar.Active=true;bar.Parent=guiBar;Instance.new("UICorner",bar).CornerRadius=UDim.new(0, 
                                              8);local titleBar=Instance.new("TextLabel");titleBar.Size=UDim2.new(1,0,0,30);titleBar.BackgroundTransparency 
                                              =1;titleBar.Text="RIP Joiner | discord.gg/dKNvWtHDEQ";titleBar.Font=Enum.Font.GothamBold;titleBar.TextSize=16 
                                            ;titleBar.TextXAlignment=Enum.TextXAlignment.Center;titleBar.Parent=bar;local stats=Instance.new("TextLabel");    
                                            stats.Size=UDim2.new(1,0,0,20);stats.Position=UDim2.new(0,0,0,35);stats.BackgroundTransparency=1;stats.Text=        
                                          "FPS: 0 | Ping: 0ms";stats.Font=Enum.Font.Gotham;stats.TextSize=14;stats.TextXAlignment=Enum.TextXAlignment.Center;     
                                          stats.Parent=bar;local dragging,dragInput,dragStart,startPos;bar.InputBegan:Connect(function(input) if (input.            
                                          UserInputType==Enum.UserInputType.MouseButton1) then dragging=true;dragStart=input.Position;startPos=bar.Position;input.    
                                          Changed:Connect(function() if (input.UserInputState==Enum.UserInputState.End) then dragging=false;end end);end end);bar.    
                                        InputChanged:Connect(function(input) if (input.UserInputType==Enum.UserInputType.MouseMovement) then dragInput=input;end end);  
                                        UserInputService.InputChanged:Connect(function(input) if (dragging    --[[==============================]]and (input==dragInput)) 
                                         then local delta=input.Position-dragStart ;bar.Position=   --[[============================================]]UDim2.new(startPos. 
                                        X.Scale,startPos.X.Offset + delta.X ,startPos.Y.Scale,  --[[======================================================]]startPos.Y.     
                                      Offset + delta.Y );end end);local fpsHistory={};local --[[==========================================================]] time=0;          
                                      RunService.RenderStepped:Connect(function(dt) dt=   --[[==============================================================]]math.clamp(dt,  
                                      0.001,1);table.insert(fpsHistory,1/dt );if ( #      --[[================================================================]]fpsHistory>10)  
                                      then table.remove(fpsHistory,1);end time+=dt local  --[[==================================================================]]sum=0;for _,v 
                                       in pairs(fpsHistory) do sum+=v end local avgFPS=   --[[==================================================================]]math.floor(sum/   
                                     #fpsHistory );local ping=math.floor(math.max(0,      --[[====================================================================]]player:       
                    GetNetworkPing() * 1000 ));stats.Text=string.format(                  --[[====================================================================]]                
              "FPS: %d | Ping: %dms",avgFPS,ping);local rainbow=getRainbowColor(time);    --[[======================================================================]]titleBar.     
            TextColor3=rainbow;stats.TextColor3=rainbow;end);local gui=Instance.new(      --[[======================================================================]]"ScreenGui"); 
          gui.Name="GoblinNotifier";gui.ResetOnSpawn=false;gui.Parent=player:WaitForChild --[[======================================================================]]("PlayerGui") 
        ;local main=Instance.new("Frame");main.Size=UDim2.new(0,360,0,500);main.Position= --[[======================================================================]]UDim2.new(0.5 
        , -180,0.5, -250);main.BackgroundColor3=DARK;main.Active=true;main.Draggable=true --[[======================================================================]];main.Parent= 
      gui;Instance.new("UICorner",main).CornerRadius=UDim.new(0,12);local stroke=Instance --[[======================================================================]].new(         
      "UIStroke");stroke.Thickness=3;stroke.Parent=main;local sidebar=Instance.new("Frame") --[[==================================================================]];sidebar.Size=  
      UDim2.new(0,60,1,0);sidebar.BackgroundColor3=PANEL;sidebar.Parent=main;Instance.new(  --[[================================================================]]"UICorner",       
    sidebar).CornerRadius=UDim.new(0,12);local layout=Instance.new("UIListLayout");layout.  --[[==============================================================]]Padding=UDim.new( 
    0,15);layout.HorizontalAlignment=Enum.HorizontalAlignment.Center;layout.VerticalAlignment --[[==========================================================]]=Enum.              
    VerticalAlignment.Top;layout.Parent=sidebar;local content=Instance.new("Frame");content.    --[[====================================================]]Size=UDim2.new(1, -60,1 
    ,0);content.Position=UDim2.new(0,60,0,0);content.BackgroundTransparency=1;content.Parent=main --[[==============================================]];local profileTab=        
    Instance.new("Frame");profileTab.Size=UDim2.new(1,0,1,0);profileTab.BackgroundTransparency=1;     --[[====================================]]profileTab.Parent=content;    
    local scriptTab=Instance.new("Frame");scriptTab.Size=UDim2.new(1,0,1,0);scriptTab.                    --[[========================]]BackgroundTransparency=1;scriptTab.   
    Visible=false;scriptTab.Parent=content;local function createTabButton(iconId) local btn=Instance.new("ImageButton");btn.Size=UDim2.new(0,45,0,45);btn.BackgroundColor3= 
  BUTTON;btn.BorderSizePixel=0;btn.Image=iconId;btn.ScaleType=Enum.ScaleType.Fit;btn.Parent=sidebar;Instance.new("UICorner",btn).CornerRadius=UDim.new(1,0);return btn;   
  end local PROFILE_ICON="rbxassetid://5374131798";local SCRIPT_ICON="rbxassetid://5995381615";local profileButton=createTabButton(PROFILE_ICON);local scriptButton=    
  createTabButton(SCRIPT_ICON);local function switchTab(tab) profileTab.Visible=tab=="Profile" ;scriptTab.Visible=tab=="Script" ;end profileButton.MouseButton1Click:     
  Connect(function() switchTab("Profile");end);scriptButton.MouseButton1Click:Connect(function() switchTab("Script");end);switchTab("Profile");local title=Instance.new(  
  "TextLabel");title.Size=UDim2.new(1,0,0,50);title.BackgroundTransparency=1;title.Text="RIP Joiner    ";title.Font=Enum.Font.GothamBold;title.TextSize=18;title.         
  TextColor3=Color3.new(1,1,1);title.Parent=profileTab;local status=Instance.new("TextLabel");status.Size=UDim2.new(1, -20,0,20);status.Position=UDim2.new(0,10,0,50);    
  status.BackgroundTransparency=1;status.Text="Ready";status.Font=Enum.Font.Gotham;status.TextSize=12;status.TextXAlignment=Enum.TextXAlignment.Left;status.Parent=       
  profileTab;local function createSection(text,y) local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(1, -20,0,25);lbl.Position=UDim2.new(0,10,0,y);lbl.               
  BackgroundTransparency=1;lbl.Text=text;lbl.Font=Enum.Font.GothamSemibold;lbl.TextSize=14;lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Parent=profileTab;return lbl;  
  end local function createButton(text,y) local btn=Instance.new("TextButton");btn.Size=UDim2.new(1, -20,0,40);btn.Position=UDim2.new(0,10,0,y);btn.BackgroundColor3=     
  BUTTON;btn.Text=text;btn.Font=Enum.Font.GothamSemibold;btn.TextSize=14;btn.TextColor3=Color3.new(1,1,1);btn.Parent=profileTab;Instance.new("UICorner",btn).CornerRadius 
  =UDim.new(0,8);return btn;end local y=80;local autoSec=createSection("AUTO JOIN",y);y+=25 local autoBtn=createButton("Auto Join: OFF",y);y+=50 local actSec=createSection 
  ("ACTIONS",y);y+=25 local clearBtn=createButton("Clear Teleport Queue",y);y+=45 local rejoinBtn=createButton("Rejoin Server",y);y+=45 local randomBtn=createButton(       
  "Join Random Server",y);y+=50 local manSec=createSection("MANUAL JOIN",y);y+=25 local jobBox=Instance.new("TextBox");jobBox.Size=UDim2.new(1, -100,0,40);jobBox.Position= 
  UDim2.new(0,10,0,y);jobBox.PlaceholderText="Enter Job ID...";jobBox.BackgroundColor3=PANEL;jobBox.TextColor3=Color3.new(1,1,1);jobBox.Font=Enum.Font.Gotham;jobBox.       
  TextSize=14;jobBox.ClearTextOnFocus=false;jobBox.Parent=profileTab;Instance.new("UICorner",jobBox).CornerRadius=UDim.new(0,8);local joinBtn=Instance.new("TextButton");   
  joinBtn.Size=UDim2.new(0,70,0,40);joinBtn.Position=UDim2.new(1, -80,0,y);joinBtn.Text="JOIN";joinBtn.Font=Enum.Font.GothamBold;joinBtn.TextSize=14;joinBtn.TextColor3=    
  Color3.new(0,0,0);joinBtn.Parent=profileTab;Instance.new("UICorner",joinBtn).CornerRadius=UDim.new(0,8);autoBtn.MouseButton1Click:Connect(function() autoBtn.Text=(       
  autoBtn.Text:find("OFF") and "Auto Join: ON") or "Auto Join: OFF" ;end);clearBtn.MouseButton1Click:Connect(function() status.Text="Teleport Queue Cleared";end);rejoinBtn 
  .MouseButton1Click:Connect(function() status.Text="Rejoining Server...";TeleportService:Teleport(placeId,player);end);local HttpService=game:GetService("HttpService");   
  randomBtn.MouseButton1Click:Connect(function() status.Text="Finding Random Server...";spawn(function() local success,servers=pcall(function() local url=                  
  "https://games.roproxy.com/"   .. placeId   .. "/servers/Public?sortOrder=Desc&limit=100" ;return HttpService:JSONDecode(game:HttpGet(url));end);if (success and servers  
  and servers.data) then for _,server in ipairs(servers.data) do if ((server.id~=game.JobId) and (server.playing<server.maxPlayers)) then status.Text=                      
  "Teleporting to new server...";TeleportService:TeleportToPlaceInstance(placeId,server.id,player);return;end end status.Text="No available servers found!";else status.    
  Text="Failed to fetch server list!";end end);end);joinBtn.MouseButton1Click:Connect(function() if (jobBox.Text~="") then status.Text="Teleporting...";TeleportService:  
  TeleportToPlaceInstance(placeId,jobBox.Text,player);end end);RunService.RenderStepped:Connect(function(dt) local rainbow=getRainbowColor(time);status.TextColor3=       
  rainbow;autoSec.TextColor3=rainbow;actSec.TextColor3=rainbow;manSec.TextColor3=rainbow;autoBtn.BackgroundColor3=rainbow;clearBtn.BackgroundColor3=rainbow;rejoinBtn.    
    BackgroundColor3=rainbow;randomBtn.BackgroundColor3=rainbow;joinBtn.BackgroundColor3=rainbow;if profileTab.Visible then profileButton.BackgroundColor3=rainbow;else   
    scriptButton.BackgroundColor3=rainbow;end stroke.Color=rainbow;end);local UIS=game:GetService("UserInputService");local uiVisible=true;local function toggleUI()      
    uiVisible= not uiVisible;main.Visible=uiVisible;end UIS.InputBegan:Connect(function(input,processed) if ( not processed and (input.UserInputType==Enum.UserInputType. 
    Keyboard)) then if (input.KeyCode==Enum.KeyCode.LeftControl) then toggleUI();end end end);local toggleBtn=Instance.new("TextButton");toggleBtn.Size=UDim2.new(0,45,0, 
      45);toggleBtn.Position=UDim2.new(0,0,1, -60);toggleBtn.BackgroundColor3=BUTTON;toggleBtn.Text="⇔";toggleBtn.Font=Enum.Font.GothamBold;toggleBtn.TextSize=20;      
      toggleBtn.TextColor3=Color3.new(1,1,1);toggleBtn.Parent=sidebar;Instance.new("UICorner",toggleBtn).CornerRadius=UDim.new(1,0);toggleBtn.MouseButton1Click:Connect 
      (toggleUI);local Players=game:GetService("Players");local TeleportService=game:GetService("TeleportService");local HttpService=game:GetService("HttpService");    
        local player=Players.LocalPlayer;local placeId=game.PlaceId;local mainScript=[[
-- PASTE YOUR FULL UI SCRIPT HERE
]];local function injectUI() loadstring(      
        mainScript)();end injectUI();player.OnTeleport:Connect(function(state) if (state==Enum.TeleportState.Started) then _G.ShouldInject=true;end end);spawn(function 
        () while wait(0.5) do if _G.ShouldInject then injectUI();_G.ShouldInject=nil;break;end end end);