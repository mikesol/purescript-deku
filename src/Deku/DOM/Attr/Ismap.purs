module Deku.DOM.Attr.Ismap where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Ismap = Ismap
instance Attr Img_ Ismap  String  where
  attr Ismap value = unsafeAttribute (  
    { key: "ismap", value: prop' value  } <$ _)
instance Attr Img_ Ismap (Event.Event Unit -> Event.Event  String ) where
  attr Ismap eventValue = unsafeAttribute (map (map (
    \value -> { key: "ismap", value: prop' value })) eventValue)
instance Attr Img_ Ismap (Event.Event  String ) where
  attr Ismap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ismap", value: prop' value }
instance Attr everything Ismap  Unit  where
  attr Ismap _ = unsafeAttribute (  { key: "ismap", value: unset'  } <$ _)
instance Attr everything Ismap (Event.Event Unit -> Event.Event  Unit ) where
  attr Ismap eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "ismap", value: unset' })) eventValue)
instance Attr everything Ismap (Event.Event  Unit ) where
  attr Ismap eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "ismap", value: unset' }