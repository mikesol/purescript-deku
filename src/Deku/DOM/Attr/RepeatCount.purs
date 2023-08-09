module Deku.DOM.Attr.RepeatCount where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data RepeatCount = RepeatCount
instance Attr Animate_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute (  
    { key: "repeatCount", value: prop' value  } <$ _)
instance Attr Animate_ RepeatCount (Event.Event Unit -> Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatCount", value: prop' value })) eventValue)
instance Attr Animate_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }
instance Attr AnimateMotion_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute (  
    { key: "repeatCount", value: prop' value  } <$ _)
instance Attr AnimateMotion_ RepeatCount (Event.Event Unit -> Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatCount", value: prop' value })) eventValue)
instance Attr AnimateMotion_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }
instance Attr AnimateTransform_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute (  
    { key: "repeatCount", value: prop' value  } <$ _)
instance Attr AnimateTransform_ RepeatCount (Event.Event Unit -> Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatCount", value: prop' value })) eventValue)
instance Attr AnimateTransform_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }
instance Attr Set_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute (  
    { key: "repeatCount", value: prop' value  } <$ _)
instance Attr Set_ RepeatCount (Event.Event Unit -> Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute (map (map (
    \value -> { key: "repeatCount", value: prop' value })) eventValue)
instance Attr Set_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }
instance Attr everything RepeatCount  Unit  where
  attr RepeatCount _ = unsafeAttribute (  
    { key: "repeatCount", value: unset'  } <$ _)
instance Attr everything RepeatCount (Event.Event Unit -> Event.Event  Unit ) where
  attr RepeatCount eventValue = unsafeAttribute (map (map (
    \_ -> { key: "repeatCount", value: unset' })) eventValue)
instance Attr everything RepeatCount (Event.Event  Unit ) where
  attr RepeatCount eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "repeatCount", value: unset' }