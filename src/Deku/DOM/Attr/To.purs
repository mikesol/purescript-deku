module Deku.DOM.Attr.To where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data To = To
instance Attr Animate_ To  String  where
  attr To value = unsafeAttribute (  { key: "to", value: prop' value  } <$ _)
instance Attr Animate_ To (Event.Event Unit -> Event.Event  String ) where
  attr To eventValue = unsafeAttribute (map (map ( \value ->
    { key: "to", value: prop' value })) eventValue)
instance Attr Animate_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "to", value: prop' value }
instance Attr AnimateMotion_ To  String  where
  attr To value = unsafeAttribute (  { key: "to", value: prop' value  } <$ _)
instance Attr AnimateMotion_ To (Event.Event Unit -> Event.Event  String ) where
  attr To eventValue = unsafeAttribute (map (map ( \value ->
    { key: "to", value: prop' value })) eventValue)
instance Attr AnimateMotion_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "to", value: prop' value }
instance Attr AnimateTransform_ To  String  where
  attr To value = unsafeAttribute (  { key: "to", value: prop' value  } <$ _)
instance Attr AnimateTransform_ To (Event.Event Unit -> Event.Event  String ) where
  attr To eventValue = unsafeAttribute (map (map ( \value ->
    { key: "to", value: prop' value })) eventValue)
instance Attr AnimateTransform_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "to", value: prop' value }
instance Attr Set_ To  String  where
  attr To value = unsafeAttribute (  { key: "to", value: prop' value  } <$ _)
instance Attr Set_ To (Event.Event Unit -> Event.Event  String ) where
  attr To eventValue = unsafeAttribute (map (map ( \value ->
    { key: "to", value: prop' value })) eventValue)
instance Attr Set_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "to", value: prop' value }
instance Attr everything To  Unit  where
  attr To _ = unsafeAttribute (  { key: "to", value: unset'  } <$ _)
instance Attr everything To (Event.Event Unit -> Event.Event  Unit ) where
  attr To eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "to", value: unset' })) eventValue)
instance Attr everything To (Event.Event  Unit ) where
  attr To eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "to", value: unset' }