module Deku.DOM.Attr.Decelerate where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Decelerate = Decelerate
instance Attr AnimateTransform_ Decelerate  String  where
  attr Decelerate value = unsafeAttribute (  
    { key: "decelerate", value: prop' value  } <$ _)
instance Attr AnimateTransform_ Decelerate (Event.Event Unit -> Event.Event  String ) where
  attr Decelerate eventValue = unsafeAttribute (map (map (
    \value -> { key: "decelerate", value: prop' value })) eventValue)
instance Attr AnimateTransform_ Decelerate (Event.Event  String ) where
  attr Decelerate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "decelerate", value: prop' value }
instance Attr everything Decelerate  Unit  where
  attr Decelerate _ = unsafeAttribute (  
    { key: "decelerate", value: unset'  } <$ _)
instance Attr everything Decelerate (Event.Event Unit -> Event.Event  Unit ) where
  attr Decelerate eventValue = unsafeAttribute (map (map (
    \_ -> { key: "decelerate", value: unset' })) eventValue)
instance Attr everything Decelerate (Event.Event  Unit ) where
  attr Decelerate eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "decelerate", value: unset' }