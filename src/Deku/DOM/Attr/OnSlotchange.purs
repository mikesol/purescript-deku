module Deku.DOM.Attr.OnSlotchange where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSlotchange = OnSlotchange

instance Attr anything OnSlotchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both
    { key: "slotchange", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "slotchange", value: cb' value })
instance Attr anything OnSlotchange  Cb  where
  attr OnSlotchange value = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: cb' value }
instance Attr anything OnSlotchange (Event.Event  Cb ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slotchange", value: cb' value }

instance Attr anything OnSlotchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both
    { key: "slotchange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "slotchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSlotchange  (Effect Unit)  where
  attr OnSlotchange value = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSlotchange (Event.Event  (Effect Unit) ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSlotchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both
    { key: "slotchange", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "slotchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSlotchange  (Effect Boolean)  where
  attr OnSlotchange value = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: cb' (Cb (const value)) }
instance Attr anything OnSlotchange (Event.Event  (Effect Boolean) ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const value)) }

type OnSlotchangeEffect =
  forall element
   . Attr element OnSlotchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSlotchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSlotchange bothValues = unsafeAttribute $ Both
    { key: "slotchange", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "slotchange", value: unset' })
instance Attr everything OnSlotchange  Unit  where
  attr OnSlotchange _ = unsafeAttribute $ This $ pure $
    { key: "slotchange", value: unset' }
instance Attr everything OnSlotchange (Event.Event  Unit ) where
  attr OnSlotchange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "slotchange", value: unset' }
