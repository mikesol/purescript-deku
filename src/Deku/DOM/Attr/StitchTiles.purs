module Deku.DOM.Attr.StitchTiles where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StitchTiles = StitchTiles

instance Attr FeTurbulence_ StitchTiles  String  where
  attr StitchTiles value = unsafeAttribute (  
    { key: "stitchTiles", value: prop' value  } <$ _)
instance Attr FeTurbulence_ StitchTiles (Event.Event  String ) where
  attr StitchTiles eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stitchTiles", value: prop' value }


instance Attr everything StitchTiles  Unit  where
  attr StitchTiles _ = unsafeAttribute (  
    { key: "stitchTiles", value: unset'  } <$ _)
instance Attr everything StitchTiles (Event.Event  Unit ) where
  attr StitchTiles eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "stitchTiles", value: unset' }
