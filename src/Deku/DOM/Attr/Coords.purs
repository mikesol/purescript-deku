module Deku.DOM.Attr.Coords where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Coords = Coords

instance Attr Area_ Coords (NonEmpty.NonEmpty Event.Event  String ) where
  attr Coords bothValues = unsafeAttribute $ Both
    { key: "coords", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "coords", value: prop' value })
instance Attr Area_ Coords  String  where
  attr Coords value = unsafeAttribute $ This $ pure $
    { key: "coords", value: prop' value }
instance Attr Area_ Coords (Event.Event  String ) where
  attr Coords eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "coords", value: prop' value }

instance Attr everything Coords (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Coords bothValues = unsafeAttribute $ Both
    { key: "coords", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "coords", value: unset' })
instance Attr everything Coords  Unit  where
  attr Coords _ = unsafeAttribute $ This $ pure $ { key: "coords", value: unset' }
instance Attr everything Coords (Event.Event  Unit ) where
  attr Coords eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "coords", value: unset' }
