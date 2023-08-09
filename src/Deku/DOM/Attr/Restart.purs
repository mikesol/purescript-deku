module Deku.DOM.Attr.Restart where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Restart = Restart
instance Attr Animate_ Restart  String  where
  attr Restart value = unsafeAttribute (  
    { key: "restart", value: prop' value  } <$ _)
instance Attr Animate_ Restart (Event.Event Unit -> Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute (map (map (
    \value -> { key: "restart", value: prop' value })) eventValue)
instance Attr Animate_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "restart", value: prop' value }
instance Attr AnimateMotion_ Restart  String  where
  attr Restart value = unsafeAttribute (  
    { key: "restart", value: prop' value  } <$ _)
instance Attr AnimateMotion_ Restart (Event.Event Unit -> Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute (map (map (
    \value -> { key: "restart", value: prop' value })) eventValue)
instance Attr AnimateMotion_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "restart", value: prop' value }
instance Attr AnimateTransform_ Restart  String  where
  attr Restart value = unsafeAttribute (  
    { key: "restart", value: prop' value  } <$ _)
instance Attr AnimateTransform_ Restart (Event.Event Unit -> Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute (map (map (
    \value -> { key: "restart", value: prop' value })) eventValue)
instance Attr AnimateTransform_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "restart", value: prop' value }
instance Attr Set_ Restart  String  where
  attr Restart value = unsafeAttribute (  
    { key: "restart", value: prop' value  } <$ _)
instance Attr Set_ Restart (Event.Event Unit -> Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute (map (map (
    \value -> { key: "restart", value: prop' value })) eventValue)
instance Attr Set_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "restart", value: prop' value }
instance Attr everything Restart  Unit  where
  attr Restart _ = unsafeAttribute (  { key: "restart", value: unset'  } <$ _)
instance Attr everything Restart (Event.Event Unit -> Event.Event  Unit ) where
  attr Restart eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "restart", value: unset' })) eventValue)
instance Attr everything Restart (Event.Event  Unit ) where
  attr Restart eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "restart", value: unset' }