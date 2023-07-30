module Deku.DOM.Attr.TargetY where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetY = TargetY

instance Attr FeConvolveMatrix_ TargetY String where
  attr TargetY bothValues = unsafeAttribute $ Both
    { key: "targetY", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "targetY", value: prop' value })
  pureAttr TargetY value = unsafeAttribute $ This
    { key: "targetY", value: prop' value }
  unpureAttr TargetY eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "targetY", value: prop' value }

instance Attr everything TargetY Unit where
  attr TargetY bothValues = unsafeAttribute $ Both
    { key: "targetY", value: unset' }
    (snd bothValues <#> \_ -> { key: "targetY", value: unset' })
  pureAttr TargetY _ = unsafeAttribute $ This { key: "targetY", value: unset' }
  unpureAttr TargetY eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "targetY", value: unset' }
