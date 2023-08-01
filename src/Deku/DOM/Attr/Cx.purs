module Deku.DOM.Attr.Cx where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cx = Cx

instance Attr Circle_ Cx String where
  attr Cx bothValues = unsafeAttribute $ Both
    { key: "cx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cx", value: prop' value })
  pureAttr Cx value = unsafeAttribute $ This { key: "cx", value: prop' value }
  unpureAttr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cx", value: prop' value }

instance Attr Ellipse_ Cx String where
  attr Cx bothValues = unsafeAttribute $ Both
    { key: "cx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cx", value: prop' value })
  pureAttr Cx value = unsafeAttribute $ This { key: "cx", value: prop' value }
  unpureAttr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cx", value: prop' value }

instance Attr RadialGradient_ Cx String where
  attr Cx bothValues = unsafeAttribute $ Both
    { key: "cx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cx", value: prop' value })
  pureAttr Cx value = unsafeAttribute $ This { key: "cx", value: prop' value }
  unpureAttr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cx", value: prop' value }

instance Attr everything Cx Unit where
  attr Cx bothValues = unsafeAttribute $ Both { key: "cx", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "cx", value: unset' })
  pureAttr Cx _ = unsafeAttribute $ This { key: "cx", value: unset' }
  unpureAttr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cx", value: unset' }
