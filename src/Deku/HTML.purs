module Deku.HTML where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Deku.Graph.Attribute (AttributeValue)

data HTML
  = E String (Array { key :: String, value :: AttributeValue }) (Array HTML)
  | T String

derive instance genericHTML :: Generic HTML _
derive instance eqHTML :: Eq HTML
derive instance ordHTML :: Ord HTML

instance showHTML :: Show HTML where
  show s = genericShow s
