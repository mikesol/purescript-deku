module Deku.DOM.Attr.Accumulate where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accumulate = Accumulate

instance Attr Animate_ Accumulate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr Animate_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: prop' value }
instance Attr Animate_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateMotion_ Accumulate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr AnimateMotion_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: prop' value }
instance Attr AnimateMotion_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateTransform_ Accumulate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
instance Attr AnimateTransform_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: prop' value }
instance Attr AnimateTransform_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr everything Accumulate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Accumulate bothValues = unsafeAttribute $ Both (pure 
    { key: "accumulate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "accumulate", value: unset' })
instance Attr everything Accumulate  Unit  where
  attr Accumulate _ = unsafeAttribute $ This $ pure $
    { key: "accumulate", value: unset' }
instance Attr everything Accumulate (Event.Event  Unit ) where
  attr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accumulate", value: unset' }
