module Deku.DOM.Attr.AutoReverse where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data AutoReverse = AutoReverse
instance Attr AnimateTransform_ AutoReverse  String  where
  attr AutoReverse value = unsafeAttribute (  
    { key: "autoReverse", value: prop' value  } <$ _)
instance Attr AnimateTransform_ AutoReverse (Event.Event Unit -> Event.Event  String ) where
  attr AutoReverse eventValue = unsafeAttribute (map (map (
    \value -> { key: "autoReverse", value: prop' value })) eventValue)
instance Attr AnimateTransform_ AutoReverse (Event.Event  String ) where
  attr AutoReverse eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autoReverse", value: prop' value }
instance Attr everything AutoReverse  Unit  where
  attr AutoReverse _ = unsafeAttribute (  
    { key: "autoReverse", value: unset'  } <$ _)
instance Attr everything AutoReverse (Event.Event Unit -> Event.Event  Unit ) where
  attr AutoReverse eventValue = unsafeAttribute (map (map (
    \_ -> { key: "autoReverse", value: unset' })) eventValue)
instance Attr everything AutoReverse (Event.Event  Unit ) where
  attr AutoReverse eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "autoReverse", value: unset' }