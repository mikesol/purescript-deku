module Deku.DOM.Attr.Ping where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ping = Ping

instance Attr A_ Ping (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ping bothValues = unsafeAttribute $ Both
    { key: "ping", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "ping", value: prop' value })
instance Attr A_ Ping  String  where
  attr Ping value = unsafeAttribute $ This $ pure $
    { key: "ping", value: prop' value }
instance Attr A_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr Area_ Ping (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ping bothValues = unsafeAttribute $ Both
    { key: "ping", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "ping", value: prop' value })
instance Attr Area_ Ping  String  where
  attr Ping value = unsafeAttribute $ This $ pure $
    { key: "ping", value: prop' value }
instance Attr Area_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr everything Ping (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Ping bothValues = unsafeAttribute $ Both { key: "ping", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "ping", value: unset' })
instance Attr everything Ping  Unit  where
  attr Ping _ = unsafeAttribute $ This $ pure $ { key: "ping", value: unset' }
instance Attr everything Ping (Event.Event  Unit ) where
  attr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ping", value: unset' }
