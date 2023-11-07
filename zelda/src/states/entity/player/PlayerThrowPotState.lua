PlayerThrowPotState = Class{__includes = BaseState}

function PlayerThrowPotState:init(player, dungeon)
    self.entity = player 
    self.dungeon = dungeon 
    self.entity.offsetY = 5
    self.entity.offsetX = 0 

    self.entity:changeAnimation('pot-lift-' .. self.entity.direction)

end 

function PlayerThrowPotState:enter(params)
    self.pot = params.pot 

    self.entity.currentAnimation:refresh()

    self.pot:Throw(self.entity.direction)

end     

function PlayerThrowPotState:update(dt)
    local direction = self.entity.direction

    for k, entity in pairs(self.dungeon.currentRoom.entities) do 
        if entity:collides(self.pot) and not entity.dead then 
            entity:damage(1)
            if math.random(2) == 1 then 
                entity.heartSpawn = true 
            end     
            gSounds['hit-enemy']:play()
            self.pot.state = 'brokenPot'
            self.pot.carriable = false 
            self.pot.moveSpeed = 0 
            Timer.after(1, function() self.pot.Remove = true  end)
        end 
        
    end 
    Timer.after(0.3, function() self.entity:changeState('idle') end )
    
end 

function PlayerThrowPotState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))

end 

