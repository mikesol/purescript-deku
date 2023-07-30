module Deku.DOM.Attr.Checked where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Checked = Checked

instance Attr Input_ Checked String where
  attr Checked bothValues = unsafeAttribute $ Both
    { key: "checked", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "checked", value: prop' value })
  pureAttr Checked value = unsafeAttribute $ This
    { key: "checked", value: prop' value }
  unpureAttr Checked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "checked", value: prop' value }

instance Attr everything Checked Unit where
  attr Checked bothValues = unsafeAttribute $ Both
    { key: "checked", value: unset' }
    (snd bothValues <#> \_ -> { key: "checked", value: unset' })
  pureAttr Checked _ = unsafeAttribute $ This { key: "checked", value: unset' }
  unpureAttr Checked eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "checked", value: unset' }
