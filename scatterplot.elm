import Color exposing (..)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Debug

scatter_boxHeight = 400
scatter_boxWidth  = 500
scatter_dotSize   = 2

main : Element
main = collage boxWidth boxHeight forms

scatter_forms = xAxis :: yAxis :: fromPoints [
  (1.0,   20.0),
  (-20.0, 25.0),
  (20.0,  70.0),
  (8.0,   -50.0),
  (50.0,  -80.0) ]

scatter_fromPoints : List (Float, Float) -> List Form
scatter_fromPoints list =
  case list of
    []         -> []
    (x, y)::[] -> [scatter_makeCircle (x, y)]
    (x, y)::t  -> (scatter_makeCircle (x, y))::(scatter_fromPoints t)

scatter_makeCircle (x, y) =
  circle scatter_dotSize
    |> filled black
    |> move (x, y)

scatter_xAxis : Form
scatter_xAxis =
  traced (dashed black) scatter_xAxisPath

scatter_xAxisPath : Path
scatter_xAxisPath =
  path [(0, -scatter_boxHeight), (0, scatter_boxHeight)]


scatter_yAxis : Form
scatter_yAxis =
  traced (dashed black) scatter_yAxisPath

scatter_yAxisPath : Path
scatter_yAxisPath =
  path [(-scatter_boxWidth, 0), (scatter_boxWidth, 0)]
