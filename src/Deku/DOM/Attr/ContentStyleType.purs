module Deku.DOM.Attr.ContentStyleType where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType String where
  attr ContentStyleType bothValues = unsafeAttribute $ Both
    { key: "contentStyleType", value: prop' (fst bothValues) }
    ( snd bothValues <#> \value ->
        { key: "contentStyleType", value: prop' value }
    )
  pureAttr ContentStyleType value = unsafeAttribute $ This
    { key: "contentStyleType", value: prop' value }
  unpureAttr ContentStyleType eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contentStyleType", value: prop' value }

instance Attr everything ContentStyleType Unit where
  attr ContentStyleType bothValues = unsafeAttribute $ Both
    { key: "contentStyleType", value: unset' }
    (snd bothValues <#> \_ -> { key: "contentStyleType", value: unset' })
  pureAttr ContentStyleType _ = unsafeAttribute $ This
    { key: "contentStyleType", value: unset' }
  unpureAttr ContentStyleType eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "contentStyleType", value: unset' }
