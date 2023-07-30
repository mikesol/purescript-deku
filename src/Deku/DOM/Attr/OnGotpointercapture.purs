module Deku.DOM.Attr.OnGotpointercapture where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnGotpointercapture = OnGotpointercapture

instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture", value: cb' (fst bothValues) }
    ( snd bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' value }
    )
  pureAttr OnGotpointercapture value = unsafeAttribute $ This
    { key: "gotpointercapture", value: cb' value }
  unpureAttr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "gotpointercapture", value: cb' value }

instance Attr anything OnGotpointercapture (Effect Unit) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture"
    , value: cb' (Cb (const ((fst bothValues) $> true)))
    }
    ( snd bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnGotpointercapture value = unsafeAttribute $ This
    { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnGotpointercapture (Effect Boolean) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const value)) }
    )
  pureAttr OnGotpointercapture value = unsafeAttribute $ This
    { key: "gotpointercapture", value: cb' (Cb (const value)) }
  unpureAttr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) }

type OnGotpointercaptureEffect =
  forall element
   . Attr element OnGotpointercapture (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnGotpointercapture Unit where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both
    { key: "gotpointercapture", value: unset' }
    (snd bothValues <#> \_ -> { key: "gotpointercapture", value: unset' })
  pureAttr OnGotpointercapture _ = unsafeAttribute $ This
    { key: "gotpointercapture", value: unset' }
  unpureAttr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "gotpointercapture", value: unset' }
