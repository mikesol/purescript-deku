module Deku.DOM.Attr.Kind where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Kind = Kind

instance Attr Track_ Kind String where
  attr Kind bothValues = unsafeAttribute $ Both
    { key: "kind", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "kind", value: prop' value })
  pureAttr Kind value = unsafeAttribute $ This
    { key: "kind", value: prop' value }
  unpureAttr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "kind", value: prop' value }

instance Attr everything Kind Unit where
  attr Kind bothValues = unsafeAttribute $ Both { key: "kind", value: unset' }
    (snd bothValues <#> \_ -> { key: "kind", value: unset' })
  pureAttr Kind _ = unsafeAttribute $ This { key: "kind", value: unset' }
  unpureAttr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "kind", value: unset' }
