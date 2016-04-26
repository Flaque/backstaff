import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)

boxHeight = 100
boxWidth  = 300
rectWidth = 10

main : Element
main =
  collage boxWidth boxHeight
    [ myRect 0   0.1,
      myRect 20  0.5,
      myRect 40  0.3,
      myRect 60  0.6
    ]

getHeight max scale =
  max*scale

-- Gets the offset given a scal
getOffset scale min =
  (min/2)*(1 - scale)

-- Defines a rectangle given:
--  an offset from the left most point
--  a scale from 1.0 to 0.0
myRect offset scale =
  rect rectWidth (getHeight 100 scale)
    |> filled black
    |> move(offset-boxWidth/2 + rectWidth,
            -(getOffset boxHeight scale)-boxHeight/2)
