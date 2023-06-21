module Deku.DOM.Attr.OnRatechange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnRatechange = OnRatechange

instance Attr anything OnRatechange Cb where
  pureAttr OnRatechange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnRatechange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ratechange", value: cb' value }

instance Attr anything OnRatechange (Effect Unit) where
  pureAttr OnRatechange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnRatechange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ratechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnRatechange (Effect Boolean) where
  pureAttr OnRatechange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnRatechange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ratechange", value: cb' (Cb (const value)) }

type OnRatechangeEffect =
  forall element
   . Attr element OnRatechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnRatechange Unit where
  pureAttr OnRatechange _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "ratechange", value: unset' }
