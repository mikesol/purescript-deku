module Deku.DOM.Attr.Srcset where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Srcset = Srcset
instance Attr Img_ Srcset  String  where
  attr Srcset value = unsafeAttribute (  
    { key: "srcset", value: prop' value  } <$ _)
instance Attr Img_ Srcset (Event.Event Unit -> Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute (map (map (
    \value -> { key: "srcset", value: prop' value })) eventValue)
instance Attr Img_ Srcset (Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "srcset", value: prop' value }
instance Attr Source_ Srcset  String  where
  attr Srcset value = unsafeAttribute (  
    { key: "srcset", value: prop' value  } <$ _)
instance Attr Source_ Srcset (Event.Event Unit -> Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute (map (map (
    \value -> { key: "srcset", value: prop' value })) eventValue)
instance Attr Source_ Srcset (Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "srcset", value: prop' value }
instance Attr everything Srcset  Unit  where
  attr Srcset _ = unsafeAttribute (  { key: "srcset", value: unset'  } <$ _)
instance Attr everything Srcset (Event.Event Unit -> Event.Event  Unit ) where
  attr Srcset eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "srcset", value: unset' })) eventValue)
instance Attr everything Srcset (Event.Event  Unit ) where
  attr Srcset eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "srcset", value: unset' }