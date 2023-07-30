module Deku.DOM.Attr.Ismap where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ismap = Ismap

instance Attr Img_ Ismap String where
  attr Ismap bothValues = unsafeAttribute $ Both
    { key: "ismap", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "ismap", value: prop' value })
  pureAttr Ismap value = unsafeAttribute $ This
    { key: "ismap", value: prop' value }
  unpureAttr Ismap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ismap", value: prop' value }

instance Attr everything Ismap Unit where
  attr Ismap bothValues = unsafeAttribute $ Both { key: "ismap", value: unset' }
    (snd bothValues <#> \_ -> { key: "ismap", value: unset' })
  pureAttr Ismap _ = unsafeAttribute $ This { key: "ismap", value: unset' }
  unpureAttr Ismap eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ismap", value: unset' }
