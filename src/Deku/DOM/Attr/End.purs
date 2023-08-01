module Deku.DOM.Attr.End where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data End = End

instance Attr Animate_ End String where
  attr End bothValues = unsafeAttribute $ Both
    { key: "end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
  pureAttr End value = unsafeAttribute $ This { key: "end", value: prop' value }
  unpureAttr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr AnimateMotion_ End String where
  attr End bothValues = unsafeAttribute $ Both
    { key: "end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
  pureAttr End value = unsafeAttribute $ This { key: "end", value: prop' value }
  unpureAttr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr AnimateTransform_ End String where
  attr End bothValues = unsafeAttribute $ Both
    { key: "end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
  pureAttr End value = unsafeAttribute $ This { key: "end", value: prop' value }
  unpureAttr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr Set_ End String where
  attr End bothValues = unsafeAttribute $ Both
    { key: "end", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "end", value: prop' value })
  pureAttr End value = unsafeAttribute $ This { key: "end", value: prop' value }
  unpureAttr End eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "end", value: prop' value }

instance Attr everything End Unit where
  attr End bothValues = unsafeAttribute $ Both { key: "end", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "end", value: unset' })
  pureAttr End _ = unsafeAttribute $ This { key: "end", value: unset' }
  unpureAttr End eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "end", value: unset' }
