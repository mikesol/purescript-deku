module Deku.DOM.Attr.RepeatCount where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RepeatCount = RepeatCount

instance Attr Animate_ RepeatCount String where
  attr RepeatCount bothValues = unsafeAttribute $ Both
    { key: "repeatCount", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "repeatCount", value: prop' value })
  pureAttr RepeatCount value = unsafeAttribute $ This
    { key: "repeatCount", value: prop' value }
  unpureAttr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr AnimateMotion_ RepeatCount String where
  attr RepeatCount bothValues = unsafeAttribute $ Both
    { key: "repeatCount", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "repeatCount", value: prop' value })
  pureAttr RepeatCount value = unsafeAttribute $ This
    { key: "repeatCount", value: prop' value }
  unpureAttr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr AnimateTransform_ RepeatCount String where
  attr RepeatCount bothValues = unsafeAttribute $ Both
    { key: "repeatCount", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "repeatCount", value: prop' value })
  pureAttr RepeatCount value = unsafeAttribute $ This
    { key: "repeatCount", value: prop' value }
  unpureAttr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr Set_ RepeatCount String where
  attr RepeatCount bothValues = unsafeAttribute $ Both
    { key: "repeatCount", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "repeatCount", value: prop' value })
  pureAttr RepeatCount value = unsafeAttribute $ This
    { key: "repeatCount", value: prop' value }
  unpureAttr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "repeatCount", value: prop' value }

instance Attr everything RepeatCount Unit where
  attr RepeatCount bothValues = unsafeAttribute $ Both
    { key: "repeatCount", value: unset' }
    (snd bothValues <#> \_ -> { key: "repeatCount", value: unset' })
  pureAttr RepeatCount _ = unsafeAttribute $ This
    { key: "repeatCount", value: unset' }
  unpureAttr RepeatCount eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "repeatCount", value: unset' }
