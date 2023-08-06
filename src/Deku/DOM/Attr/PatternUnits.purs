module Deku.DOM.Attr.PatternUnits where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternUnits = PatternUnits

instance Attr Pattern_ PatternUnits  String  where
  attr PatternUnits value = unsafeAttribute $ Left $  
    { key: "patternUnits", value: prop' value }
instance Attr Pattern_ PatternUnits (Event.Event  String ) where
  attr PatternUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "patternUnits", value: prop' value }


instance Attr everything PatternUnits  Unit  where
  attr PatternUnits _ = unsafeAttribute $ Left $  
    { key: "patternUnits", value: unset' }
instance Attr everything PatternUnits (Event.Event  Unit ) where
  attr PatternUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "patternUnits", value: unset' }
