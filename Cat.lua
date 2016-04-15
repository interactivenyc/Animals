Cat = class(Animal)

function Cat:init(x,y)
    self:log("init")
    -- you can accept and set parameters here
    self.x = x
    self.y = y
end

function Cat:draw()
    -- Codea does not automatically call this method
    sprite("Project:cat",self.x,self.y)
end

function Cat:touched(touch)
    -- Codea does not automatically call this method
end

function Cat:log(msg)
    print("[Cat] "..msg)
end
