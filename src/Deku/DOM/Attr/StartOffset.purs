module Deku.DOM.Attr.StartOffset where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data StartOffset = StartOffset
instance Attr TextPath_ StartOffset  String  where
  attr StartOffset value = unsafeAttribute (  
    { key: "startOffset", value: prop' value  } <$ _)
instance Attr TextPath_ StartOffset (Event.Event Unit -> Event.Event  String ) where
  attr StartOffset eventValue = unsafeAttribute (map (map (
    \value -> { key: "startOffset", value: prop' value })) eventValue)
instance Attr TextPath_ StartOffset (Event.Event  String ) where
  attr StartOffset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "startOffset", value: prop' value }
instance Attr everything StartOffset  Unit  where
  attr StartOffset _ = unsafeAttribute (  
    { key: "startOffset", value: unset'  } <$ _)
instance Attr everything StartOffset (Event.Event Unit -> Event.Event  Unit ) where
  attr StartOffset eventValue = unsafeAttribute (map (map (
    \_ -> { key: "startOffset", value: unset' })) eventValue)
instance Attr everything StartOffset (Event.Event  Unit ) where
  attr StartOffset eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "startOffset", value: unset' }