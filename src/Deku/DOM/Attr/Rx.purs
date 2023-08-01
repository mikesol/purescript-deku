module Deku.DOM.Attr.Rx where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rx = Rx

instance Attr Ellipse_ Rx String where
  attr Rx bothValues = unsafeAttribute $ Both
    { key: "rx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rx", value: prop' value })
  pureAttr Rx value = unsafeAttribute $ This { key: "rx", value: prop' value }
  unpureAttr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr Rect_ Rx String where
  attr Rx bothValues = unsafeAttribute $ Both
    { key: "rx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rx", value: prop' value })
  pureAttr Rx value = unsafeAttribute $ This { key: "rx", value: prop' value }
  unpureAttr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr everything Rx Unit where
  attr Rx bothValues = unsafeAttribute $ Both { key: "rx", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "rx", value: unset' })
  pureAttr Rx _ = unsafeAttribute $ This { key: "rx", value: unset' }
  unpureAttr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rx", value: unset' }
