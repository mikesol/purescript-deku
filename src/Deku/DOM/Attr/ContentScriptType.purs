module Deku.DOM.Attr.ContentScriptType where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType (NonEmpty.NonEmpty Event.Event  String ) where
  attr ContentScriptType bothValues = unsafeAttribute $ Both
    { key: "contentScriptType", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "contentScriptType", value: prop' value }
    )
instance Attr Svg_ ContentScriptType  String  where
  attr ContentScriptType value = unsafeAttribute $ This $ pure $
    { key: "contentScriptType", value: prop' value }
instance Attr Svg_ ContentScriptType (Event.Event  String ) where
  attr ContentScriptType eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "contentScriptType", value: prop' value }

instance Attr everything ContentScriptType (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ContentScriptType bothValues = unsafeAttribute $ Both
    { key: "contentScriptType", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "contentScriptType", value: unset' })
instance Attr everything ContentScriptType  Unit  where
  attr ContentScriptType _ = unsafeAttribute $ This $ pure $
    { key: "contentScriptType", value: unset' }
instance Attr everything ContentScriptType (Event.Event  Unit ) where
  attr ContentScriptType eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "contentScriptType", value: unset' }
