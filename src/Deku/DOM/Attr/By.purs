module Deku.DOM.Attr.By where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data By = By
instance Attr Animate_ By  String  where
  attr By value = unsafeAttribute (  { key: "by", value: prop' value  } <$ _)
instance Attr Animate_ By (Event.Event Unit -> Event.Event  String ) where
  attr By eventValue = unsafeAttribute (map (map ( \value ->
    { key: "by", value: prop' value })) eventValue)
instance Attr Animate_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "by", value: prop' value }
instance Attr AnimateMotion_ By  String  where
  attr By value = unsafeAttribute (  { key: "by", value: prop' value  } <$ _)
instance Attr AnimateMotion_ By (Event.Event Unit -> Event.Event  String ) where
  attr By eventValue = unsafeAttribute (map (map ( \value ->
    { key: "by", value: prop' value })) eventValue)
instance Attr AnimateMotion_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "by", value: prop' value }
instance Attr AnimateTransform_ By  String  where
  attr By value = unsafeAttribute (  { key: "by", value: prop' value  } <$ _)
instance Attr AnimateTransform_ By (Event.Event Unit -> Event.Event  String ) where
  attr By eventValue = unsafeAttribute (map (map ( \value ->
    { key: "by", value: prop' value })) eventValue)
instance Attr AnimateTransform_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "by", value: prop' value }
instance Attr everything By  Unit  where
  attr By _ = unsafeAttribute (  { key: "by", value: unset'  } <$ _)
instance Attr everything By (Event.Event Unit -> Event.Event  Unit ) where
  attr By eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "by", value: unset' })) eventValue)
instance Attr everything By (Event.Event  Unit ) where
  attr By eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "by", value: unset' }