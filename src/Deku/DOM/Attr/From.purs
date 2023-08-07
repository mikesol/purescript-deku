module Deku.DOM.Attr.From where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data From = From

instance Attr Animate_ From  String  where
  attr From value = unsafeAttribute (  
    { key: "from", value: prop' value  } <$ _)
instance Attr Animate_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "from", value: prop' value }


instance Attr AnimateMotion_ From  String  where
  attr From value = unsafeAttribute (  
    { key: "from", value: prop' value  } <$ _)
instance Attr AnimateMotion_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "from", value: prop' value }


instance Attr AnimateTransform_ From  String  where
  attr From value = unsafeAttribute (  
    { key: "from", value: prop' value  } <$ _)
instance Attr AnimateTransform_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "from", value: prop' value }


instance Attr everything From  Unit  where
  attr From _ = unsafeAttribute (  { key: "from", value: unset'  } <$ _)
instance Attr everything From (Event.Event  Unit ) where
  attr From eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "from", value: unset' }
