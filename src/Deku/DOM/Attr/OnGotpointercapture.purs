module Deku.DOM.Attr.OnGotpointercapture where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnGotpointercapture = OnGotpointercapture

instance Attr anything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture", value: cb' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' value }
    )
instance Attr anything OnGotpointercapture  Cb  where
  attr OnGotpointercapture value = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: cb' value }
instance Attr anything OnGotpointercapture (Event.Event  Cb ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "gotpointercapture", value: cb' value }

instance Attr anything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnGotpointercapture  (Effect Unit)  where
  attr OnGotpointercapture value = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnGotpointercapture (Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const value)) }
    )
instance Attr anything OnGotpointercapture  (Effect Boolean)  where
  attr OnGotpointercapture value = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnGotpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) }

type OnGotpointercaptureEffect =
  forall element
   . Attr element OnGotpointercapture (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "gotpointercapture", value: unset' })
instance Attr everything OnGotpointercapture  Unit  where
  attr OnGotpointercapture _ = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: unset' }
instance Attr everything OnGotpointercapture (Event.Event  Unit ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "gotpointercapture", value: unset' }
