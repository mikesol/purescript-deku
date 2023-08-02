module Deku.DOM.Attr.OnCancel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCancel = OnCancel

instance Attr anything OnCancel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnCancel bothValues = unsafeAttribute $ Both
    { key: "cancel", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "cancel", value: cb' value })
instance Attr anything OnCancel  Cb  where
  attr OnCancel value = unsafeAttribute $ This
    { key: "cancel", value: cb' value }
instance Attr anything OnCancel (Event.Event  Cb ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cancel", value: cb' value }

instance Attr anything OnCancel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnCancel bothValues = unsafeAttribute $ Both
    { key: "cancel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "cancel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCancel  (Effect Unit)  where
  attr OnCancel value = unsafeAttribute $ This
    { key: "cancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCancel (Event.Event  (Effect Unit) ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCancel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnCancel bothValues = unsafeAttribute $ Both
    { key: "cancel", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "cancel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCancel  (Effect Boolean)  where
  attr OnCancel value = unsafeAttribute $ This
    { key: "cancel", value: cb' (Cb (const value)) }
instance Attr anything OnCancel (Event.Event  (Effect Boolean) ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const value)) }

type OnCancelEffect =
  forall element
   . Attr element OnCancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCancel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnCancel bothValues = unsafeAttribute $ Both
    { key: "cancel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "cancel", value: unset' })
instance Attr everything OnCancel  Unit  where
  attr OnCancel _ = unsafeAttribute $ This { key: "cancel", value: unset' }
instance Attr everything OnCancel (Event.Event  Unit ) where
  attr OnCancel eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cancel", value: unset' }
