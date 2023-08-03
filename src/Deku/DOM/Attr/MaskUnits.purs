module Deku.DOM.Attr.MaskUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskUnits = MaskUnits

instance Attr Mask_ MaskUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr MaskUnits bothValues = unsafeAttribute $ Both
    { key: "maskUnits", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "maskUnits", value: prop' value })
instance Attr Mask_ MaskUnits  String  where
  attr MaskUnits value = unsafeAttribute $ This $ pure $
    { key: "maskUnits", value: prop' value }
instance Attr Mask_ MaskUnits (Event.Event  String ) where
  attr MaskUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maskUnits", value: prop' value }

instance Attr everything MaskUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MaskUnits bothValues = unsafeAttribute $ Both
    { key: "maskUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "maskUnits", value: unset' })
instance Attr everything MaskUnits  Unit  where
  attr MaskUnits _ = unsafeAttribute $ This $ pure $
    { key: "maskUnits", value: unset' }
instance Attr everything MaskUnits (Event.Event  Unit ) where
  attr MaskUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "maskUnits", value: unset' }
