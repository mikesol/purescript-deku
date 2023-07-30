module Deku.DOM.Attr.Side where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Side = Side

instance Attr TextPath_ Side String where
  attr Side bothValues = unsafeAttribute $ Both
    { key: "side", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "side", value: prop' value })
  pureAttr Side value = unsafeAttribute $ This
    { key: "side", value: prop' value }
  unpureAttr Side eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "side", value: prop' value }

instance Attr everything Side Unit where
  attr Side bothValues = unsafeAttribute $ Both { key: "side", value: unset' }
    (snd bothValues <#> \_ -> { key: "side", value: unset' })
  pureAttr Side _ = unsafeAttribute $ This { key: "side", value: unset' }
  unpureAttr Side eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "side", value: unset' }
