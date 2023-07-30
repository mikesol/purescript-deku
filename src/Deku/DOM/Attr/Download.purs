module Deku.DOM.Attr.Download where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Download = Download

instance Attr A_ Download String where
  attr Download bothValues = unsafeAttribute $ Both
    { key: "download", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "download", value: prop' value })
  pureAttr Download value = unsafeAttribute $ This
    { key: "download", value: prop' value }
  unpureAttr Download eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "download", value: prop' value }

instance Attr Area_ Download String where
  attr Download bothValues = unsafeAttribute $ Both
    { key: "download", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "download", value: prop' value })
  pureAttr Download value = unsafeAttribute $ This
    { key: "download", value: prop' value }
  unpureAttr Download eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "download", value: prop' value }

instance Attr everything Download Unit where
  attr Download bothValues = unsafeAttribute $ Both
    { key: "download", value: unset' }
    (snd bothValues <#> \_ -> { key: "download", value: unset' })
  pureAttr Download _ = unsafeAttribute $ This
    { key: "download", value: unset' }
  unpureAttr Download eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "download", value: unset' }
