Cat = class(Animal)

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
