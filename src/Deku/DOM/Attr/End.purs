module Deku.DOM.Attr.End where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data End = End
instance Attr Animate_ End  String  where
  attr End value = unsafeAttribute (  { key: "end", value: prop' value  } <$ _)
instance Attr Animate_ End (Event.Event Unit -> Event.Event  String ) where
  attr End eventValue = unsafeAttribute (map (map ( \value ->
    { key: "end", value: prop' value })) eventValue)
instance Attr Animate_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "end", value: prop' value }
instance Attr AnimateMotion_ End  String  where
  attr End value = unsafeAttribute (  { key: "end", value: prop' value  } <$ _)
instance Attr AnimateMotion_ End (Event.Event Unit -> Event.Event  String ) where
  attr End eventValue = unsafeAttribute (map (map ( \value ->
    { key: "end", value: prop' value })) eventValue)
instance Attr AnimateMotion_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "end", value: prop' value }
instance Attr AnimateTransform_ End  String  where
  attr End value = unsafeAttribute (  { key: "end", value: prop' value  } <$ _)
instance Attr AnimateTransform_ End (Event.Event Unit -> Event.Event  String ) where
  attr End eventValue = unsafeAttribute (map (map ( \value ->
    { key: "end", value: prop' value })) eventValue)
instance Attr AnimateTransform_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "end", value: prop' value }
instance Attr Set_ End  String  where
  attr End value = unsafeAttribute (  { key: "end", value: prop' value  } <$ _)
instance Attr Set_ End (Event.Event Unit -> Event.Event  String ) where
  attr End eventValue = unsafeAttribute (map (map ( \value ->
    { key: "end", value: prop' value })) eventValue)
instance Attr Set_ End (Event.Event  String ) where
  attr End eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "end", value: prop' value }
instance Attr everything End  Unit  where
  attr End _ = unsafeAttribute (  { key: "end", value: unset'  } <$ _)
instance Attr everything End (Event.Event Unit -> Event.Event  Unit ) where
  attr End eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "end", value: unset' })) eventValue)
instance Attr everything End (Event.Event  Unit ) where
  attr End eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "end", value: unset' }