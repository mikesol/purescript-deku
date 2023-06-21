module Deku.DOM.Attr.OnGotpointercapture where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnGotpointercapture = OnGotpointercapture

instance Attr anything OnGotpointercapture Cb where
  pureAttr OnGotpointercapture value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "gotpointercapture", value: cb' value }
  mapAttr OnGotpointercapture evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "gotpointercapture", value: cb' value }

instance Attr anything OnGotpointercapture (Effect Unit) where
  pureAttr OnGotpointercapture value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
  mapAttr OnGotpointercapture evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnGotpointercapture (Effect Boolean) where
  pureAttr OnGotpointercapture value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "gotpointercapture", value: cb' (Cb (const value)) }
  mapAttr OnGotpointercapture evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "gotpointercapture", value: cb' (Cb (const value)) }

type OnGotpointercaptureEffect =
  forall element
   . Attr element OnGotpointercapture (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnGotpointercapture Unit where
  pureAttr OnGotpointercapture _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "gotpointercapture", value: unset' }

  mapAttr OnGotpointercapture evalue = unsafeAttribute $ Right $ evalue <#>
    \_ ->
      unsafeVolatileAttribute
        { key: "gotpointercapture", value: unset' }