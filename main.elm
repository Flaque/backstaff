import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Debug

boxHeight = 400
boxWidth  = 500
rectWidth = 10

main : Element
main =
  collage boxWidth boxHeight
    [ myRect 0   0.1,
      myRect 20  0.5,
      myRect 40  0.3,
      myRect 60  0.6,
      myRect 80  0.3,
      myRect 120 1,
      myRect 100 1.0
    ]


getHeight max scale =
  max*scale

-- Gets the offset given a scale
getOffset scale containerHeight =
  Debug.log "offset" ((containerHeight*2)*(1-scale))

-- Defines a rectangle given:
--  an offset from the left most point
--  a scale from 1.0 to 0.0
myRect offset scale =
  rect rectWidth (getHeight boxHeight scale)
    |> filled blue
    |> move(offset-boxWidth/2 + rectWidth,
            -(getOffset scale 100))
