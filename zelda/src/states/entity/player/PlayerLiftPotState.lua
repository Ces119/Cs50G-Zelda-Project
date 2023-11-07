PlayerLiftPotState = Class{__includes = EntityIdleState}

function PlayerLiftPotState:init(player, dungeon)
    self.player = player 
    self.dungeon = dungeon 
    self.player.offsetY = 5 
    self.player.offsetX = 0 
    local direction = self.player.direction 
    self.pot = nil 

end 

function PlayerLiftPotState:enter(params)
    self.pot = params.pot 

    self.player:changeAnimation('pot-lift-' .. self.player.direction)

end 

function PlayerLiftPotState:update(dt)

    Timer.after(1, function() if love.keyboard.isDown('left') or love.keyboard.isDown('right') or 
        love.keyboard.isDown('up') or love.keyboard.isDown('down') then 
            self.player:changeState('walk-pot', {pot = self.pot})
        end 
    end)

    if self.player.currentAnimation.timesPlayed > 0 then 
        self.player.currentAnimation.timesPlayed = 0 
        self.player:changeState('idle-pot', {pot = self.pot})
    end 

end 

function PlayerLiftPotState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

end         

    
