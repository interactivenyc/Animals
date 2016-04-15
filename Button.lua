Button = class()

-- [[ There are no classes in standard Lua however they are handy concepts so Codea includes a global function called class() which provides equivalent functionality. You can read more about Codea classes in the wiki ]]

function Button: init(displayName,x,y)

-- [[ The Init function gets called before setup(). This is where you define and initialise your class and its member variables. The class variables are fairly self explanatory but for completeness: displayName: Is the text displayed on your button. The button will scale up and down to fit the text. pos: Defines the x and y - coordinates of the button using a vector. size: Is a vector which contains the width and height of the button, which is set by the display name text, and is used to determine if a button has been hit.  action: Is the function that you want called when the button is tapped. color: Is the color of the button fill. ]]

    -- you can accept and set parameters here

    self.displayName = displayName
    
    self.pos = vec2(x,y)
    self.size = vec2(0,0)
    self.action = nil
    self.color = color(113, 66, 190, 255)

end

function Button:draw()

-- [[ Your main code needs to explicitly call this function to draw the button, it won't happen automatically. We will see how this works when we update the main() class. ]]

    -- Codea does not automatically call this method

    pushStyle()

-- [[ pushStyle() saves the current graphic styles like stroke, width, etc. You can then do your thing and call popStyle at the end to return to this state.]]

    fill(self.color)

-- [[ fill is used initially to set the colour of the button, then the font type and size is set. You could change this in your implementation of the button class if you wish. Click here to see the available fonts. ]]
    
    font("ArialRoundedMTBold")
    fontSize(22)
    
    -- use display name for size

    local w,h = textSize(self.displayName)
    w = w + 20
    h = h + 30
    
-- [[ As stated in the code, displayName is used to size the button and then we use the class we looked at in Tutorial 2 to draw a rounded rectangle. ]]

    self:roundRect(self.pos.x - w/2,
              self.pos.y - h/2,
              w,h,30)
            
    self.size = vec2(w,h)

-- [[ Note that class variables are designated using the self keyword. e.g. self.size. The next block of code sets the colour of the button text and its position on the button. ]]
            
    textMode(CENTER)
    fill(54, 65, 96, 255)
    text(self.displayName,self.pos.x+2,self.pos.y-2)
    fill(255, 255, 255, 255)
    text(self.displayName,self.pos.x,self.pos.y)
    
-- [[ Return the graphic style to what it was before you entered this function. This is considered polite behaviour for a function because it can be hard to track down if the style is being changed deep within some function and you don't want it to. ]]

    popStyle()

end

function Button:hit(p)

-- [[ This function works out if the last touch (after you lift your finger) was on this button, using the size and pos variables. Returns true if it was and false if it wasn't.  The local keyword defines a local variable. Unlike global variables, local variables have their scope limited to the block where they are declared. A block is the body of a control structure, the body of a function, or a chunk (the file or string with the code where the variable is declared). ]]

    local l = self.pos.x - self.size.x/2
    local r = self.pos.x + self.size.x/2
    local t = self.pos.y + self.size.y/2
    local b = self.pos.y - self.size.y/2

    if p.x > l and p.x < r and
       p.y > b and p.y < t then
        return true
    end
    
    return false
end

function Button:touched(touch)

    -- Codea does not automatically call this method

-- [[ As with the draw() function the touched function is also not called automatically by your code. If you don't call this then you won't know if someone has tapped your button. It reminds me of the old joke, "what do you call a boomerang that doesn't come back?" ..."A stick!" The test, if self.action checks whether you have defined a function to call when the button is tapped. If self.action is nil then nothing will happen.]]

    if touch.state == ENDED and
       self:hit(vec2(touch.x,touch.y)) then
        if self.action then
            self.action()
        end
    end
end

function Button:roundRect(x,y,w,h,r)

-- [[ pushStyle() saves the current graphic styles like stroke, width, etc. You can then do your thing and call popStyle at the end to return to this state.]]

    pushStyle()

-- [[ insetPos and insetSize contain the co-ordinates for the internal "fill" rectangle. InsetPos.x = x, insetPos.y = y, insetSize.x = w and insetSize.y = h. In effect this creates a rectangle that is smaller than a factor of "r" within the rectangle co-ordinates specified in roundRect. ]]
    
    insetPos = vec2(x+r,y+r)
    insetSize = vec2(w-2*r,h-2*r)
    
-- Copy fill into stroke

-- [[ Since Codea 1.3 you can retrieve the style information from all style functions by calling them without arguments. This way you only have to set the fill style once as you would for the normal rectangle function. You can read all about how this rounded rectangle function evolved on the Codea Forums.]]

    local red,green,blue,a = fill()
    stroke(red,green,blue,a)
    
-- [[noSmooth() will disable smooth (unaliased) line drawing. It is useful for drawing thin lines. This initial rectangle is used to fill in the centre of your rounded rectangle, it has the usual 90 degree corners. Four lines are then drawn around this to give the rounded corner look. You can see this yourself by commenting out the 4 lines drawn below. ]]

    noSmooth()
    rectMode(CORNER)
    rect(insetPos.x,insetPos.y,insetSize.x,insetSize.y)
    
    if r > 0 then

-- [[ You have to use smooth() if you want to use the ROUND option for lineCapMode. Four lines are now drawn around the filler rectangle. One on each edge. Because the lines have rounded ends when you overlap them it makes the corners look rounded, albeit a bit like a ball if you get the proportions wrong. Each of the lines are twice the width of the corner radius. ]]

        smooth()
        lineCapMode(ROUND)
        strokeWidth(r*2)

        line(insetPos.x, insetPos.y, 
             insetPos.x + insetSize.x, insetPos.y)
        line(insetPos.x, insetPos.y,
             insetPos.x, insetPos.y + insetSize.y)
        line(insetPos.x, insetPos.y + insetSize.y,
             insetPos.x + insetSize.x, insetPos.y + insetSize.y)
        line(insetPos.x + insetSize.x, insetPos.y,
             insetPos.x + insetSize.x, insetPos.y + insetSize.y)            
    end

    popStyle()

end
