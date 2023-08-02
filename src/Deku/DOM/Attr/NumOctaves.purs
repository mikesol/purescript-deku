module Deku.DOM.Attr.NumOctaves where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves (NonEmpty.NonEmpty Event.Event  String ) where
  attr NumOctaves bothValues = unsafeAttribute $ Both
    { key: "numOctaves", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "numOctaves", value: prop' value })
instance Attr FeTurbulence_ NumOctaves  String  where
  attr NumOctaves value = unsafeAttribute $ This
    { key: "numOctaves", value: prop' value }
instance Attr FeTurbulence_ NumOctaves (Event.Event  String ) where
  attr NumOctaves eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "numOctaves", value: prop' value }

instance Attr everything NumOctaves (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr NumOctaves bothValues = unsafeAttribute $ Both
    { key: "numOctaves", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "numOctaves", value: unset' })
instance Attr everything NumOctaves  Unit  where
  attr NumOctaves _ = unsafeAttribute $ This
    { key: "numOctaves", value: unset' }
instance Attr everything NumOctaves (Event.Event  Unit ) where
  attr NumOctaves eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "numOctaves", value: unset' }
