module Deku.DOM.Attr.Csp where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Csp = Csp

instance Attr Iframe_ Csp  String  where
  attr Csp value = unsafeAttribute (  { key: "csp", value: prop' value  } <$ _)
instance Attr Iframe_ Csp (Event.Event  String ) where
  attr Csp eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "csp", value: prop' value }


instance Attr everything Csp  Unit  where
  attr Csp _ = unsafeAttribute (  { key: "csp", value: unset'  } <$ _)
instance Attr everything Csp (Event.Event  Unit ) where
  attr Csp eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "csp", value: unset' }
