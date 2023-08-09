module Deku.DOM.Attr.RepeatDur where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data RepeatDur = RepeatDur
instance Attr Animate_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute (  
    { key: "repeatDur", value: prop' value  } <$ _)
instance Attr Animate_ RepeatDur (Event.Event Unit -> Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatDur", value: prop' value })) eventValue)
instance Attr Animate_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }
instance Attr AnimateMotion_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute (  
    { key: "repeatDur", value: prop' value  } <$ _)
instance Attr AnimateMotion_ RepeatDur (Event.Event Unit -> Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatDur", value: prop' value })) eventValue)
instance Attr AnimateMotion_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }
instance Attr AnimateTransform_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute (  
    { key: "repeatDur", value: prop' value  } <$ _)
instance Attr AnimateTransform_ RepeatDur (Event.Event Unit -> Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatDur", value: prop' value })) eventValue)
instance Attr AnimateTransform_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }
instance Attr Set_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute (  
    { key: "repeatDur", value: prop' value  } <$ _)
instance Attr Set_ RepeatDur (Event.Event Unit -> Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatDur", value: prop' value })) eventValue)
instance Attr Set_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }
instance Attr everything RepeatDur  Unit  where
  attr RepeatDur _ = unsafeAttribute (  
    { key: "repeatDur", value: unset'  } <$ _)
instance Attr everything RepeatDur (Event.Event Unit -> Event.Event  Unit ) where
  attr RepeatDur eventValue = unsafeAttribute (map (map (
    \_ -> { key: "repeatDur", value: unset' })) eventValue)
instance Attr everything RepeatDur (Event.Event  Unit ) where
  attr RepeatDur eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "repeatDur", value: unset' }