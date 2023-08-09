module Deku.DOM.Attr.Dur where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Dur = Dur
instance Attr Animate_ Dur  String  where
  attr Dur value = unsafeAttribute (  { key: "dur", value: prop' value  } <$ _)
instance Attr Animate_ Dur (Event.Event Unit -> Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dur", value: prop' value })) eventValue)
instance Attr Animate_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dur", value: prop' value }
instance Attr AnimateMotion_ Dur  String  where
  attr Dur value = unsafeAttribute (  { key: "dur", value: prop' value  } <$ _)
instance Attr AnimateMotion_ Dur (Event.Event Unit -> Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dur", value: prop' value })) eventValue)
instance Attr AnimateMotion_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dur", value: prop' value }
instance Attr AnimateTransform_ Dur  String  where
  attr Dur value = unsafeAttribute (  { key: "dur", value: prop' value  } <$ _)
instance Attr AnimateTransform_ Dur (Event.Event Unit -> Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dur", value: prop' value })) eventValue)
instance Attr AnimateTransform_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dur", value: prop' value }
instance Attr Set_ Dur  String  where
  attr Dur value = unsafeAttribute (  { key: "dur", value: prop' value  } <$ _)
instance Attr Set_ Dur (Event.Event Unit -> Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dur", value: prop' value })) eventValue)
instance Attr Set_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dur", value: prop' value }
instance Attr everything Dur  Unit  where
  attr Dur _ = unsafeAttribute (  { key: "dur", value: unset'  } <$ _)
instance Attr everything Dur (Event.Event Unit -> Event.Event  Unit ) where
  attr Dur eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "dur", value: unset' })) eventValue)
instance Attr everything Dur (Event.Event  Unit ) where
  attr Dur eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "dur", value: unset' }