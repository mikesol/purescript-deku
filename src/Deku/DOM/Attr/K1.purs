module Deku.DOM.Attr.K1 where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K1 = K1

instance Attr FeComposite_ K1 String where
  attr K1 bothValues = unsafeAttribute $ Both
    { key: "k1", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "k1", value: prop' value })
  pureAttr K1 value = unsafeAttribute $ This { key: "k1", value: prop' value }
  unpureAttr K1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k1", value: prop' value }

instance Attr everything K1 Unit where
  attr K1 bothValues = unsafeAttribute $ Both { key: "k1", value: unset' }
    (snd bothValues <#> \_ -> { key: "k1", value: unset' })
  pureAttr K1 _ = unsafeAttribute $ This { key: "k1", value: unset' }
  unpureAttr K1 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k1", value: unset' }
