module Deku.DOM.Attr.HttpEquiv where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data HttpEquiv = HttpEquiv

instance Attr Meta_ HttpEquiv String where
  attr HttpEquiv bothValues = unsafeAttribute $ Both
    { key: "http-equiv", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "http-equiv", value: prop' value })
  pureAttr HttpEquiv value = unsafeAttribute $ This
    { key: "http-equiv", value: prop' value }
  unpureAttr HttpEquiv eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "http-equiv", value: prop' value }

instance Attr everything HttpEquiv Unit where
  attr HttpEquiv bothValues = unsafeAttribute $ Both
    { key: "http-equiv", value: unset' }
    (snd bothValues <#> \_ -> { key: "http-equiv", value: unset' })
  pureAttr HttpEquiv _ = unsafeAttribute $ This
    { key: "http-equiv", value: unset' }
  unpureAttr HttpEquiv eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "http-equiv", value: unset' }
