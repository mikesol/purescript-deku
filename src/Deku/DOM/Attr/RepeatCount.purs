module Deku.DOM.Attr.RepeatCount where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RepeatCount = RepeatCount

instance Attr Animate_ RepeatCount (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatCount bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatCount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatCount", value: prop' value })
instance Attr Animate_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute $ This $ pure $
    { key: "repeatCount", value: prop' value }
instance Attr Animate_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr AnimateMotion_ RepeatCount (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatCount bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatCount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatCount", value: prop' value })
instance Attr AnimateMotion_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute $ This $ pure $
    { key: "repeatCount", value: prop' value }
instance Attr AnimateMotion_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr AnimateTransform_ RepeatCount (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatCount bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatCount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatCount", value: prop' value })
instance Attr AnimateTransform_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute $ This $ pure $
    { key: "repeatCount", value: prop' value }
instance Attr AnimateTransform_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr Set_ RepeatCount (NonEmpty.NonEmpty Event.Event  String ) where
  attr RepeatCount bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatCount", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "repeatCount", value: prop' value })
instance Attr Set_ RepeatCount  String  where
  attr RepeatCount value = unsafeAttribute $ This $ pure $
    { key: "repeatCount", value: prop' value }
instance Attr Set_ RepeatCount (Event.Event  String ) where
  attr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr everything RepeatCount (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr RepeatCount bothValues = unsafeAttribute $ Both (pure 
    { key: "repeatCount", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "repeatCount", value: unset' })
instance Attr everything RepeatCount  Unit  where
  attr RepeatCount _ = unsafeAttribute $ This $ pure $
    { key: "repeatCount", value: unset' }
instance Attr everything RepeatCount (Event.Event  Unit ) where
  attr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "repeatCount", value: unset' }
