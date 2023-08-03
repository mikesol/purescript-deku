module Deku.DOM.Attr.PatternContentUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternContentUnits = PatternContentUnits

instance Attr Pattern_ PatternContentUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr PatternContentUnits bothValues = unsafeAttribute $ Both
    { key: "patternContentUnits", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "patternContentUnits", value: prop' value }
    )
instance Attr Pattern_ PatternContentUnits  String  where
  attr PatternContentUnits value = unsafeAttribute $ This $ pure $
    { key: "patternContentUnits", value: prop' value }
instance Attr Pattern_ PatternContentUnits (Event.Event  String ) where
  attr PatternContentUnits eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "patternContentUnits", value: prop' value }

instance Attr everything PatternContentUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PatternContentUnits bothValues = unsafeAttribute $ Both
    { key: "patternContentUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternContentUnits", value: unset' })
instance Attr everything PatternContentUnits  Unit  where
  attr PatternContentUnits _ = unsafeAttribute $ This $ pure $
    { key: "patternContentUnits", value: unset' }
instance Attr everything PatternContentUnits (Event.Event  Unit ) where
  attr PatternContentUnits eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "patternContentUnits", value: unset' }
