module Deku.DOM.Attr.Ping where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ping = Ping

instance Attr A_ Ping String where
  attr Ping bothValues = unsafeAttribute $ Both
    { key: "ping", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "ping", value: prop' value })
  pureAttr Ping value = unsafeAttribute $ This
    { key: "ping", value: prop' value }
  unpureAttr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr Area_ Ping String where
  attr Ping bothValues = unsafeAttribute $ Both
    { key: "ping", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "ping", value: prop' value })
  pureAttr Ping value = unsafeAttribute $ This
    { key: "ping", value: prop' value }
  unpureAttr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr everything Ping Unit where
  attr Ping bothValues = unsafeAttribute $ Both { key: "ping", value: unset' }
    (snd bothValues <#> \_ -> { key: "ping", value: unset' })
  pureAttr Ping _ = unsafeAttribute $ This { key: "ping", value: unset' }
  unpureAttr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ping", value: unset' }
