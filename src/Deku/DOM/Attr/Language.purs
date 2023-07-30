module Deku.DOM.Attr.Language where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Language = Language

instance Attr Script_ Language String where
  attr Language bothValues = unsafeAttribute $ Both
    { key: "language", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "language", value: prop' value })
  pureAttr Language value = unsafeAttribute $ This
    { key: "language", value: prop' value }
  unpureAttr Language eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "language", value: prop' value }

instance Attr everything Language Unit where
  attr Language bothValues = unsafeAttribute $ Both
    { key: "language", value: unset' }
    (snd bothValues <#> \_ -> { key: "language", value: unset' })
  pureAttr Language _ = unsafeAttribute $ This
    { key: "language", value: unset' }
  unpureAttr Language eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "language", value: unset' }
