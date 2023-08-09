module Deku.DOM.Attr.D where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data D = D
instance Attr Path_ D  String  where
  attr D value = unsafeAttribute (  { key: "d", value: prop' value  } <$ _)
instance Attr Path_ D (Event.Event Unit -> Event.Event  String ) where
  attr D eventValue = unsafeAttribute (map (map ( \value ->
    { key: "d", value: prop' value })) eventValue)
instance Attr Path_ D (Event.Event  String ) where
  attr D eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "d", value: prop' value }
instance Attr everything D  Unit  where
  attr D _ = unsafeAttribute (  { key: "d", value: unset'  } <$ _)
instance Attr everything D (Event.Event Unit -> Event.Event  Unit ) where
  attr D eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "d", value: unset' })) eventValue)
instance Attr everything D (Event.Event  Unit ) where
  attr D eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "d", value: unset' }