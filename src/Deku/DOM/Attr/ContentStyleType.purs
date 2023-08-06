module Deku.DOM.Attr.ContentStyleType where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType  String  where
  attr ContentStyleType value = unsafeAttribute $ Left $  
    { key: "contentStyleType", value: prop' value }
instance Attr Svg_ ContentStyleType (Event.Event  String ) where
  attr ContentStyleType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "contentStyleType", value: prop' value }


instance Attr everything ContentStyleType  Unit  where
  attr ContentStyleType _ = unsafeAttribute $ Left $  
    { key: "contentStyleType", value: unset' }
instance Attr everything ContentStyleType (Event.Event  Unit ) where
  attr ContentStyleType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "contentStyleType", value: unset' }
