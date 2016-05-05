import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Debug
import List exposing (..)

line_boxHeight = 400
line_boxWidth  = 500
line_dotSize   = 2

main : Element
main = collage line_boxWidth line_boxHeight line_forms

line_pointList = [
  ( -50.0,    10.0),
  ( 5.0,      15.0),
  ( 15.0,    -5.0),
  ( 35.0,     50.0),
  ( 50.0,    -20.0) ]

line_forms = append (line_xAxis :: line_yAxis :: line_circles line_pointList) (line_points line_pointList)

line_points : List (Float, Float) -> List Form
line_points list =
  case list of
    []                   -> []
    (x, y)::[]           -> []
    (x, y)::(x1, y1)::t  -> line_getLine (line_getLine (x, y) (x1, y1)) :: line_points ((x1,y1)::t)

line_circles : List (Float, Float) -> List Form
line_circles list =
  case list of
    []         -> []
    (x, y)::[] -> [line_makeCircle (x, y)]
    (x, y)::t  -> (line_makeCircle (x, y))::(line_circles t)

line_makeCircle (x, y) =
  circle line_dotSize
    |> filled black
    |> move (x, y)

line_xAxis : Form
line_xAxis =
  traced (dashed black) line_xAxisPath

line_xAxisPath : Path
line_xAxisPath =
  path [(0, -line_boxHeight), (0, line_boxHeight)]

line_yAxis : Form
line_yAxis =
  traced (dashed black) line_yAxisPath

line_yAxisPath : Path
line_yAxisPath =
  path [(-line_boxWidth, 0), (line_boxWidth, 0)]

line_linePath : (Float, Float) -> (Float, Float) -> Path
line_linePath (x, y) (x1, y1) =
  path [(x, y), (x1, y1)]

line_getLine : Path -> Form
line_getLine myPath = traced (solid black) myPath
