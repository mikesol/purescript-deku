module Deku.DOM.Attr.OnInvalid where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnInvalid = OnInvalid

instance Attr anything OnInvalid (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both
    { key: "invalid", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "invalid", value: cb' value })
instance Attr anything OnInvalid  Cb  where
  attr OnInvalid value = unsafeAttribute $ This
    { key: "invalid", value: cb' value }
instance Attr anything OnInvalid (Event.Event  Cb ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "invalid", value: cb' value }

instance Attr anything OnInvalid (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both
    { key: "invalid", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "invalid", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnInvalid  (Effect Unit)  where
  attr OnInvalid value = unsafeAttribute $ This
    { key: "invalid", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInvalid (Event.Event  (Effect Unit) ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInvalid (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both
    { key: "invalid", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "invalid", value: cb' (Cb (const value)) }
    )
instance Attr anything OnInvalid  (Effect Boolean)  where
  attr OnInvalid value = unsafeAttribute $ This
    { key: "invalid", value: cb' (Cb (const value)) }
instance Attr anything OnInvalid (Event.Event  (Effect Boolean) ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const value)) }

type OnInvalidEffect =
  forall element
   . Attr element OnInvalid (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInvalid (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnInvalid bothValues = unsafeAttribute $ Both
    { key: "invalid", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "invalid", value: unset' })
instance Attr everything OnInvalid  Unit  where
  attr OnInvalid _ = unsafeAttribute $ This
    { key: "invalid", value: unset' }
instance Attr everything OnInvalid (Event.Event  Unit ) where
  attr OnInvalid eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "invalid", value: unset' }
