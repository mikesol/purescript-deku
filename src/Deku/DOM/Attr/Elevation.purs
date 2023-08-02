module Deku.DOM.Attr.Elevation where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Elevation = Elevation

instance Attr FeDistantLight_ Elevation (NonEmpty.NonEmpty Event.Event  String ) where
  attr Elevation bothValues = unsafeAttribute $ Both
    { key: "elevation", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "elevation", value: prop' value })
instance Attr FeDistantLight_ Elevation  String  where
  attr Elevation value = unsafeAttribute $ This
    { key: "elevation", value: prop' value }
instance Attr FeDistantLight_ Elevation (Event.Event  String ) where
  attr Elevation eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "elevation", value: prop' value }

instance Attr everything Elevation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Elevation bothValues = unsafeAttribute $ Both
    { key: "elevation", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "elevation", value: unset' })
instance Attr everything Elevation  Unit  where
  attr Elevation _ = unsafeAttribute $ This
    { key: "elevation", value: unset' }
instance Attr everything Elevation (Event.Event  Unit ) where
  attr Elevation eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "elevation", value: unset' }
