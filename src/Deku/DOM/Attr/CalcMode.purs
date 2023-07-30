module Deku.DOM.Attr.CalcMode where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data CalcMode = CalcMode

instance Attr Animate_ CalcMode String where
  attr CalcMode bothValues = unsafeAttribute $ Both
    { key: "calcMode", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "calcMode", value: prop' value })
  pureAttr CalcMode value = unsafeAttribute $ This
    { key: "calcMode", value: prop' value }
  unpureAttr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }

instance Attr AnimateMotion_ CalcMode String where
  attr CalcMode bothValues = unsafeAttribute $ Both
    { key: "calcMode", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "calcMode", value: prop' value })
  pureAttr CalcMode value = unsafeAttribute $ This
    { key: "calcMode", value: prop' value }
  unpureAttr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }

instance Attr AnimateTransform_ CalcMode String where
  attr CalcMode bothValues = unsafeAttribute $ Both
    { key: "calcMode", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "calcMode", value: prop' value })
  pureAttr CalcMode value = unsafeAttribute $ This
    { key: "calcMode", value: prop' value }
  unpureAttr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "calcMode", value: prop' value }

instance Attr everything CalcMode Unit where
  attr CalcMode bothValues = unsafeAttribute $ Both
    { key: "calcMode", value: unset' }
    (snd bothValues <#> \_ -> { key: "calcMode", value: unset' })
  pureAttr CalcMode _ = unsafeAttribute $ This
    { key: "calcMode", value: unset' }
  unpureAttr CalcMode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "calcMode", value: unset' }
