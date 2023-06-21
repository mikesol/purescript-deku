module Deku.DOM.Attr.OnError where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnError = OnError

instance Attr anything OnError Cb where
  pureAttr OnError value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "error", value: cb' value }
  mapAttr OnError evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "error", value: cb' value }

instance Attr anything OnError (Effect Unit) where
  pureAttr OnError value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "error", value: cb' (Cb (const (value $> true))) }
  mapAttr OnError evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "error", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnError (Effect Boolean) where
  pureAttr OnError value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "error", value: cb' (Cb (const value)) }
  mapAttr OnError evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "error", value: cb' (Cb (const value)) }

type OnErrorEffect =
  forall element
   . Attr element OnError (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnError Unit where
  pureAttr OnError _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "error", value: unset' }
  mapAttr OnError evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "error", value: unset' }
