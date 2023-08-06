module Deku.DOM.Attr.PatternContentUnits where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternContentUnits = PatternContentUnits

instance Attr Pattern_ PatternContentUnits  String  where
  attr PatternContentUnits value = unsafeAttribute $ Left $  
    { key: "patternContentUnits", value: prop' value }
instance Attr Pattern_ PatternContentUnits (Event.Event  String ) where
  attr PatternContentUnits eventValue = unsafeAttribute $ Right $
    eventValue <#> \value -> { key: "patternContentUnits", value: prop' value }


instance Attr everything PatternContentUnits  Unit  where
  attr PatternContentUnits _ = unsafeAttribute $ Left $  
    { key: "patternContentUnits", value: unset' }
instance Attr everything PatternContentUnits (Event.Event  Unit ) where
  attr PatternContentUnits eventValue = unsafeAttribute $ Right $
    eventValue <#> \_ -> { key: "patternContentUnits", value: unset' }
