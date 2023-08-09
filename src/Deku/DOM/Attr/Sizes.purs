module Deku.DOM.Attr.Sizes where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Sizes = Sizes
instance Attr Link_ Sizes  String  where
  attr Sizes value = unsafeAttribute (  
    { key: "sizes", value: prop' value  } <$ _)
instance Attr Link_ Sizes (Event.Event Unit -> Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute (map (map (
    \value -> { key: "sizes", value: prop' value })) eventValue)
instance Attr Link_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "sizes", value: prop' value }
instance Attr Img_ Sizes  String  where
  attr Sizes value = unsafeAttribute (  
    { key: "sizes", value: prop' value  } <$ _)
instance Attr Img_ Sizes (Event.Event Unit -> Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute (map (map (
    \value -> { key: "sizes", value: prop' value })) eventValue)
instance Attr Img_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "sizes", value: prop' value }
instance Attr Source_ Sizes  String  where
  attr Sizes value = unsafeAttribute (  
    { key: "sizes", value: prop' value  } <$ _)
instance Attr Source_ Sizes (Event.Event Unit -> Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute (map (map (
    \value -> { key: "sizes", value: prop' value })) eventValue)
instance Attr Source_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "sizes", value: prop' value }
instance Attr everything Sizes  Unit  where
  attr Sizes _ = unsafeAttribute (  { key: "sizes", value: unset'  } <$ _)
instance Attr everything Sizes (Event.Event Unit -> Event.Event  Unit ) where
  attr Sizes eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "sizes", value: unset' })) eventValue)
instance Attr everything Sizes (Event.Event  Unit ) where
  attr Sizes eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "sizes", value: unset' }