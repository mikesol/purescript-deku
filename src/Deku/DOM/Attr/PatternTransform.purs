module Deku.DOM.Attr.PatternTransform where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform (NonEmpty.NonEmpty Event.Event  String ) where
  attr PatternTransform bothValues = unsafeAttribute $ Both
    { key: "patternTransform", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "patternTransform", value: prop' value }
    )
instance Attr Pattern_ PatternTransform  String  where
  attr PatternTransform value = unsafeAttribute $ This $ pure $
    { key: "patternTransform", value: prop' value }
instance Attr Pattern_ PatternTransform (Event.Event  String ) where
  attr PatternTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "patternTransform", value: prop' value }

instance Attr everything PatternTransform (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PatternTransform bothValues = unsafeAttribute $ Both
    { key: "patternTransform", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternTransform", value: unset' })
instance Attr everything PatternTransform  Unit  where
  attr PatternTransform _ = unsafeAttribute $ This $ pure $
    { key: "patternTransform", value: unset' }
instance Attr everything PatternTransform (Event.Event  Unit ) where
  attr PatternTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "patternTransform", value: unset' }
