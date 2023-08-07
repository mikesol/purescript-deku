module Deku.DOM.Attr.Srcdoc where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcdoc = Srcdoc

instance Attr Iframe_ Srcdoc  String  where
  attr Srcdoc value = unsafeAttribute (  
    { key: "srcdoc", value: prop' value  } <$ _)
instance Attr Iframe_ Srcdoc (Event.Event  String ) where
  attr Srcdoc eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "srcdoc", value: prop' value }


instance Attr everything Srcdoc  Unit  where
  attr Srcdoc _ = unsafeAttribute (  { key: "srcdoc", value: unset'  } <$ _)
instance Attr everything Srcdoc (Event.Event  Unit ) where
  attr Srcdoc eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "srcdoc", value: unset' }
