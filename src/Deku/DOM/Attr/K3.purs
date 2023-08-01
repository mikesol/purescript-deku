module Deku.DOM.Attr.K3 where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K3 = K3

instance Attr FeComposite_ K3 String where
  attr K3 bothValues = unsafeAttribute $ Both
    { key: "k3", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "k3", value: prop' value })
  pureAttr K3 value = unsafeAttribute $ This { key: "k3", value: prop' value }
  unpureAttr K3 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k3", value: prop' value }

instance Attr everything K3 Unit where
  attr K3 bothValues = unsafeAttribute $ Both { key: "k3", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "k3", value: unset' })
  pureAttr K3 _ = unsafeAttribute $ This { key: "k3", value: unset' }
  unpureAttr K3 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k3", value: unset' }
