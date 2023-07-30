module Deku.DOM.Attr.K4 where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K4 = K4

instance Attr FeComposite_ K4 String where
  attr K4 bothValues = unsafeAttribute $ Both
    { key: "k4", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "k4", value: prop' value })
  pureAttr K4 value = unsafeAttribute $ This { key: "k4", value: prop' value }
  unpureAttr K4 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k4", value: prop' value }

instance Attr everything K4 Unit where
  attr K4 bothValues = unsafeAttribute $ Both { key: "k4", value: unset' }
    (snd bothValues <#> \_ -> { key: "k4", value: unset' })
  pureAttr K4 _ = unsafeAttribute $ This { key: "k4", value: unset' }
  unpureAttr K4 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k4", value: unset' }
