module Deku.DOM.Attr.RefY where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefY = RefY

instance Attr Marker_ RefY String where
  attr RefY bothValues = unsafeAttribute $ Both
    { key: "refY", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "refY", value: prop' value })
  pureAttr RefY value = unsafeAttribute $ This
    { key: "refY", value: prop' value }
  unpureAttr RefY eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refY", value: prop' value }

instance Attr Symbol_ RefY String where
  attr RefY bothValues = unsafeAttribute $ Both
    { key: "refY", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "refY", value: prop' value })
  pureAttr RefY value = unsafeAttribute $ This
    { key: "refY", value: prop' value }
  unpureAttr RefY eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "refY", value: prop' value }

instance Attr everything RefY Unit where
  attr RefY bothValues = unsafeAttribute $ Both { key: "refY", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "refY", value: unset' })
  pureAttr RefY _ = unsafeAttribute $ This { key: "refY", value: unset' }
  unpureAttr RefY eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "refY", value: unset' }
