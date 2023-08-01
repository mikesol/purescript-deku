module Deku.DOM.Attr.X1 where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X1 = X1

instance Attr Line_ X1 String where
  attr X1 bothValues = unsafeAttribute $ Both
    { key: "x1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x1", value: prop' value })
  pureAttr X1 value = unsafeAttribute $ This { key: "x1", value: prop' value }
  unpureAttr X1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x1", value: prop' value }

instance Attr LinearGradient_ X1 String where
  attr X1 bothValues = unsafeAttribute $ Both
    { key: "x1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "x1", value: prop' value })
  pureAttr X1 value = unsafeAttribute $ This { key: "x1", value: prop' value }
  unpureAttr X1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "x1", value: prop' value }

instance Attr everything X1 Unit where
  attr X1 bothValues = unsafeAttribute $ Both { key: "x1", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "x1", value: unset' })
  pureAttr X1 _ = unsafeAttribute $ This { key: "x1", value: unset' }
  unpureAttr X1 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "x1", value: unset' }
