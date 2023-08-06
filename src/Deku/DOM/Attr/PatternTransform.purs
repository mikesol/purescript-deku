module Deku.DOM.Attr.PatternTransform where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform  String  where
  attr PatternTransform value = unsafeAttribute $ Left $  
    { key: "patternTransform", value: prop' value }
instance Attr Pattern_ PatternTransform (Event.Event  String ) where
  attr PatternTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "patternTransform", value: prop' value }


instance Attr everything PatternTransform  Unit  where
  attr PatternTransform _ = unsafeAttribute $ Left $  
    { key: "patternTransform", value: unset' }
instance Attr everything PatternTransform (Event.Event  Unit ) where
  attr PatternTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "patternTransform", value: unset' }
