module Deku.DOM.Attr.K2 where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K2 = K2

instance Attr FeComposite_ K2 String where
  attr K2 bothValues = unsafeAttribute $ Both
    { key: "k2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "k2", value: prop' value })
  pureAttr K2 value = unsafeAttribute $ This { key: "k2", value: prop' value }
  unpureAttr K2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k2", value: prop' value }

instance Attr everything K2 Unit where
  attr K2 bothValues = unsafeAttribute $ Both { key: "k2", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "k2", value: unset' })
  pureAttr K2 _ = unsafeAttribute $ This { key: "k2", value: unset' }
  unpureAttr K2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k2", value: unset' }
