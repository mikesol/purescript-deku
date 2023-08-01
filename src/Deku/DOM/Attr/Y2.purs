module Deku.DOM.Attr.Y2 where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Y2 = Y2

instance Attr Line_ Y2 String where
  attr Y2 bothValues = unsafeAttribute $ Both
    { key: "y2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y2", value: prop' value })
  pureAttr Y2 value = unsafeAttribute $ This { key: "y2", value: prop' value }
  unpureAttr Y2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y2", value: prop' value }

instance Attr LinearGradient_ Y2 String where
  attr Y2 bothValues = unsafeAttribute $ Both
    { key: "y2", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "y2", value: prop' value })
  pureAttr Y2 value = unsafeAttribute $ This { key: "y2", value: prop' value }
  unpureAttr Y2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y2", value: prop' value }

instance Attr everything Y2 Unit where
  attr Y2 bothValues = unsafeAttribute $ Both { key: "y2", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "y2", value: unset' })
  pureAttr Y2 _ = unsafeAttribute $ This { key: "y2", value: unset' }
  unpureAttr Y2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "y2", value: unset' }
