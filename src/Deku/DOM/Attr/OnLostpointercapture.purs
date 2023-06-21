module Deku.DOM.Attr.OnLostpointercapture where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnLostpointercapture = OnLostpointercapture

instance Attr anything OnLostpointercapture Cb where
  pureAttr OnLostpointercapture value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLostpointercapture evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lostpointercapture", value: cb' value }

instance Attr anything OnLostpointercapture (Effect Unit) where
  pureAttr OnLostpointercapture value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLostpointercapture evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLostpointercapture (Effect Boolean) where
  pureAttr OnLostpointercapture value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnLostpointercapture evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "lostpointercapture", value: cb' (Cb (const value)) }

type OnLostpointercaptureEffect =
  forall element
   . Attr element OnLostpointercapture (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLostpointercapture Unit where
  pureAttr OnLostpointercapture _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "lostpointercapture", value: unset' }
