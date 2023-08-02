module Deku.DOM.Attr.RepeatDur where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RepeatDur = RepeatDur

instance Attr Animate_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr Animate_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This
    { key: "repeatDur", value: prop' value }
instance Attr Animate_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr AnimateMotion_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr AnimateMotion_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This
    { key: "repeatDur", value: prop' value }
instance Attr AnimateMotion_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr AnimateTransform_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr AnimateTransform_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This
    { key: "repeatDur", value: prop' value }
instance Attr AnimateTransform_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr Set_ RepeatDur (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both
    { key: "repeatDur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatDur", value: prop' value })
instance Attr Set_ RepeatDur  String  where
  attr RepeatDur value = unsafeAttribute $ This
    { key: "repeatDur", value: prop' value }
instance Attr Set_ RepeatDur (Event.Event  String ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatDur", value: prop' value }

instance Attr everything RepeatDur (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RepeatDur bothValues = unsafeAttribute $ Both
    { key: "repeatDur", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "repeatDur", value: unset' })
instance Attr everything RepeatDur  Unit  where
  attr RepeatDur _ = unsafeAttribute $ This
    { key: "repeatDur", value: unset' }
instance Attr everything RepeatDur (Event.Event  Unit ) where
  attr RepeatDur eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "repeatDur", value: unset' }
