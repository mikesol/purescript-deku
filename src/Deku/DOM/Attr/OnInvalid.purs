module Deku.DOM.Attr.OnInvalid where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnInvalid = OnInvalid

instance Attr anything OnInvalid Cb where
  pureAttr OnInvalid value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "invalid", value: cb' value }
  mapAttr OnInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "invalid", value: cb' value }

instance Attr anything OnInvalid (Effect Unit) where
  pureAttr OnInvalid value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "invalid", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInvalid (Effect Boolean) where
  pureAttr OnInvalid value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnInvalid evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "invalid", value: cb' (Cb (const value)) }

type OnInvalidEffect =
  forall element
   . Attr element OnInvalid (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInvalid Unit where
  pureAttr OnInvalid _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "invalid", value: unset' }
