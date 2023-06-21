module Deku.DOM.Attr.OnDurationchange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDurationchange = OnDurationchange

instance Attr anything OnDurationchange Cb where
  pureAttr OnDurationchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDurationchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "durationchange", value: cb' value }

instance Attr anything OnDurationchange (Effect Unit) where
  pureAttr OnDurationchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDurationchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "durationchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDurationchange (Effect Boolean) where
  pureAttr OnDurationchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDurationchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "durationchange", value: cb' (Cb (const value)) }

type OnDurationchangeEffect =
  forall element
   . Attr element OnDurationchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDurationchange Unit where
  pureAttr OnDurationchange _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "durationchange", value: unset' }
