module Deku.DOM.Attr.AutoReverse where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AutoReverse = AutoReverse

instance Attr AnimateTransform_ AutoReverse (NonEmpty.NonEmpty Event.Event  String ) where
  attr AutoReverse bothValues = unsafeAttribute $ Both
    { key: "autoReverse", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "autoReverse", value: prop' value })
instance Attr AnimateTransform_ AutoReverse  String  where
  attr AutoReverse value = unsafeAttribute $ This $ pure $
    { key: "autoReverse", value: prop' value }
instance Attr AnimateTransform_ AutoReverse (Event.Event  String ) where
  attr AutoReverse eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autoReverse", value: prop' value }

instance Attr everything AutoReverse (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AutoReverse bothValues = unsafeAttribute $ Both
    { key: "autoReverse", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "autoReverse", value: unset' })
instance Attr everything AutoReverse  Unit  where
  attr AutoReverse _ = unsafeAttribute $ This $ pure $
    { key: "autoReverse", value: unset' }
instance Attr everything AutoReverse (Event.Event  Unit ) where
  attr AutoReverse eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autoReverse", value: unset' }
