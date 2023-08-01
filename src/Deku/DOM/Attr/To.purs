module Deku.DOM.Attr.To where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data To = To

instance Attr Animate_ To String where
  attr To bothValues = unsafeAttribute $ Both
    { key: "to", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
  pureAttr To value = unsafeAttribute $ This { key: "to", value: prop' value }
  unpureAttr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr AnimateMotion_ To String where
  attr To bothValues = unsafeAttribute $ Both
    { key: "to", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
  pureAttr To value = unsafeAttribute $ This { key: "to", value: prop' value }
  unpureAttr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr AnimateTransform_ To String where
  attr To bothValues = unsafeAttribute $ Both
    { key: "to", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
  pureAttr To value = unsafeAttribute $ This { key: "to", value: prop' value }
  unpureAttr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr Set_ To String where
  attr To bothValues = unsafeAttribute $ Both
    { key: "to", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
  pureAttr To value = unsafeAttribute $ This { key: "to", value: prop' value }
  unpureAttr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr everything To Unit where
  attr To bothValues = unsafeAttribute $ Both { key: "to", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "to", value: unset' })
  pureAttr To _ = unsafeAttribute $ This { key: "to", value: unset' }
  unpureAttr To eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "to", value: unset' }
