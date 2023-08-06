module Deku.DOM.Attr.StitchTiles where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StitchTiles = StitchTiles

instance Attr FeTurbulence_ StitchTiles  String  where
  attr StitchTiles value = unsafeAttribute $ Left $  
    { key: "stitchTiles", value: prop' value }
instance Attr FeTurbulence_ StitchTiles (Event.Event  String ) where
  attr StitchTiles eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "stitchTiles", value: prop' value }


instance Attr everything StitchTiles  Unit  where
  attr StitchTiles _ = unsafeAttribute $ Left $  
    { key: "stitchTiles", value: unset' }
instance Attr everything StitchTiles (Event.Event  Unit ) where
  attr StitchTiles eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "stitchTiles", value: unset' }
