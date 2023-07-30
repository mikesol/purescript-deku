module Deku.DOM.Attr.D where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data D = D

instance Attr Path_ D String where
  attr D bothValues = unsafeAttribute $ Both
    { key: "d", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "d", value: prop' value })
  pureAttr D value = unsafeAttribute $ This { key: "d", value: prop' value }
  unpureAttr D eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "d", value: prop' value }

instance Attr everything D Unit where
  attr D bothValues = unsafeAttribute $ Both { key: "d", value: unset' }
    (snd bothValues <#> \_ -> { key: "d", value: unset' })
  pureAttr D _ = unsafeAttribute $ This { key: "d", value: unset' }
  unpureAttr D eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "d", value: unset' }
