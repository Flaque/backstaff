import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Debug

boxHeight = 400
boxWidth  = 500
dotSize   = 2

main : Element
main = collage boxWidth boxHeight forms

forms = xAxis :: yAxis :: fromPoints [
  (1.0,   20.0),
  (-20.0, 25.0),
  (20.0,  70.0),
  (8.0,   -50.0),
  (50.0,  -80.0) ]

fromPoints : List (Float, Float) -> List Form
fromPoints list =
  case list of
    []         -> []
    (x, y)::[] -> [makeCircle (x, y)]
    (x, y)::t  -> (makeCircle (x, y))::(fromPoints t)

makeCircle (x, y) =
  circle dotSize
    |> filled black
    |> move (x, y)

xAxis : Form
xAxis =
  traced (dashed black) xAxisPath

xAxisPath : Path
xAxisPath =
  path [(0, -boxHeight), (0, boxHeight)]


yAxis : Form
yAxis =
  traced (dashed black) yAxisPath

yAxisPath : Path
yAxisPath =
  path [(-boxWidth, 0), (boxWidth, 0)]
