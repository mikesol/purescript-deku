module Deku.DOM.Attr.KeyTimes where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyTimes = KeyTimes

instance Attr Animate_ KeyTimes (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both
    { key: "keyTimes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr Animate_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: prop' value }
instance Attr Animate_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr AnimateMotion_ KeyTimes (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both
    { key: "keyTimes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr AnimateMotion_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: prop' value }
instance Attr AnimateMotion_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr AnimateTransform_ KeyTimes (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both
    { key: "keyTimes", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keyTimes", value: prop' value })
instance Attr AnimateTransform_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: prop' value }
instance Attr AnimateTransform_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }

instance Attr everything KeyTimes (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KeyTimes bothValues = unsafeAttribute $ Both
    { key: "keyTimes", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyTimes", value: unset' })
instance Attr everything KeyTimes  Unit  where
  attr KeyTimes _ = unsafeAttribute $ This $ pure $
    { key: "keyTimes", value: unset' }
instance Attr everything KeyTimes (Event.Event  Unit ) where
  attr KeyTimes eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "keyTimes", value: unset' }
