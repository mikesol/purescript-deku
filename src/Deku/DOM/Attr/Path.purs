module Deku.DOM.Attr.Path where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Path = Path

instance Attr AnimateMotion_ Path  String  where
  attr Path value = unsafeAttribute (  
    { key: "path", value: prop' value  } <$ _)
instance Attr AnimateMotion_ Path (Event.Event  String ) where
  attr Path eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "path", value: prop' value }


instance Attr TextPath_ Path  String  where
  attr Path value = unsafeAttribute (  
    { key: "path", value: prop' value  } <$ _)
instance Attr TextPath_ Path (Event.Event  String ) where
  attr Path eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "path", value: prop' value }


instance Attr everything Path  Unit  where
  attr Path _ = unsafeAttribute (  { key: "path", value: unset'  } <$ _)
instance Attr everything Path (Event.Event  Unit ) where
  attr Path eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "path", value: unset' }
