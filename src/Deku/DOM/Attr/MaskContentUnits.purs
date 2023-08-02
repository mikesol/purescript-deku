module Deku.DOM.Attr.MaskContentUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskContentUnits = MaskContentUnits

instance Attr Mask_ MaskContentUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr MaskContentUnits bothValues = unsafeAttribute $ Both
    { key: "maskContentUnits", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "maskContentUnits", value: prop' value }
    )
instance Attr Mask_ MaskContentUnits  String  where
  attr MaskContentUnits value = unsafeAttribute $ This
    { key: "maskContentUnits", value: prop' value }
instance Attr Mask_ MaskContentUnits (Event.Event  String ) where
  attr MaskContentUnits eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "maskContentUnits", value: prop' value }

instance Attr everything MaskContentUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MaskContentUnits bothValues = unsafeAttribute $ Both
    { key: "maskContentUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "maskContentUnits", value: unset' })
instance Attr everything MaskContentUnits  Unit  where
  attr MaskContentUnits _ = unsafeAttribute $ This
    { key: "maskContentUnits", value: unset' }
instance Attr everything MaskContentUnits (Event.Event  Unit ) where
  attr MaskContentUnits eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "maskContentUnits", value: unset' }
