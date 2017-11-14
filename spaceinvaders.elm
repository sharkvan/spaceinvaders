import Element exposing (..)
import Html
import Html.App

type alias Ship = 
    { position : Float
    , velocity : Float
    , shooting : Bool
    }

type alias Keys = { x : Int, y : Int }

initShip : Ship
initShip = 
    { position = 0
    , velocity = 0
    , shooting = False
    }

applyPhysics : Float -> Ship -> Ship
applyPhysics dt ship = 
    { ship | position = ship.position + ship.velocity * dt } 

updateVelocity : Float -> Ship -> Ship
updateVelocity newVelocity ship = 
    { ship | velocity = newVelocity }

updateShooting : Bool -> Ship -> Ship
updateShooting isShooting ship = 
    { ship | shooting = isShooting }

update : Float -> Keys -> Ship -> Ship
update dt keys ship = 
    let newVel          = toFloat keys.x
        isShooting      = keys.y > 0
    in  updateVelocity newVel (updateShooting isShooting (applyPhysics dt ship))



main = Html.div [] 
    [ Html.text "Posistion:"
    , Html.text (toString initShip.position)
    ]


