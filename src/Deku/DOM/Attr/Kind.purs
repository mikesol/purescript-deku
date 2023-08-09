module Deku.DOM.Attr.Kind where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Kind = Kind
instance Attr Track_ Kind  String  where
  attr Kind value = unsafeAttribute (  
    { key: "kind", value: prop' value  } <$ _)
instance Attr Track_ Kind (Event.Event Unit -> Event.Event  String ) where
  attr Kind eventValue = unsafeAttribute (map (map ( \value ->
    { key: "kind", value: prop' value })) eventValue)
instance Attr Track_ Kind (Event.Event  String ) where
  attr Kind eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "kind", value: prop' value }
instance Attr everything Kind  Unit  where
  attr Kind _ = unsafeAttribute (  { key: "kind", value: unset'  } <$ _)
instance Attr everything Kind (Event.Event Unit -> Event.Event  Unit ) where
  attr Kind eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "kind", value: unset' })) eventValue)
instance Attr everything Kind (Event.Event  Unit ) where
  attr Kind eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "kind", value: unset' }