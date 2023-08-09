module Deku.DOM.Attr.Rel where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Rel = Rel
instance Attr A_ Rel  String  where
  attr Rel value = unsafeAttribute (  { key: "rel", value: prop' value  } <$ _)
instance Attr A_ Rel (Event.Event Unit -> Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute (map (map ( \value ->
    { key: "rel", value: prop' value })) eventValue)
instance Attr A_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "rel", value: prop' value }
instance Attr Area_ Rel  String  where
  attr Rel value = unsafeAttribute (  { key: "rel", value: prop' value  } <$ _)
instance Attr Area_ Rel (Event.Event Unit -> Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute (map (map ( \value ->
    { key: "rel", value: prop' value })) eventValue)
instance Attr Area_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "rel", value: prop' value }
instance Attr Link_ Rel  String  where
  attr Rel value = unsafeAttribute (  { key: "rel", value: prop' value  } <$ _)
instance Attr Link_ Rel (Event.Event Unit -> Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute (map (map ( \value ->
    { key: "rel", value: prop' value })) eventValue)
instance Attr Link_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "rel", value: prop' value }
instance Attr everything Rel  Unit  where
  attr Rel _ = unsafeAttribute (  { key: "rel", value: unset'  } <$ _)
instance Attr everything Rel (Event.Event Unit -> Event.Event  Unit ) where
  attr Rel eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "rel", value: unset' })) eventValue)
instance Attr everything Rel (Event.Event  Unit ) where
  attr Rel eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "rel", value: unset' }