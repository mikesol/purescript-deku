module Deku.DOM.Attr.Open where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Open = Open

instance Attr Details_ Open (NonEmpty.NonEmpty Event.Event  String ) where
  attr Open bothValues = unsafeAttribute $ Both
    { key: "open", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "open", value: prop' value })
instance Attr Details_ Open  String  where
  attr Open value = unsafeAttribute $ This
    { key: "open", value: prop' value }
instance Attr Details_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "open", value: prop' value }

instance Attr Dialog_ Open (NonEmpty.NonEmpty Event.Event  String ) where
  attr Open bothValues = unsafeAttribute $ Both
    { key: "open", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "open", value: prop' value })
instance Attr Dialog_ Open  String  where
  attr Open value = unsafeAttribute $ This
    { key: "open", value: prop' value }
instance Attr Dialog_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "open", value: prop' value }

instance Attr everything Open (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Open bothValues = unsafeAttribute $ Both { key: "open", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "open", value: unset' })
instance Attr everything Open  Unit  where
  attr Open _ = unsafeAttribute $ This { key: "open", value: unset' }
instance Attr everything Open (Event.Event  Unit ) where
  attr Open eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "open", value: unset' }
