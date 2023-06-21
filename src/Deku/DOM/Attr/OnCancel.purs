module Deku.DOM.Attr.OnCancel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnCancel = OnCancel

instance Attr anything OnCancel Cb where
  pureAttr OnCancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "cancel", value: cb' value }
  mapAttr OnCancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "cancel", value: cb' value }

instance Attr anything OnCancel (Effect Unit) where
  pureAttr OnCancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "cancel", value: cb' (Cb (const (value $> true))) }
  mapAttr OnCancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCancel (Effect Boolean) where
  pureAttr OnCancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "cancel", value: cb' (Cb (const value)) }
  mapAttr OnCancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cancel", value: cb' (Cb (const value)) }

type OnCancelEffect =
  forall element
   . Attr element OnCancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCancel Unit where
  pureAttr OnCancel _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "cancel", value: unset' }
  mapAttr OnCancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "cancel", value: unset' }
