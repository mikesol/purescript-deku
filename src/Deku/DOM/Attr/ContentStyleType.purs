module Deku.DOM.Attr.ContentStyleType where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType  String  where
  attr ContentStyleType value = unsafeAttribute (  
    { key: "contentStyleType", value: prop' value  } <$ _)
instance Attr Svg_ ContentStyleType (Event.Event  String ) where
  attr ContentStyleType eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "contentStyleType", value: prop' value }


instance Attr everything ContentStyleType  Unit  where
  attr ContentStyleType _ = unsafeAttribute (  
    { key: "contentStyleType", value: unset'  } <$ _)
instance Attr everything ContentStyleType (Event.Event  Unit ) where
  attr ContentStyleType eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "contentStyleType", value: unset' }
