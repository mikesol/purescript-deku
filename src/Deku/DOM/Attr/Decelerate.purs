module Deku.DOM.Attr.Decelerate where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decelerate = Decelerate

instance Attr AnimateTransform_ Decelerate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Decelerate bothValues = unsafeAttribute $ Both
    { key: "decelerate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "decelerate", value: prop' value })
instance Attr AnimateTransform_ Decelerate  String  where
  attr Decelerate value = unsafeAttribute $ This
    { key: "decelerate", value: prop' value }
instance Attr AnimateTransform_ Decelerate (Event.Event  String ) where
  attr Decelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "decelerate", value: prop' value }

instance Attr everything Decelerate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Decelerate bothValues = unsafeAttribute $ Both
    { key: "decelerate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "decelerate", value: unset' })
instance Attr everything Decelerate  Unit  where
  attr Decelerate _ = unsafeAttribute $ This
    { key: "decelerate", value: unset' }
instance Attr everything Decelerate (Event.Event  Unit ) where
  attr Decelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "decelerate", value: unset' }
