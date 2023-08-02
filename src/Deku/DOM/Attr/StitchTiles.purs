module Deku.DOM.Attr.StitchTiles where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StitchTiles = StitchTiles

instance Attr FeTurbulence_ StitchTiles (NonEmpty.NonEmpty Event.Event  String ) where
  attr StitchTiles bothValues = unsafeAttribute $ Both
    { key: "stitchTiles", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "stitchTiles", value: prop' value })
instance Attr FeTurbulence_ StitchTiles  String  where
  attr StitchTiles value = unsafeAttribute $ This
    { key: "stitchTiles", value: prop' value }
instance Attr FeTurbulence_ StitchTiles (Event.Event  String ) where
  attr StitchTiles eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stitchTiles", value: prop' value }

instance Attr everything StitchTiles (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StitchTiles bothValues = unsafeAttribute $ Both
    { key: "stitchTiles", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "stitchTiles", value: unset' })
instance Attr everything StitchTiles  Unit  where
  attr StitchTiles _ = unsafeAttribute $ This
    { key: "stitchTiles", value: unset' }
instance Attr everything StitchTiles (Event.Event  Unit ) where
  attr StitchTiles eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stitchTiles", value: unset' }
