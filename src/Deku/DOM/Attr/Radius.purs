module Deku.DOM.Attr.Radius where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Radius = Radius

instance Attr FeMorphology_ Radius  String  where
  attr Radius value = unsafeAttribute $ Left $  
    { key: "radius", value: prop' value }
instance Attr FeMorphology_ Radius (Event.Event  String ) where
  attr Radius eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "radius", value: prop' value }


instance Attr everything Radius  Unit  where
  attr Radius _ = unsafeAttribute $ Left $  { key: "radius", value: unset' }
instance Attr everything Radius (Event.Event  Unit ) where
  attr Radius eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "radius", value: unset' }
