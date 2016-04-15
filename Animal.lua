Animal = class()

function Animal:init(x)
    log("init")
    -- you can accept and set parameters here
    self.x = x
end

function Animal:draw()
    -- Codea does not automatically call this method
end

function Animal:touched(touch)
    -- Codea does not automatically call this method
end

function Animal:eat()
    self:log("nom nom nom")
end

function Animal:log(msg)
    print("[Animal] "..msg)
end


