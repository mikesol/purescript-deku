module Deku.DOM.Attr.OnStalled where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnStalled = OnStalled

instance Attr anything OnStalled Cb where
  pureAttr OnStalled value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "stalled", value: cb' value }
  mapAttr OnStalled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "stalled", value: cb' value }

instance Attr anything OnStalled (Effect Unit) where
  pureAttr OnStalled value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnStalled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stalled", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnStalled (Effect Boolean) where
  pureAttr OnStalled value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnStalled evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stalled", value: cb' (Cb (const value)) }

type OnStalledEffect =
  forall element
   . Attr element OnStalled (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnStalled Unit where
  pureAttr OnStalled _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stalled", value: unset' }
