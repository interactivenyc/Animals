-- Animals 1

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
    animalBase = 200
    cat = Cat(100,animalBase,"fluffy")
    cat2 = Cat(300,animalBase,"kitty")
    dog = Dog(500,animalBase,"rex")
    button = Button("Feed Animals",120,50)
    button.action = function() feedAnimals() end
    
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)

    -- Do your drawing here
    cat:draw()
    cat2:draw()
    dog:draw()
    button:draw()
end

function touched(touch)
    button:touched(touch)
end

function feedAnimals()
    log("feedAnimals")
    cat:feed()
    cat2:feed()
    dog:feed()
end

function log(msg)
    print("[Main] "..msg)
end
