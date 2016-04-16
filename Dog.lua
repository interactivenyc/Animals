Dog = class(Animal)

function Dog:draw()
    -- Codea does not automatically call this method
    sprite("Project:dog",self.x,self.y)
end

function Dog:touched(touch)
    -- Codea does not automatically call this method
end

function Dog:log(msg)
    print("[Dog] "..msg)
end
