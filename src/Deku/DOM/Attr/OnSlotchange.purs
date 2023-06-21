module Deku.DOM.Attr.OnSlotchange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSlotchange = OnSlotchange

instance Attr anything OnSlotchange Cb where
  pureAttr OnSlotchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSlotchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "slotchange", value: cb' value }

instance Attr anything OnSlotchange (Effect Unit) where
  pureAttr OnSlotchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSlotchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "slotchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSlotchange (Effect Boolean) where
  pureAttr OnSlotchange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSlotchange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "slotchange", value: cb' (Cb (const value)) }

type OnSlotchangeEffect =
  forall element
   . Attr element OnSlotchange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSlotchange Unit where
  pureAttr OnSlotchange _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "slotchange", value: unset' }
