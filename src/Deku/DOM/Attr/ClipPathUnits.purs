module Deku.DOM.Attr.ClipPathUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ClipPathUnits = ClipPathUnits

instance Attr ClipPath_ ClipPathUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr ClipPathUnits bothValues = unsafeAttribute $ Both
    { key: "clipPathUnits", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "clipPathUnits", value: prop' value })
instance Attr ClipPath_ ClipPathUnits  String  where
  attr ClipPathUnits value = unsafeAttribute $ This $ pure $
    { key: "clipPathUnits", value: prop' value }
instance Attr ClipPath_ ClipPathUnits (Event.Event  String ) where
  attr ClipPathUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "clipPathUnits", value: prop' value }

instance Attr everything ClipPathUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ClipPathUnits bothValues = unsafeAttribute $ Both
    { key: "clipPathUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "clipPathUnits", value: unset' })
instance Attr everything ClipPathUnits  Unit  where
  attr ClipPathUnits _ = unsafeAttribute $ This $ pure $
    { key: "clipPathUnits", value: unset' }
instance Attr everything ClipPathUnits (Event.Event  Unit ) where
  attr ClipPathUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "clipPathUnits", value: unset' }
