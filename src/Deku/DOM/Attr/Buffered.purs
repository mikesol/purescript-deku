module Deku.DOM.Attr.Buffered where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Buffered = Buffered

instance Attr Audio_ Buffered  String  where
  attr Buffered value = unsafeAttribute (  
    { key: "buffered", value: prop' value  } <$ _)
instance Attr Audio_ Buffered (Event.Event  String ) where
  attr Buffered eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "buffered", value: prop' value }


instance Attr Video_ Buffered  String  where
  attr Buffered value = unsafeAttribute (  
    { key: "buffered", value: prop' value  } <$ _)
instance Attr Video_ Buffered (Event.Event  String ) where
  attr Buffered eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "buffered", value: prop' value }


instance Attr everything Buffered  Unit  where
  attr Buffered _ = unsafeAttribute (  
    { key: "buffered", value: unset'  } <$ _)
instance Attr everything Buffered (Event.Event  Unit ) where
  attr Buffered eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "buffered", value: unset' }
