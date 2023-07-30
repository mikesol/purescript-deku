module Deku.DOM.Attr.Version where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Version = Version

instance Attr Svg_ Version String where
  attr Version bothValues = unsafeAttribute $ Both
    { key: "version", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "version", value: prop' value })
  pureAttr Version value = unsafeAttribute $ This
    { key: "version", value: prop' value }
  unpureAttr Version eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "version", value: prop' value }

instance Attr everything Version Unit where
  attr Version bothValues = unsafeAttribute $ Both
    { key: "version", value: unset' }
    (snd bothValues <#> \_ -> { key: "version", value: unset' })
  pureAttr Version _ = unsafeAttribute $ This { key: "version", value: unset' }
  unpureAttr Version eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "version", value: unset' }
