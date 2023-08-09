module Deku.DOM.Attr.Loading where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Loading = Loading
instance Attr Img_ Loading  String  where
  attr Loading value = unsafeAttribute (  
    { key: "loading", value: prop' value  } <$ _)
instance Attr Img_ Loading (Event.Event Unit -> Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute (map (map (
    \value -> { key: "loading", value: prop' value })) eventValue)
instance Attr Img_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loading", value: prop' value }
instance Attr Iframe_ Loading  String  where
  attr Loading value = unsafeAttribute (  
    { key: "loading", value: prop' value  } <$ _)
instance Attr Iframe_ Loading (Event.Event Unit -> Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute (map (map (
    \value -> { key: "loading", value: prop' value })) eventValue)
instance Attr Iframe_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "loading", value: prop' value }
instance Attr everything Loading  Unit  where
  attr Loading _ = unsafeAttribute (  { key: "loading", value: unset'  } <$ _)
instance Attr everything Loading (Event.Event Unit -> Event.Event  Unit ) where
  attr Loading eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "loading", value: unset' })) eventValue)
instance Attr everything Loading (Event.Event  Unit ) where
  attr Loading eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "loading", value: unset' }