module Deku.DOM.Attr.Dur where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dur = Dur

instance Attr Animate_ Dur String where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dur", value: prop' value })
  pureAttr Dur value = unsafeAttribute $ This { key: "dur", value: prop' value }
  unpureAttr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr AnimateMotion_ Dur String where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dur", value: prop' value })
  pureAttr Dur value = unsafeAttribute $ This { key: "dur", value: prop' value }
  unpureAttr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr AnimateTransform_ Dur String where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dur", value: prop' value })
  pureAttr Dur value = unsafeAttribute $ This { key: "dur", value: prop' value }
  unpureAttr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr Set_ Dur String where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "dur", value: prop' value })
  pureAttr Dur value = unsafeAttribute $ This { key: "dur", value: prop' value }
  unpureAttr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr everything Dur Unit where
  attr Dur bothValues = unsafeAttribute $ Both { key: "dur", value: unset' }
    (snd bothValues <#> \_ -> { key: "dur", value: unset' })
  pureAttr Dur _ = unsafeAttribute $ This { key: "dur", value: unset' }
  unpureAttr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dur", value: unset' }
