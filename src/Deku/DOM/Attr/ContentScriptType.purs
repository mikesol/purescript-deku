module Deku.DOM.Attr.ContentScriptType where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType  String  where
  attr ContentScriptType value = unsafeAttribute $ Left $  
    { key: "contentScriptType", value: prop' value }
instance Attr Svg_ ContentScriptType (Event.Event  String ) where
  attr ContentScriptType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "contentScriptType", value: prop' value }


instance Attr everything ContentScriptType  Unit  where
  attr ContentScriptType _ = unsafeAttribute $ Left $  
    { key: "contentScriptType", value: unset' }
instance Attr everything ContentScriptType (Event.Event  Unit ) where
  attr ContentScriptType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "contentScriptType", value: unset' }
