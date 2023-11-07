--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        collidable = true, 
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        collidable = false,
        carriable = false,
        consumable = true,
        defaultState = 'oneHeart',
        states = {
            ['oneHeart'] = {
                frame = 5
            }
        }        
    },    

    ['pot'] = {
        -- TODO
        type = 'pot',
        texture = 'tiles',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        collidable = true,
        consumable = false,
        defaultState = 'solidPot',
        carriable = true, 
        firable = true,
        fired = false, 
        states = {
            ['solidPot'] = {
                frame = 14
            },
            ['brokenPot'] = {
                frame = 52
            }
        }
    }
}