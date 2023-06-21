module Deku.DOM.Attr.OnSuspend where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSuspend = OnSuspend

instance Attr anything OnSuspend Cb where
  pureAttr OnSuspend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "suspend", value: cb' value }
  mapAttr OnSuspend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "suspend", value: cb' value }

instance Attr anything OnSuspend (Effect Unit) where
  pureAttr OnSuspend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "suspend", value: cb' (Cb (const (value $> true))) }
  mapAttr OnSuspend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "suspend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSuspend (Effect Boolean) where
  pureAttr OnSuspend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "suspend", value: cb' (Cb (const value)) }
  mapAttr OnSuspend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "suspend", value: cb' (Cb (const value)) }

type OnSuspendEffect =
  forall element
   . Attr element OnSuspend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSuspend Unit where
  pureAttr OnSuspend _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "suspend", value: unset' }

  mapAttr OnSuspend evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "suspend", value: unset' }