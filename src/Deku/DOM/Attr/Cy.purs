module Deku.DOM.Attr.Cy where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Cy = Cy
instance Attr Circle_ Cy  String  where
  attr Cy value = unsafeAttribute (  { key: "cy", value: prop' value  } <$ _)
instance Attr Circle_ Cy (Event.Event Unit -> Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute (map (map ( \value ->
    { key: "cy", value: prop' value })) eventValue)
instance Attr Circle_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cy", value: prop' value }
instance Attr Ellipse_ Cy  String  where
  attr Cy value = unsafeAttribute (  { key: "cy", value: prop' value  } <$ _)
instance Attr Ellipse_ Cy (Event.Event Unit -> Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute (map (map ( \value ->
    { key: "cy", value: prop' value })) eventValue)
instance Attr Ellipse_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cy", value: prop' value }
instance Attr RadialGradient_ Cy  String  where
  attr Cy value = unsafeAttribute (  { key: "cy", value: prop' value  } <$ _)
instance Attr RadialGradient_ Cy (Event.Event Unit -> Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute (map (map ( \value ->
    { key: "cy", value: prop' value })) eventValue)
instance Attr RadialGradient_ Cy (Event.Event  String ) where
  attr Cy eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cy", value: prop' value }
instance Attr everything Cy  Unit  where
  attr Cy _ = unsafeAttribute (  { key: "cy", value: unset'  } <$ _)
instance Attr everything Cy (Event.Event Unit -> Event.Event  Unit ) where
  attr Cy eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "cy", value: unset' })) eventValue)
instance Attr everything Cy (Event.Event  Unit ) where
  attr Cy eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "cy", value: unset' }