module Deku.DOM.Attr.Coords where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Coords = Coords

instance Attr Area_ Coords  String  where
  attr Coords value = unsafeAttribute $ Left $  
    { key: "coords", value: prop' value }
instance Attr Area_ Coords (Event.Event  String ) where
  attr Coords eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "coords", value: prop' value }


instance Attr everything Coords  Unit  where
  attr Coords _ = unsafeAttribute $ Left $  { key: "coords", value: unset' }
instance Attr everything Coords (Event.Event  Unit ) where
  attr Coords eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "coords", value: unset' }
