module Deku.DOM.Attr.Rotate where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Rotate = Rotate
instance Attr AnimateMotion_ Rotate  String  where
  attr Rotate value = unsafeAttribute (  
    { key: "rotate", value: prop' value  } <$ _)
instance Attr AnimateMotion_ Rotate (Event.Event Unit -> Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute (map (map (
    \value -> { key: "rotate", value: prop' value })) eventValue)
instance Attr AnimateMotion_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "rotate", value: prop' value }
instance Attr Text_ Rotate  String  where
  attr Rotate value = unsafeAttribute (  
    { key: "rotate", value: prop' value  } <$ _)
instance Attr Text_ Rotate (Event.Event Unit -> Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute (map (map (
    \value -> { key: "rotate", value: prop' value })) eventValue)
instance Attr Text_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "rotate", value: prop' value }
instance Attr Tspan_ Rotate  String  where
  attr Rotate value = unsafeAttribute (  
    { key: "rotate", value: prop' value  } <$ _)
instance Attr Tspan_ Rotate (Event.Event Unit -> Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute (map (map (
    \value -> { key: "rotate", value: prop' value })) eventValue)
instance Attr Tspan_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "rotate", value: prop' value }
instance Attr everything Rotate  Unit  where
  attr Rotate _ = unsafeAttribute (  { key: "rotate", value: unset'  } <$ _)
instance Attr everything Rotate (Event.Event Unit -> Event.Event  Unit ) where
  attr Rotate eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "rotate", value: unset' })) eventValue)
instance Attr everything Rotate (Event.Event  Unit ) where
  attr Rotate eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "rotate", value: unset' }