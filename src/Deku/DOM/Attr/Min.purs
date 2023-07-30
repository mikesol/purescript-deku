module Deku.DOM.Attr.Min where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Min = Min

instance Attr Input_ Min String where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "min", value: prop' value })
  pureAttr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr Meter_ Min String where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "min", value: prop' value })
  pureAttr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr Animate_ Min String where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "min", value: prop' value })
  pureAttr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr AnimateMotion_ Min String where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "min", value: prop' value })
  pureAttr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr AnimateTransform_ Min String where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "min", value: prop' value })
  pureAttr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr Set_ Min String where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "min", value: prop' value })
  pureAttr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr everything Min Unit where
  attr Min bothValues = unsafeAttribute $ Both { key: "min", value: unset' }
    (snd bothValues <#> \_ -> { key: "min", value: unset' })
  pureAttr Min _ = unsafeAttribute $ This { key: "min", value: unset' }
  unpureAttr Min eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "min", value: unset' }
