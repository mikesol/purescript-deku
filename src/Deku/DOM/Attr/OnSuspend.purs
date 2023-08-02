module Deku.DOM.Attr.OnSuspend where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSuspend = OnSuspend

instance Attr anything OnSuspend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSuspend bothValues = unsafeAttribute $ Both
    { key: "suspend", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "suspend", value: cb' value })
instance Attr anything OnSuspend  Cb  where
  attr OnSuspend value = unsafeAttribute $ This
    { key: "suspend", value: cb' value }
instance Attr anything OnSuspend (Event.Event  Cb ) where
  attr OnSuspend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "suspend", value: cb' value }

instance Attr anything OnSuspend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSuspend bothValues = unsafeAttribute $ Both
    { key: "suspend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "suspend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSuspend  (Effect Unit)  where
  attr OnSuspend value = unsafeAttribute $ This
    { key: "suspend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSuspend (Event.Event  (Effect Unit) ) where
  attr OnSuspend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "suspend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSuspend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSuspend bothValues = unsafeAttribute $ Both
    { key: "suspend", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "suspend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSuspend  (Effect Boolean)  where
  attr OnSuspend value = unsafeAttribute $ This
    { key: "suspend", value: cb' (Cb (const value)) }
instance Attr anything OnSuspend (Event.Event  (Effect Boolean) ) where
  attr OnSuspend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "suspend", value: cb' (Cb (const value)) }

type OnSuspendEffect =
  forall element
   . Attr element OnSuspend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSuspend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSuspend bothValues = unsafeAttribute $ Both
    { key: "suspend", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "suspend", value: unset' })
instance Attr everything OnSuspend  Unit  where
  attr OnSuspend _ = unsafeAttribute $ This
    { key: "suspend", value: unset' }
instance Attr everything OnSuspend (Event.Event  Unit ) where
  attr OnSuspend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "suspend", value: unset' }
