module Deku.DOM.Attr.OnWaiting where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnWaiting = OnWaiting

instance Attr anything OnWaiting Cb where
  pureAttr OnWaiting value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "waiting", value: cb' value }
  mapAttr OnWaiting evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "waiting", value: cb' value }

instance Attr anything OnWaiting (Effect Unit) where
  pureAttr OnWaiting value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "waiting", value: cb' (Cb (const (value $> true))) }
  mapAttr OnWaiting evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "waiting", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWaiting (Effect Boolean) where
  pureAttr OnWaiting value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "waiting", value: cb' (Cb (const value)) }
  mapAttr OnWaiting evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "waiting", value: cb' (Cb (const value)) }

type OnWaitingEffect =
  forall element
   . Attr element OnWaiting (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWaiting Unit where
  pureAttr OnWaiting _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "waiting", value: unset' }
  mapAttr OnWaiting evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "waiting", value: unset' }