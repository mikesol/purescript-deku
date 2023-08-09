module Deku.DOM.Attr.RefY where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data RefY = RefY
instance Attr Marker_ RefY  String  where
  attr RefY value = unsafeAttribute (  
    { key: "refY", value: prop' value  } <$ _)
instance Attr Marker_ RefY (Event.Event Unit -> Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute (map (map ( \value ->
    { key: "refY", value: prop' value })) eventValue)
instance Attr Marker_ RefY (Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "refY", value: prop' value }
instance Attr Symbol_ RefY  String  where
  attr RefY value = unsafeAttribute (  
    { key: "refY", value: prop' value  } <$ _)
instance Attr Symbol_ RefY (Event.Event Unit -> Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute (map (map ( \value ->
    { key: "refY", value: prop' value })) eventValue)
instance Attr Symbol_ RefY (Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "refY", value: prop' value }
instance Attr everything RefY  Unit  where
  attr RefY _ = unsafeAttribute (  { key: "refY", value: unset'  } <$ _)
instance Attr everything RefY (Event.Event Unit -> Event.Event  Unit ) where
  attr RefY eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "refY", value: unset' })) eventValue)
instance Attr everything RefY (Event.Event  Unit ) where
  attr RefY eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "refY", value: unset' }