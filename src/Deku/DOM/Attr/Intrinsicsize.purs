module Deku.DOM.Attr.Intrinsicsize where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize  String  where
  attr Intrinsicsize value = unsafeAttribute (  
    { key: "intrinsicsize", value: prop' value  } <$ _)
instance Attr Img_ Intrinsicsize (Event.Event  String ) where
  attr Intrinsicsize eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "intrinsicsize", value: prop' value }


instance Attr everything Intrinsicsize  Unit  where
  attr Intrinsicsize _ = unsafeAttribute (  
    { key: "intrinsicsize", value: unset'  } <$ _)
instance Attr everything Intrinsicsize (Event.Event  Unit ) where
  attr Intrinsicsize eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "intrinsicsize", value: unset' }
