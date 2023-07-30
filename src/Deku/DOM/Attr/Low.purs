module Deku.DOM.Attr.Low where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Low = Low

instance Attr Meter_ Low String where
  attr Low bothValues = unsafeAttribute $ Both
    { key: "low", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "low", value: prop' value })
  pureAttr Low value = unsafeAttribute $ This { key: "low", value: prop' value }
  unpureAttr Low eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "low", value: prop' value }

instance Attr everything Low Unit where
  attr Low bothValues = unsafeAttribute $ Both { key: "low", value: unset' }
    (snd bothValues <#> \_ -> { key: "low", value: unset' })
  pureAttr Low _ = unsafeAttribute $ This { key: "low", value: unset' }
  unpureAttr Low eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "low", value: unset' }
