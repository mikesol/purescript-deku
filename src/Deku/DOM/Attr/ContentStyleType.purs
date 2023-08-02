module Deku.DOM.Attr.ContentStyleType where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType (NonEmpty.NonEmpty Event.Event  String ) where
  attr ContentStyleType bothValues = unsafeAttribute $ Both
    { key: "contentStyleType", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contentStyleType", value: prop' value }
    )
instance Attr Svg_ ContentStyleType  String  where
  attr ContentStyleType value = unsafeAttribute $ This
    { key: "contentStyleType", value: prop' value }
instance Attr Svg_ ContentStyleType (Event.Event  String ) where
  attr ContentStyleType eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contentStyleType", value: prop' value }

instance Attr everything ContentStyleType (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ContentStyleType bothValues = unsafeAttribute $ Both
    { key: "contentStyleType", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "contentStyleType", value: unset' })
instance Attr everything ContentStyleType  Unit  where
  attr ContentStyleType _ = unsafeAttribute $ This
    { key: "contentStyleType", value: unset' }
instance Attr everything ContentStyleType (Event.Event  Unit ) where
  attr ContentStyleType eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "contentStyleType", value: unset' }
