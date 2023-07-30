module Deku.DOM.Attr.Z where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Z = Z

instance Attr FePointLight_ Z String where
  attr Z bothValues = unsafeAttribute $ Both
    { key: "z", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "z", value: prop' value })
  pureAttr Z value = unsafeAttribute $ This { key: "z", value: prop' value }
  unpureAttr Z eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "z", value: prop' value }

instance Attr FeSpotLight_ Z String where
  attr Z bothValues = unsafeAttribute $ Both
    { key: "z", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "z", value: prop' value })
  pureAttr Z value = unsafeAttribute $ This { key: "z", value: prop' value }
  unpureAttr Z eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "z", value: prop' value }

instance Attr everything Z Unit where
  attr Z bothValues = unsafeAttribute $ Both { key: "z", value: unset' }
    (snd bothValues <#> \_ -> { key: "z", value: unset' })
  pureAttr Z _ = unsafeAttribute $ This { key: "z", value: unset' }
  unpureAttr Z eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "z", value: unset' }
