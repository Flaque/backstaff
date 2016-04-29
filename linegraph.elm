import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Debug
import List exposing (..)

boxHeight = 400
boxWidth  = 500
dotSize   = 2

main : Element
main = collage boxWidth boxHeight forms

pointList = [
  ( -50.0,    10.0),
  ( 5.0,      15.0),
  ( 15.0,    -5.0),
  ( 35.0,     50.0),
  ( 50.0,    -20.0) ]

forms = append (xAxis :: yAxis :: circles pointList) (points pointList)

points : List (Float, Float) -> List Form
points list =
  case list of
    []                   -> []
    (x, y)::[]           -> []
    (x, y)::(x1, y1)::t  -> getLine (linePath (x, y) (x1, y1)) :: points ((x1,y1)::t)

circles : List (Float, Float) -> List Form
circles list =
  case list of
    []         -> []
    (x, y)::[] -> [makeCircle (x, y)]
    (x, y)::t  -> (makeCircle (x, y))::(circles t)

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

linePath : (Float, Float) -> (Float, Float) -> Path
linePath (x, y) (x1, y1) =
  path [(x, y), (x1, y1)]

getLine : Path -> Form
getLine myPath = traced (solid black) myPath
