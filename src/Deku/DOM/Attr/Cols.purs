module Deku.DOM.Attr.Cols where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cols = Cols

instance Attr Textarea_ Cols String where
  attr Cols bothValues = unsafeAttribute $ Both
    { key: "cols", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "cols", value: prop' value })
  pureAttr Cols value = unsafeAttribute $ This
    { key: "cols", value: prop' value }
  unpureAttr Cols eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cols", value: prop' value }

instance Attr everything Cols Unit where
  attr Cols bothValues = unsafeAttribute $ Both { key: "cols", value: unset' }
    (snd bothValues <#> \_ -> { key: "cols", value: unset' })
  pureAttr Cols _ = unsafeAttribute $ This { key: "cols", value: unset' }
  unpureAttr Cols eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cols", value: unset' }
