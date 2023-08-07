module Deku.DOM.Attr.Seed where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Seed = Seed

instance Attr FeTurbulence_ Seed  String  where
  attr Seed value = unsafeAttribute (  
    { key: "seed", value: prop' value  } <$ _)
instance Attr FeTurbulence_ Seed (Event.Event  String ) where
  attr Seed eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "seed", value: prop' value }


instance Attr everything Seed  Unit  where
  attr Seed _ = unsafeAttribute (  { key: "seed", value: unset'  } <$ _)
instance Attr everything Seed (Event.Event  Unit ) where
  attr Seed eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "seed", value: unset' }
