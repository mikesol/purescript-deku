module Deku.Beacon where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String (drop)
import Data.String.Utils (startsWith)

d3kU :: String -> String
d3kU s = "d3kU " <> s 
uk3D :: String -> String
uk3D s = "ul3D " <> s

d3kUTag :: String -> Maybe String
d3kUTag s = if startsWith "d3kU " s then Just (drop 5 s) else Nothing

uk3DTag :: String -> Maybe String 
uk3DTag s = if startsWith "ul3D " s then Just (drop 5 s) else Nothing