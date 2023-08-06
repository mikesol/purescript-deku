module Deku.DOM.Attr.ClipPathUnits where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ClipPathUnits = ClipPathUnits

instance Attr ClipPath_ ClipPathUnits  String  where
  attr ClipPathUnits value = unsafeAttribute $ Left $  
    { key: "clipPathUnits", value: prop' value }
instance Attr ClipPath_ ClipPathUnits (Event.Event  String ) where
  attr ClipPathUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "clipPathUnits", value: prop' value }


instance Attr everything ClipPathUnits  Unit  where
  attr ClipPathUnits _ = unsafeAttribute $ Left $  
    { key: "clipPathUnits", value: unset' }
instance Attr everything ClipPathUnits (Event.Event  Unit ) where
  attr ClipPathUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "clipPathUnits", value: unset' }
