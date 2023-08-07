module Deku.DOM.Attr.Srclang where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srclang = Srclang

instance Attr Track_ Srclang  String  where
  attr Srclang value = unsafeAttribute (  
    { key: "srclang", value: prop' value  } <$ _)
instance Attr Track_ Srclang (Event.Event  String ) where
  attr Srclang eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "srclang", value: prop' value }


instance Attr everything Srclang  Unit  where
  attr Srclang _ = unsafeAttribute (  { key: "srclang", value: unset'  } <$ _)
instance Attr everything Srclang (Event.Event  Unit ) where
  attr Srclang eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "srclang", value: unset' }
