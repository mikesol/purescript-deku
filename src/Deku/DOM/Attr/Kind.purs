module Deku.DOM.Attr.Kind where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Kind = Kind

instance Attr Track_ Kind String where
  attr Kind bothValues = unsafeAttribute $ Both
    { key: "kind", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "kind", value: prop' value })
  pureAttr Kind value = unsafeAttribute $ This
    { key: "kind", value: prop' value }
  unpureAttr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "kind", value: prop' value }

instance Attr everything Kind Unit where
  attr Kind bothValues = unsafeAttribute $ Both { key: "kind", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "kind", value: unset' })
  pureAttr Kind _ = unsafeAttribute $ This { key: "kind", value: unset' }
  unpureAttr Kind eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "kind", value: unset' }
