  local Funcs = {} do
    function Funcs:Toggle(Tab, Config)
      local Title = Config[1] or Config.Title
      local Desc = Config[2] or Config.Desc
      local Default = Config[3] or Config.Default
      local Callback = Config[4] or Config.Callback

      local Toggle = Tab:AddToggle(Title, Desc, Default)

      Toggle.OnToggle:Connect(Callback)

      return Toggle
    end

    function Funcs:Slider(Tab, Config)
      local Title = Config[1] or Config.Title
      local Desc = Config[2] or Config.Desc
      local Default = Config[3] or Config.Default
      local Min = Config[4] or Config.Min
      local Max = Config[5] or Config.Max
      local Callback = Config[6] or Config.Callback

      local Slider = Tab:AddSlider(Title, Desc, Default, Min, Max)

      Slider.ValueUpdated:Connect(Callback)

      return Slider
    end

    function Funcs:Textbox(Tab, Config)

      local Title = Config[1] or Config.Title
      local Desc = Config[2] or Config.Desc
      local Callback = Config[3] or Config.Callback

      local Textbox = Tab:AddTextBox(Title, Desc)
  
      Textbox.TextChanged:Connect(function()
        Callback(Textbox.Text)
      end)
  
      return Textbox
    end

    function Funcs:AddDropdown(Tab, Config)
      local Title = Config[1] or Config.Title
      local Desc = Config[2] or Config.Desc
      local Option = Config[3] or Config.Option
      local Callback = Config[4] or Config.Callback

      local Dropdown = Tab:AddComboBox(Title, Desc, Option)

      Dropdown.OnChanged:Connect(Callback)

      return Dropdown
    end

    function Funcs:AddButton(Tab, Config)
      local Title = Config[1] or Config.Title
      local Desc = Config[2] or Config.Desc
      local Callback = Config[3] or Config.Callback

      local Button = Tab:AddButton(Title, Desc, "Click")

      Button.OnClick:Connect(Callback)
  
      return Button
    end
  end

  return Funcs
