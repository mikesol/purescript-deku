module Deku.DOM.Attr.FilterUnits where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterUnits = FilterUnits

instance Attr Filter_ FilterUnits  String  where
  attr FilterUnits value = unsafeAttribute $ Left $  
    { key: "filterUnits", value: prop' value }
instance Attr Filter_ FilterUnits (Event.Event  String ) where
  attr FilterUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "filterUnits", value: prop' value }


instance Attr everything FilterUnits  Unit  where
  attr FilterUnits _ = unsafeAttribute $ Left $  
    { key: "filterUnits", value: unset' }
instance Attr everything FilterUnits (Event.Event  Unit ) where
  attr FilterUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "filterUnits", value: unset' }
