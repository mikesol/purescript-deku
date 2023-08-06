module Deku.DOM.Attr.PrimitiveUnits where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PrimitiveUnits = PrimitiveUnits

instance Attr Filter_ PrimitiveUnits  String  where
  attr PrimitiveUnits value = unsafeAttribute $ Left $  
    { key: "primitiveUnits", value: prop' value }
instance Attr Filter_ PrimitiveUnits (Event.Event  String ) where
  attr PrimitiveUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "primitiveUnits", value: prop' value }


instance Attr everything PrimitiveUnits  Unit  where
  attr PrimitiveUnits _ = unsafeAttribute $ Left $  
    { key: "primitiveUnits", value: unset' }
instance Attr everything PrimitiveUnits (Event.Event  Unit ) where
  attr PrimitiveUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "primitiveUnits", value: unset' }
