Animal = class()

function Animal:init(x,y,name)
    self:log("init")
    -- you can accept and set parameters here
    self.x = x
    self.y = y
    self.name = name
end

function Animal:draw()
    -- Codea does not automatically call this method
end

function Animal:touched(touch)
    -- Codea does not automatically call this method
end

function Animal:feed()
    self:log(self.name..' says: "nom nom nom"')
end

function Animal:log(msg)
    print("[Animal] "..msg)
end


