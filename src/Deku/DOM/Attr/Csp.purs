module Deku.DOM.Attr.Csp where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Csp = Csp

instance Attr Iframe_ Csp String where
  attr Csp bothValues = unsafeAttribute $ Both
    { key: "csp", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "csp", value: prop' value })
  pureAttr Csp value = unsafeAttribute $ This { key: "csp", value: prop' value }
  unpureAttr Csp eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "csp", value: prop' value }

instance Attr everything Csp Unit where
  attr Csp bothValues = unsafeAttribute $ Both { key: "csp", value: unset' }
    (snd bothValues <#> \_ -> { key: "csp", value: unset' })
  pureAttr Csp _ = unsafeAttribute $ This { key: "csp", value: unset' }
  unpureAttr Csp eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "csp", value: unset' }
