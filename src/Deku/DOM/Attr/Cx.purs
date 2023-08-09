module Deku.DOM.Attr.Cx where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Cx = Cx
instance Attr Circle_ Cx  String  where
  attr Cx value = unsafeAttribute (  { key: "cx", value: prop' value  } <$ _)
instance Attr Circle_ Cx (Event.Event Unit -> Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute (map (map ( \value ->
    { key: "cx", value: prop' value })) eventValue)
instance Attr Circle_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cx", value: prop' value }
instance Attr Ellipse_ Cx  String  where
  attr Cx value = unsafeAttribute (  { key: "cx", value: prop' value  } <$ _)
instance Attr Ellipse_ Cx (Event.Event Unit -> Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute (map (map ( \value ->
    { key: "cx", value: prop' value })) eventValue)
instance Attr Ellipse_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cx", value: prop' value }
instance Attr RadialGradient_ Cx  String  where
  attr Cx value = unsafeAttribute (  { key: "cx", value: prop' value  } <$ _)
instance Attr RadialGradient_ Cx (Event.Event Unit -> Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute (map (map ( \value ->
    { key: "cx", value: prop' value })) eventValue)
instance Attr RadialGradient_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cx", value: prop' value }
instance Attr everything Cx  Unit  where
  attr Cx _ = unsafeAttribute (  { key: "cx", value: unset'  } <$ _)
instance Attr everything Cx (Event.Event Unit -> Event.Event  Unit ) where
  attr Cx eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "cx", value: unset' })) eventValue)
instance Attr everything Cx (Event.Event  Unit ) where
  attr Cx eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "cx", value: unset' }